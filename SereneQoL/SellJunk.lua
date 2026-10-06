-------------------------------------------------------------------------------
--  Sell Gray Items at Vendors
--  SellAllJunkItems() is fire-and-forget: the server drops sell requests past
--  its rate limit, and uncached item data at MERCHANT_SHOW is skipped, so one
--  call routinely strands grays -- re-count after each pass and fire again,
--  backing off while the count stands still. Gated on MERCHANT_SHOW/CLOSED,
--  not MerchantFrame:IsShown(): the interaction (not the frame) allows selling.
-------------------------------------------------------------------------------
local _, ns = ...

local BASE_DELAY = 0.4
local MAX_DELAY  = 1.6
local MAX_STALLS = 3

local merchantOpen = false
local pending, lastCount, stalls, delay, running
-- Value of every gray slot seen this visit: what is gone from them was sold.
local seen = {}

local function CountJunk()
    local junk, unknown, left = 0, 0, 0
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info then
                if info.quality == nil then
                    unknown = unknown + 1
                elseif info.quality == Enum.ItemQuality.Poor and not info.hasNoValue then
                    junk = junk + 1
                    local worth = (select(11, C_Item.GetItemInfo(info.itemID)) or 0) * info.stackCount
                    left = left + worth
                    seen[bag * 100 + slot] = worth
                end
            end
        end
    end
    return junk, unknown, left
end

local function Report()
    running = false
    local _, _, left = CountJunk()
    local sold = -left
    for _, worth in pairs(seen) do sold = sold + worth end
    if sold > 0 then
        ns.Print("Sold gray items for " .. C_CurrencyInfo.GetCoinTextureString(sold))
    end
end

local function Stop()
    if pending then pending:Cancel(); pending = nil end
end

local function Pass()
    pending = nil
    if not merchantOpen or not ns.Get("autoSellJunk") then return end

    local junk, unknown = CountJunk()
    if junk == 0 and unknown == 0 then Report() return end

    if junk == lastCount then
        -- Nothing sold: unsellable or rate-limited -- back off before giving up.
        stalls = stalls + 1
        delay = math.min(delay * 2, MAX_DELAY)
        if stalls >= MAX_STALLS then
            Report()
            if junk > 0 then ns.Print(format("%d gray item(s) could not be sold.", junk)) end
            return
        end
    else
        stalls, delay = 0, BASE_DELAY
    end

    lastCount = junk
    if junk > 0 then C_MerchantFrame.SellAllJunkItems() end
    pending = C_Timer.NewTimer(delay, Pass)
end

local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:RegisterEvent("MERCHANT_CLOSED")
f:SetScript("OnEvent", function(_, event)
    merchantOpen = event == "MERCHANT_SHOW"
    Stop()
    if running then Report() end
    if merchantOpen and ns.Get("autoSellJunk") then
        wipe(seen)
        running = true
        lastCount, stalls, delay = math.huge, 0, BASE_DELAY
        Pass()
    end
end)

ns.RegisterFeature({
    key = "autoSellJunk", label = "Sell gray items at vendors",
    section = "General", category = "Vendors & trainers",
})

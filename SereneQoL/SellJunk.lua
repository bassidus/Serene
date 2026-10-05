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
local pending, lastCount, stalls, delay

local function CountJunk()
    local junk, unknown = 0, 0
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info then
                if info.quality == nil then
                    unknown = unknown + 1
                elseif info.quality == Enum.ItemQuality.Poor and not info.hasNoValue then
                    junk = junk + 1
                end
            end
        end
    end
    return junk, unknown
end

local function Stop()
    if pending then pending:Cancel(); pending = nil end
end

local function Pass()
    pending = nil
    if not merchantOpen or not ns.Enabled("autoSellJunk") then return end

    local junk, unknown = CountJunk()
    if junk == 0 and unknown == 0 then return end

    if junk == lastCount then
        -- Nothing sold: unsellable or rate-limited -- back off before giving up.
        stalls = stalls + 1
        delay = math.min(delay * 2, MAX_DELAY)
        if stalls >= MAX_STALLS then
            if junk > 0 then ns.Print(format("%d junk item(s) could not be sold.", junk)) end
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
    if merchantOpen and ns.Enabled("autoSellJunk") then
        lastCount, stalls, delay = math.huge, 0, BASE_DELAY
        Pass()
    end
end)

ns.RegisterFeature({
    key = "autoSellJunk", label = "Sell gray items at vendors",
    section = "General", category = "Vendors & trainers",
})

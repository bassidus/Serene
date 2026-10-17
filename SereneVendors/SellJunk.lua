-------------------------------------------------------------------------------
--  Auto Sell -- junk (ns.IsJunk: grays and marked items) at vendors.
--  One UseContainerItem per slot, not SellAllJunkItems(): what that sells never
--  reaches the buyback tab. Buyback keeps only the last 12 sales, so the
--  cheapest go first. Sales are fire-and-forget: the server drops requests past
--  its rate limit, and uncached item data at MERCHANT_SHOW is skipped, so one
--  pass routinely strands junk -- re-count after each pass and fire again,
--  backing off while the count stands still. The first pass waits a moment,
--  so other addons that sell at MERCHANT_SHOW go first and their slots are
--  locked or gone by then. Gated on MERCHANT_SHOW/CLOSED, not
--  MerchantFrame:IsShown(): the interaction (not the frame) allows selling.
-------------------------------------------------------------------------------
local _, ns = ...

local BASE_DELAY = 0.4
local MAX_DELAY  = 1.6
local MAX_STALLS = 3

local merchantOpen = false
local pending, lastCount, stalls, delay, running
-- This pass's unlocked junk slots, as bag * 100 + slot, and their value.
local toSell, worth = {}, {}
-- Value of every slot sold to this visit. Only these count in the report, so
-- what other addons sell isn't claimed.
local sold = {}

local function ByWorth(a, b) return worth[a] < worth[b] end

local function CountJunk()
    local junk, unknown = 0, 0
    wipe(toSell)
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info then
                if info.quality == nil then
                    unknown = unknown + 1
                elseif ns.IsJunk(info.itemID, info.quality) and not info.hasNoValue then
                    junk = junk + 1
                    if not info.isLocked then
                        local key = bag * 100 + slot
                        worth[key] = (select(11, C_Item.GetItemInfo(info.itemID)) or 0) * info.stackCount
                        toSell[#toSell + 1] = key
                    end
                end
            end
        end
    end
    return junk, unknown
end

local function Report()
    running = false
    local total = 0
    for key, value in pairs(sold) do
        if not C_Container.GetContainerItemInfo(floor(key / 100), key % 100) then
            total = total + value
        end
    end
    wipe(sold)
    if total > 0 then
        ns.Print("Sold junk for " .. C_CurrencyInfo.GetCoinTextureString(total))
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
            if junk > 0 then ns.Print(format("%d junk item(s) could not be sold.", junk)) end
            return
        end
    else
        stalls, delay = 0, BASE_DELAY
    end

    lastCount = junk
    sort(toSell, ByWorth)
    for _, key in ipairs(toSell) do
        C_Container.UseContainerItem(floor(key / 100), key % 100)
        sold[key] = worth[key]
    end
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
        running = true
        lastCount, stalls, delay = math.huge, 0, BASE_DELAY
        pending = C_Timer.NewTimer(BASE_DELAY, Pass)
    end
end)

ns.RegisterFeature({
    key = "autoSellJunk", label = "Auto sell",
    section = "Quality of Life", category = "Vendors & trainers",
    tooltip = "Sells your junk when you open a vendor.",
})

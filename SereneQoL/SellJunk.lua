-------------------------------------------------------------------------------
--  Auto Sell Junk
--  SellAllJunkItems() is fire-and-forget: the server drops sell requests past
--  its rate limit, and uncached item data at MERCHANT_SHOW is skipped, so one
--  call routinely strands grays -- re-count after each pass and fire again
--  while still falling. Gated on MERCHANT_SHOW/CLOSED, not
--  MerchantFrame:IsShown(): the interaction (not the frame) allows selling.
-------------------------------------------------------------------------------
local _, ns = ...

-- Self-rescheduling timer that backs off, not a fixed ticker: a fixed
-- cadence against the limiter that ate the pass just gets eaten again.
local BASE_DELAY = 0.4
local MAX_DELAY  = 1.6
local MAX_PASSES = 12
local MAX_STALLS = 3

local merchantOpen = false
local pending, passes, lastCount, stalls, warned, delay

local function CountJunk()
    local junk, unknown = 0, 0
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID then
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

-- Clients without SellAllJunkItems: sell each gray by hand.
local function SellJunkManually()
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID and info.quality == Enum.ItemQuality.Poor
               and not info.hasNoValue and not info.isLocked then
                C_Container.UseContainerItem(bag, slot)
            end
        end
    end
end

local function SellAll()
    if C_MerchantFrame and C_MerchantFrame.SellAllJunkItems then
        C_MerchantFrame.SellAllJunkItems()
    else
        SellJunkManually()
    end
end

local function WarnLeftover(left)
    if left > 0 and not warned then
        warned = true
        ns.Print(format("%d junk item(s) could not be sold.", left))
    end
end

local function StopJunkSweep()
    if pending then pending:Cancel(); pending = nil end
end

local Pass
local function Schedule()
    pending = C_Timer.NewTimer(delay, Pass)
end

-- Verify-and-report only: the last sell is still in flight, so only a
-- re-count after the server answers says what stranded.
local function Report()
    pending = nil
    if not merchantOpen then return end
    WarnLeftover((CountJunk()))
end

Pass = function()
    pending = nil
    if not merchantOpen or not ns.Enabled("autoSellJunk") then return end

    local junk, unknown = CountJunk()
    if junk == 0 and unknown == 0 then return end

    passes = passes + 1
    if junk > lastCount then
        -- Count ROSE: uncached slots resolved into newly visible junk.
        stalls, delay = 0, BASE_DELAY
    elseif junk == lastCount then
        -- Nothing shifted: unsellable or rate-limited -- back off before giving up.
        stalls = stalls + 1
        delay = math.min(delay * 2, MAX_DELAY)
        if stalls >= MAX_STALLS then
            WarnLeftover(junk)
            return
        end
    else
        stalls, delay = 0, BASE_DELAY
    end

    lastCount = junk
    if junk > 0 then SellAll() end
    if passes >= MAX_PASSES then
        pending = C_Timer.NewTimer(delay, Report)
        return
    end
    Schedule()
end

local function SellJunk()
    StopJunkSweep()
    passes, lastCount, stalls, warned = 0, math.huge, 0, false
    delay = BASE_DELAY
    Pass()
end

local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:RegisterEvent("MERCHANT_CLOSED")
f:SetScript("OnEvent", function(_, event)
    if event == "MERCHANT_CLOSED" then
        merchantOpen = false
        return StopJunkSweep()
    end
    merchantOpen = true
    if ns.Enabled("autoSellJunk") then SellJunk() end
end)

ns.RegisterFeature({
    key = "autoSellJunk", label = "Auto Sell Junk", section = "QoL",
})

-------------------------------------------------------------------------------
--  Bars Enabled On All Characters -- the ticked bars (2-8) are turned on
--  for every character at every login. Unticked bars are the character's
--  own and are never hidden, so one character can show more bars than the
--  rest.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Action Bars"

-- Runs from PLAYER_LOGIN on, when the character's bar toggles are in.
-- Showing a protected bar waits for combat to end. The settings apply
-- together at login, so the bars are set once, a frame later.
local Sync
local waiter = CreateFrame("Frame")
waiter:SetScript("OnEvent", function(self, event)
    self:UnregisterEvent(event)
    Sync()
end)

local queued = false
local function Queue()
    if queued then return end
    queued = true
    C_Timer.After(0, function()
        queued = false
        Sync()
    end)
end

function Sync()
    if InCombatLockdown() then
        waiter:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    local toggles, changed = { GetActionBarToggles() }, false  -- bars 2-8
    for bar = 2, 8 do
        if ns.Get("showBar" .. bar) and not toggles[bar - 1] then toggles[bar - 1], changed = true, true end
    end
    if changed then SetActionBarToggles(unpack(toggles)) end
end

for bar = 2, 8 do
    ns.RegisterFeature({
        key = "showBar" .. bar, label = "Action Bar " .. bar, section = SECTION,
        category = "Bars enabled on all characters", default = false, beside = bar % 2 == 1 or nil, apply = Queue,
    })
end

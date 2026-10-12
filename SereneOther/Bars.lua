-------------------------------------------------------------------------------
--  Bars Enabled On All Characters -- the ticked bars (2-8) are turned on
--  for every character at every login. Unticked bars are the character's
--  own and are never hidden, so one character can show more bars than the
--  rest.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Other"

-- Runs from PLAYER_LOGIN on, when the character's bar toggles are in:
-- Blizzard shows the toggled bars on SETTINGS_LOADED, right after login, and
-- not again when the toggles change, so they must be set by then. Showing a
-- protected bar waits for combat to end.
local Sync
local waiter = CreateFrame("Frame")
waiter:SetScript("OnEvent", function(self, event)
    self:UnregisterEvent(event)
    Sync()
end)

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
        category = "New characters", default = false, beside = bar % 2 == 1 or nil, apply = Sync,
    })
end

-------------------------------------------------------------------------------
--  Always Shown Bars -- bars 2-8 shown on every character as ticked, set
--  again at every login.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Action bars"

-- Runs from PLAYER_LOGIN on, when the character's bar toggles are in.
-- Showing or hiding a protected bar waits for combat to end.
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
        local ticked = ns.Enabled("showBar" .. bar)
        if toggles[bar - 1] ~= ticked then toggles[bar - 1], changed = ticked, true end
    end
    if changed then SetActionBarToggles(unpack(toggles)) end
end

for bar = 2, 8 do
    ns.RegisterFeature({
        key = "showBar" .. bar, label = "Action Bar " .. bar, section = SECTION, category = "Always shown bars",
        default = false, beside = bar % 2 == 1 or nil, apply = Sync,
        note = bar == 8 and "Every character shows the ticked bars from its next login." or nil,
    })
end

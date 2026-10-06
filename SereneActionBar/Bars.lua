-------------------------------------------------------------------------------
--  Always Shown Bars -- turns the ticked bars (2-8) on for every character.
--  Each character remembers which ticks it has already followed and only
--  follows a change: a bar is turned on once, so a character that turns it
--  off again keeps it off, and unticking turns it off once. A bar that was
--  never ticked is the character's own and is left alone.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Action bars"

local function SetShown(bar, shown)
    local toggles = { GetActionBarToggles() }
    toggles[bar - 1] = shown
    SetActionBarToggles(unpack(toggles))
end

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
    SereneBarsSeen = SereneBarsSeen or {}
    local toggles = { GetActionBarToggles() }  -- bars 2-8
    for bar = 2, 8 do
        local ticked, shown = ns.Enabled("showBar" .. bar), toggles[bar - 1]
        if ticked ~= (SereneBarsSeen[bar] or false) and ticked ~= shown then SetShown(bar, ticked) end
        SereneBarsSeen[bar] = ticked or nil
    end
end

for bar = 2, 8 do
    ns.RegisterFeature({
        key = "showBar" .. bar, label = "Action Bar " .. bar, section = SECTION, category = "Always shown bars",
        default = false, beside = bar % 2 == 1 or nil, apply = Sync,
        note = bar == 8 and "Ticking or unticking reaches every character at its next login. "
            .. "A character can still turn a bar on or off itself." or nil,
    })
end

-------------------------------------------------------------------------------
--  Always Shown Bars -- bars 2-8 shown on every character as ticked.
--  A character's first sync matches the ticks exactly. After that it
--  remembers which ticks it has followed and only follows a change, so a
--  bar the character turns on or off itself stays that way until its tick
--  changes.
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
        if ticked ~= SereneBarsSeen[bar] and ticked ~= shown then SetShown(bar, ticked) end
        SereneBarsSeen[bar] = ticked
    end
end

for bar = 2, 8 do
    ns.RegisterFeature({
        key = "showBar" .. bar, label = "Action Bar " .. bar, section = SECTION, category = "Always shown bars",
        default = false, beside = bar % 2 == 1 or nil, apply = Sync,
        note = bar == 8 and "Every character shows the ticked bars from its next login. "
            .. "A character can still turn a bar on or off itself." or nil,
    })
end

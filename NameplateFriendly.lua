-------------------------------------------------------------------------------
--  Friendly Player Names -- Blizzard's friendly player nameplates outside
--  instances, as name-only, class colored and click-through: they look like
--  the usual names over players' heads. Having a plate gives the player a
--  unit, which is what lets Thank for Buffs see who buffed you.
--
--  Inside instances the plates go off and the game's own overhead names show.
--  Friendly plates the player turned on are left alone. SereneDB.friendPlatesSet
--  holds the LOOK values from before Serene turned the plates on. Nameplate
--  settings cannot change in combat; it waits.
-------------------------------------------------------------------------------
local _, ns = ...

local SHOW = "nameplateShowFriendlyPlayers"
local LOOK = {
    nameOnly   = "nameplateShowOnlyNameForFriendlyPlayerUnits",
    classColor = "nameplateUseClassColorForFriendlyPlayerUnitNames",
}

local f = CreateFrame("Frame")

local function ClickThrough(on)
    if C_NamePlate.SetNamePlateFriendlyClickThrough then C_NamePlate.SetNamePlateFriendlyClickThrough(on) end
end

local function Sync()
    if InCombatLockdown() then return f:RegisterEvent("PLAYER_REGEN_ENABLED") end
    local want = ns.Enabled("friendlyNames") and not IsInInstance()
    if want and GetCVar(SHOW) ~= "1" then
        local before = {}
        for k, cvar in pairs(LOOK) do before[k] = GetCVar(cvar) == "1" and "1" or "0" end
        SereneDB.friendPlatesSet = before
        SetCVar(SHOW, "1")
    elseif not want and SereneDB.friendPlatesSet then
        SetCVar(SHOW, "0")
        local before = type(SereneDB.friendPlatesSet) == "table" and SereneDB.friendPlatesSet or {}
        for k, cvar in pairs(LOOK) do SetCVar(cvar, before[k] == "1" and "1" or "0") end
        SereneDB.friendPlatesSet = nil
        ClickThrough(false)
    end
    -- Every time: the client may not keep click-through between sessions.
    if SereneDB.friendPlatesSet then
        for _, cvar in pairs(LOOK) do SetCVar(cvar, "1") end
        ClickThrough(true)
    end
end

f:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" then self:UnregisterEvent(event) end
    Sync()
end)

ns.RegisterFeature({
    key = "friendlyNames", label = "Friendly Player Names", section = "Nameplates", default = false,
    apply = function()
        if ns.Enabled("friendlyNames") then
            f:RegisterEvent("PLAYER_ENTERING_WORLD")
        else
            f:UnregisterEvent("PLAYER_ENTERING_WORLD")
        end
        Sync()
    end,
    tooltip = "Other players' names over their heads as Blizzard's friendly nameplates: name only, class "
        .. "colored and click-through. Off inside instances.",
    note = "Lets Thank for Buffs see who buffed you.",
})

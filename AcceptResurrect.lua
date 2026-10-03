-------------------------------------------------------------------------------
--  Accept Resurrection -- left alone while the caster is still in combat, so
--  you are not pulled back up mid-fight.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local POPUPS = { "RESURRECT", "RESURRECT_NO_SICKNESS", "RESURRECT_NO_TIMER" }

local pendingFrom

local function Accept()
    local from = pendingFrom
    pendingFrom = nil
    if not ns.Enabled("autoAcceptRes") or not UnitIsDeadOrGhost("player") then return end
    if from and Clean(UnitAffectingCombat(from)) then return end
    AcceptResurrect()
    for _, which in ipairs(POPUPS) do StaticPopup_Hide(which) end
    ns.Print("Accepted resurrection" .. (from and (" from " .. from) or "") .. ".")
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(_, _, inviter)
    pendingFrom = Clean(inviter)
    -- After Blizzard has shown its popup, so hiding it sticks.
    C_Timer.After(0.1, Accept)
end)

ns.RegisterFeature({
    key = "autoAcceptRes", label = "Accept Resurrections", section = "Social",
    apply = function()
        if ns.Enabled("autoAcceptRes") then
            f:RegisterEvent("RESURRECT_REQUEST")
        else
            f:UnregisterEvent("RESURRECT_REQUEST")
        end
    end,
    tooltip = "Accepts resurrections from other players automatically, unless the player casting it is "
        .. "still in combat.",
})

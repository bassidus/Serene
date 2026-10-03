-------------------------------------------------------------------------------
--  Accept Summon -- says yes to a summon (warlock ritual, meeting stone) on
--  its own. Never in combat: a summon offered mid-fight waits until combat
--  ends, and is taken then if it has not run out. The event is only
--  registered while the setting is on.
-------------------------------------------------------------------------------
local _, ns = ...

local issecret = issecretvalue
local function Clean(v)
    if issecret and issecret(v) then return nil end
    return v
end

local S = C_SummonInfo or {}
local TimeLeft = S.GetSummonConfirmTimeLeft or GetSummonConfirmTimeLeft
local Confirm = S.ConfirmSummon or ConfirmSummon
local Summoner = S.GetSummonConfirmSummoner or GetSummonConfirmSummoner
local AreaName = S.GetSummonConfirmAreaName or GetSummonConfirmAreaName

local f = CreateFrame("Frame")

local function Accept()
    if not ns.Enabled("autoAcceptSummon") or not (TimeLeft and Confirm) then return end
    if (TimeLeft() or 0) <= 0 then return end
    if UnitAffectingCombat("player") then
        f:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    local who = Summoner and Clean(Summoner())
    local where = AreaName and Clean(AreaName())
    Confirm()
    StaticPopup_Hide("CONFIRM_SUMMON")
    ns.Print("Accepted summon" .. (who and (" from " .. who) or "") .. (where and (" to " .. where) or "") .. ".")
end

f:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" then self:UnregisterEvent(event) end
    -- After Blizzard has shown its popup, so hiding it sticks.
    C_Timer.After(0.1, Accept)
end)

ns.RegisterFeature({
    key = "autoAcceptSummon", label = "Accept Summons", section = "Social",
    apply = function()
        if ns.Enabled("autoAcceptSummon") then
            f:RegisterEvent("CONFIRM_SUMMON")
        else
            f:UnregisterAllEvents()
        end
    end,
    tooltip = "Accepts summons automatically. A summon offered in combat is accepted when combat ends, "
        .. "if it is still open.",
})

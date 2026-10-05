-------------------------------------------------------------------------------
--  Hide Error Messages / Speech -- takes UI_ERROR_MESSAGE away from
--  UIErrorsFrame while hiding and hands it back after; the errors worth
--  acting on (bags full, not enough money...) are passed on by hand. Yellow
--  info messages are never touched.
-------------------------------------------------------------------------------
local _, ns = ...

local issecret = issecretvalue

-- Global string names of the errors that always show.
local KEEP_NAMES = {
    "ERR_INV_FULL", "ERR_BAG_FULL", "ERR_QUEST_LOG_FULL", "ERR_ITEM_MAX_COUNT",
    "ERR_NOT_ENOUGH_MONEY", "ERR_LOOT_GONE", "ERR_NO_ROOM_FOR_ITEM",
}
local keep

local function IsKept(msg)
    if not keep then
        keep = {}
        for _, name in ipairs(KEEP_NAMES) do
            local s = _G[name]
            if type(s) == "string" then keep[s] = true end
        end
    end
    return keep[msg]
end

local f = CreateFrame("Frame")
local hiding = false

local function SetHiding(on)
    if on == hiding or not UIErrorsFrame then return end
    hiding = on
    if on then
        UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
        f:RegisterEvent("UI_ERROR_MESSAGE")
    else
        f:UnregisterEvent("UI_ERROR_MESSAGE")
        UIErrorsFrame:RegisterEvent("UI_ERROR_MESSAGE")
    end
end

local function Update()
    local on = ns.Enabled("hideErrors")
    if on and ns.Get("hideErrorsWhen") == "combat" then
        on = UnitAffectingCombat("player") and true or false
    end
    SetHiding(on)
end

f:SetScript("OnEvent", function(_, event, _, msg)
    if event == "UI_ERROR_MESSAGE" then
        if type(msg) == "string" and not (issecret and issecret(msg)) and IsKept(msg) then
            if UIErrorsFrame.AddExternalErrorMessage then
                UIErrorsFrame:AddExternalErrorMessage(msg)
            else
                UIErrorsFrame:AddMessage(msg, 1, 0.1, 0.1)
            end
        end
        return
    end
    Update()  -- entering or leaving combat
end)

local function Apply()
    if ns.Enabled("hideErrors") and ns.Get("hideErrorsWhen") == "combat" then
        f:RegisterEvent("PLAYER_REGEN_DISABLED")
        f:RegisterEvent("PLAYER_REGEN_ENABLED")
    else
        f:UnregisterEvent("PLAYER_REGEN_DISABLED")
        f:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end
    Update()
end

ns.RegisterFeature({
    key = "hideErrors", label = "Hide error messages / speech", section = "General", category = "Interface",
    apply = Apply,
    tooltip = "Hides the red error text at the top of the screen and its voice line (\"Not enough rage\", \"Out of range\"...). "
        .. "Errors you need to act on, like full bags or not enough money, still show.",
})
ns.RegisterFeature({
    key = "hideErrorsWhen", label = "When to hide", section = "General", category = "Interface",
    type = "dropdown", default = "always",
    requires = "hideErrors", apply = Apply,
    tooltip = "Always, or only while you are in combat.",
    options = function()
        return {
            { value = "always", label = "Always" },
            { value = "combat", label = "Only in combat" },
        }
    end,
})

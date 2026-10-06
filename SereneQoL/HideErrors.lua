-------------------------------------------------------------------------------
--  Hide Error Messages / Speech -- takes UI_ERROR_MESSAGE away from
--  UIErrorsFrame while hiding and hands it back after; the errors worth
--  acting on (bags full, not enough money...) are passed on by hand. Yellow
--  info messages are never touched.
-------------------------------------------------------------------------------
local _, ns = ...

-- The errors that always show.
local KEEP = {}
for _, msg in ipairs({ ERR_INV_FULL, ERR_BAG_FULL, ERR_QUEST_LOG_FULL, ERR_ITEM_MAX_COUNT,
                       ERR_NOT_ENOUGH_MONEY, ERR_LOOT_GONE }) do
    KEEP[msg] = true
end

local f = CreateFrame("Frame")
local hiding = false

local function SetHiding(on)
    if on == hiding then return end
    hiding = on
    if on then
        UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
        f:RegisterEvent("UI_ERROR_MESSAGE")
    else
        f:UnregisterEvent("UI_ERROR_MESSAGE")
        UIErrorsFrame:RegisterEvent("UI_ERROR_MESSAGE")
    end
end

-- "combat" and "outOfCombat" follow combat; "always" and "never" do not.
local function ByCombat(when) return when == "combat" or when == "outOfCombat" end

local function Update()
    local when = ns.Get("hideErrors")
    if ByCombat(when) then
        SetHiding(UnitAffectingCombat("player") == (when == "combat"))
    else
        SetHiding(when == "always")
    end
end

f:SetScript("OnEvent", function(_, event, _, msg)
    if event == "UI_ERROR_MESSAGE" then
        msg = ns.Clean(msg)
        if msg and KEEP[msg] then UIErrorsFrame:AddExternalErrorMessage(msg) end
        return
    end
    Update()  -- entering or leaving combat
end)

local function Apply()
    if ByCombat(ns.Get("hideErrors")) then
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
    type = "dropdown", default = "never", apply = Apply,
    options = function()
        return {
            { value = "never",       label = "Never" },
            { value = "combat",      label = "In combat" },
            { value = "outOfCombat", label = "Out of combat" },
            { value = "always",      label = "Always" },
        }
    end,
})

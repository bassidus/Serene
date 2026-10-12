-------------------------------------------------------------------------------
--  Hide Error Messages / Speech -- takes UI_ERROR_MESSAGE away from
--  UIErrorsFrame while on and hands it back when turned off; the errors worth
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

f:SetScript("OnEvent", function(_, _, _, msg)
    msg = ns.Clean(msg)
    if msg and KEEP[msg] then UIErrorsFrame:AddExternalErrorMessage(msg) end
end)

ns.RegisterFeature({
    key = "hideErrors", label = "Hide error messages / speech", section = "General", category = "Interface",
    default = false, apply = function() SetHiding(ns.Get("hideErrors")) end,
})

-------------------------------------------------------------------------------
--  Tooltip Scale -- makes tooltips bigger or smaller, text, icons and all.
-------------------------------------------------------------------------------
local _, ns = ...

-- EmbeddedItemTooltip lives inside GameTooltip and follows its scale.
local TOOLTIPS = { "FriendsTooltip" }
for _, name in ipairs(ns.TOOLTIPS) do
    if name ~= "EmbeddedItemTooltip" then TOOLTIPS[#TOOLTIPS + 1] = name end
end

local function Apply()
    local scale = ns.Get("tooltipScale") / 100
    for _, name in ipairs(TOOLTIPS) do _G[name]:SetScale(scale) end
end

ns.RegisterFeature({
    key = "tooltipScale", label = "Scale", section = "Tooltip", category = "Settings",
    type = "slider", beside = true,
    min = 50, max = 150, step = 5, default = 100, suffix = "%", apply = Apply,
})

-------------------------------------------------------------------------------
--  Tooltip Scale -- makes tooltips bigger or smaller, text, icons and all.
-------------------------------------------------------------------------------
local _, ns = ...

-- EmbeddedItemTooltip lives inside GameTooltip and follows its scale.
local TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "FriendsTooltip", "GameSmallHeaderTooltip", "QuickKeybindTooltip",
}

local function Apply()
    local scale = ns.Get("tooltipScale") / 100
    for _, name in ipairs(TOOLTIPS) do _G[name]:SetScale(scale) end
end

ns.RegisterFeature({
    key = "tooltipScale", label = "Size", section = "Tooltip", category = "Appearance",
    type = "slider", beside = true,  -- to the right of Background opacity
    min = 50, max = 150, step = 5, default = 100, suffix = "%", apply = Apply,
})

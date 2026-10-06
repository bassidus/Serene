local _, ns = ...
setmetatable(ns, { __index = Serene })

-- The game's tooltips: GameTooltip and those built like it. EmbeddedItemTooltip
-- sits inside GameTooltip.
ns.TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "EmbeddedItemTooltip", "GameSmallHeaderTooltip", "QuickKeybindTooltip",
}

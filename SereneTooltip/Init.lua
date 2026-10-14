local _, ns = ...
setmetatable(ns, { __index = Serene })

-- The game's tooltips: GameTooltip and those built like it. EmbeddedItemTooltip
-- sits inside GameTooltip.
ns.TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "EmbeddedItemTooltip", "GameSmallHeaderTooltip", "QuickKeybindTooltip",
}

-- A tooltip's line font string (<name>TextLeft<i> / <name>TextRight<i>),
-- looked up once: Blizzard keeps them, and unit tooltips refresh several
-- times a second.
local lines = {}  -- [name] = { Left = { [i] = font string }, Right = { ... } }
function ns.TooltipLine(name, side, i)
    local sides = lines[name]
    if not sides then
        sides = { Left = {}, Right = {} }
        lines[name] = sides
    end
    local fs = sides[side][i]
    if not fs then
        fs = _G[name .. "Text" .. side .. i]
        sides[side][i] = fs
    end
    return fs
end

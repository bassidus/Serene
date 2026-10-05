-------------------------------------------------------------------------------
--  Tooltip Scale -- makes tooltips bigger or smaller, text, icons and all.
--  The tooltips are only touched once the setting is off 100%, and put
--  back once when it returns, so another addon's scale is left alone.
-------------------------------------------------------------------------------
local _, ns = ...

-- EmbeddedItemTooltip lives inside GameTooltip and follows its scale.
local TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "FriendsTooltip", "GameSmallHeaderTooltip", "QuickKeybindTooltip",
}

local scaled = false

local function Apply()
    local scale = ns.Get("tooltipScale") / 100
    if scale == 1 and not scaled then return end
    for _, name in ipairs(TOOLTIPS) do
        local tt = _G[name]
        if tt and not (tt.IsForbidden and tt:IsForbidden()) then tt:SetScale(scale) end
    end
    scaled = scale ~= 1
end

ns.RegisterFeature({
    key = "tooltipScale", label = "Size", section = "Tooltip", category = "Appearance",
    type = "slider", beside = true,  -- to the right of Background opacity
    min = 50, max = 150, step = 5, default = 100, suffix = "%", apply = Apply,
    tooltip = "Makes tooltips smaller or bigger, text and all. 100% is Blizzard's size.",
})

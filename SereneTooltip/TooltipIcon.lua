-------------------------------------------------------------------------------
--  Tooltip Icon -- the item's icon left of the tooltip's top corner, framed
--  in its quality color, on the hovered item and the ones it is compared
--  with. The icon is a child of the tooltip, so it hides and scales with it,
--  and goes away when the tooltip is cleared for something that isn't an
--  item. Comparison tooltips are moved apart to make room for the icons.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local SIZE = 30
local GAP = 2     -- between the icon and the tooltip
local EDGE = 1    -- quality frame around the icon

-- Each with its comparison tooltips.
local MAIN = { "GameTooltip", "ItemRefTooltip" }

local icons = {}  -- tooltip -> icon frame

local function CreateIcon(tt)
    local f = CreateFrame("Frame", nil, tt)
    f:SetSize(SIZE, SIZE)
    f:SetPoint("TOPRIGHT", tt, "TOPLEFT", -GAP, 0)
    f.edge = f:CreateTexture(nil, "BACKGROUND")
    f.edge:SetAllPoints()
    f.tex = f:CreateTexture(nil, "ARTWORK")
    f.tex:SetPoint("TOPLEFT", EDGE, -EDGE)
    f.tex:SetPoint("BOTTOMRIGHT", -EDGE, EDGE)
    f.tex:SetTexCoord(0.07, 0.93, 0.07, 0.93)  -- trim the icon's own border
    f:Hide()
    icons[tt] = f
end

local function OnItem(tt, data)
    if tt:IsForbidden() or not icons[tt] or not ns.Get("tooltipItemIcon") then return end
    local id = Clean(data.id)
    local texture = id and C_Item.GetItemIconByID(id)
    if not texture then return end
    local f = icons[tt]
    f.tex:SetTexture(texture)
    local quality = Clean(select(3, C_Item.GetItemInfo(id)))
    local r, g, b = 0, 0, 0
    if quality then r, g, b = C_Item.GetItemQualityColor(quality) end
    f.edge:SetColorTexture(r, g, b)
    f:Show()
end

for _, name in ipairs(MAIN) do
    local tt = _G[name]
    CreateIcon(tt)
    for _, shopping in ipairs(tt.shoppingTooltips) do CreateIcon(shopping) end
end
for tt in pairs(icons) do
    tt:HookScript("OnTooltipCleared", function(self) icons[self]:Hide() end)
end
TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnItem)

-- Blizzard lines the tooltips up edge to edge, and every one of them has its
-- icon on its left. A tooltip placed to the left of another (its right edge
-- or top right corner on the other's left side) slides left past the other's
-- icon; one placed to the right slides right past its own. The x offset is
-- nil on those anchors only (the TOP anchor gets 0), and set on our own call,
-- which ends the recursion. Hooked on SetPoint: Blizzard anchors them twice
-- per item, the second time from a copy of TooltipComparisonManager that a
-- hook on the manager doesn't reach.
local SHIFT = SIZE + 2 * GAP
local SLIDE = { RIGHT = -SHIFT, TOPRIGHT = -SHIFT, LEFT = SHIFT, TOPLEFT = SHIFT }

local function OnSetPoint(self, point, relativeTo, relativePoint, x)
    local slide = SLIDE[point]
    if not slide or x ~= nil or not icons[relativeTo] or not ns.Get("tooltipItemIcon") then return end
    self:SetPoint(point, relativeTo, relativePoint, slide, 0)
end

for _, name in ipairs(MAIN) do
    for _, shopping in ipairs(_G[name].shoppingTooltips) do
        hooksecurefunc(shopping, "SetPoint", OnSetPoint)
    end
end

ns.RegisterFeature({
    key = "tooltipItemIcon", label = "Item icon", section = "Tooltip", category = "Content",
    apply = function()
        if ns.Get("tooltipItemIcon") then return end
        for _, f in pairs(icons) do f:Hide() end
    end,
})

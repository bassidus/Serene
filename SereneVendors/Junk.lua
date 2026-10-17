-------------------------------------------------------------------------------
--  Mark Junk -- Space over a bag item marks it as junk or clears the mark.
--  Junk is grayed out with a bloody cross and Auto sell sells it. Gray items
--  start out marked. Bags/ holds one file per bag addon.
-------------------------------------------------------------------------------
local _, ns = ...

local KEY = "SPACE"

-- Item IDs, per character: true for marked, false for a gray item unmarked.
-- Grays with no entry are junk. Saved variables arrive after the files run,
-- so the list is read late.
local function List()
    SereneVendorsDB = SereneVendorsDB or {}
    return SereneVendorsDB
end

-- With marking off, only grays are junk, which Auto sell then sells.
function ns.IsJunk(itemID, quality)
    local mark = ns.Get("junkMarking") and List()[itemID]
    if mark == nil then return quality == Enum.ItemQuality.Poor end
    return mark
end

-- What the bags cross out: nothing while marking is off.
function ns.IsCrossed(itemID, quality)
    return ns.Get("junkMarking") and ns.IsJunk(itemID, quality)
end

ns.repaints = {}

local function Refresh()
    for _, repaint in ipairs(ns.repaints) do repaint() end
end

-- Strokes as fractions of the icon, x from its left and y from its top, so
-- they fit a grid slot and a 20 px List row icon alike.
local STROKES = {
    { 0, 0, 1, 1 },
    { 1, 0, 0, 1 },
}
-- Lines lack a taper, so each stroke stacks a long thin dark line under
-- shorter, thicker, brighter ones: pointed ends, wet middle. Thickness is in
-- pixels on a 37 px icon, insets are shares of the icon.
local LAYERS = {
    { 1,   0.03, { 0.3, 0, 0, 0.9 } },
    { 2,   0.14, { 0.55, 0.02, 0.02, 0.95 } },
    { 3.5, 0.25, { 0.8, 0.05, 0.05, 1 } },
}

-- The small cross: its side and its gap to the icon's top and right edges,
-- as shares of the icon.
local SMALL = 0.4
local MARGIN = 0.06

local function LayOut(mark)
    local w, h = mark:GetSize()
    if w == 0 then return end
    local size, left, top = 1, 0, 0
    if ns.Get("junkSmallCross") then size, left, top = SMALL, 1 - MARGIN - SMALL, MARGIN end
    local n = 0
    for _, stroke in ipairs(STROKES) do
        local x1, y1, x2, y2 = unpack(stroke)
        local dx, dy = x2 - x1, y2 - y1
        for _, spec in ipairs(LAYERS) do
            n = n + 1
            local line = mark.lines[n]
            local thickness, inset = spec[1], spec[2]
            -- Thickness follows the icon, not the cross, so a small cross
            -- stays as legible as a full one.
            line:SetThickness(math.max(1, thickness * w / 37))
            line:SetStartPoint("TOPLEFT", mark,
                (left + (x1 + inset * dx) * size) * w, -(top + (y1 + inset * dy) * size) * h)
            line:SetEndPoint("TOPLEFT", mark,
                (left + (x2 - inset * dx) * size) * w, -(top + (y2 - inset * dy) * size) * h)
        end
    end
end

-- Every mark ever made, to lay them out again when the cross changes.
-- Baganator makes its own through ns.NewMark, so they are kept here.
local made = {}

-- A frame over the icon, so all the cross's lines show and hide together and
-- are laid out again whenever the icon is resized.
function ns.NewMark(parent, icon)
    local mark = CreateFrame("Frame", nil, parent)
    mark:SetAllPoints(icon)
    mark.lines = {}
    for _ in ipairs(STROKES) do
        for layer, spec in ipairs(LAYERS) do
            local line = mark:CreateLine(nil, "OVERLAY", nil, 4 + layer)
            line:SetColorTexture(unpack(spec[3]))
            mark.lines[#mark.lines + 1] = line
        end
    end
    mark:SetScript("OnSizeChanged", LayOut)
    LayOut(mark)
    made[#made + 1] = mark
    return mark
end

local marks = {}

function ns.ShowMark(parent, icon, marked)
    if marked and not marks[parent] then marks[parent] = ns.NewMark(parent, icon) end
    local mark = marks[parent]
    if mark then mark:SetShown(marked) end
    return mark
end

-------------------------------------------------------------------------------
--  Space over a bag item. Every bag addon calls GameTooltip:SetBagItem on
--  hover, which is where the hovered slot comes from. Space is caught by a
--  keyboard frame that is shown only while that tooltip is up, and only out
--  of combat: keyboard propagation can't be set in combat.
-------------------------------------------------------------------------------
local hoveredBag, hoveredSlot

local function Toggle()
    local info = C_Container.GetContainerItemInfo(hoveredBag, hoveredSlot)
    if not info then return end
    if info.hasNoValue then
        ns.Print(info.hyperlink .. " can't be sold.")
        return
    end
    local junk = not ns.IsJunk(info.itemID, info.quality)
    -- Only what differs from an item's quality is kept, so toggling twice
    -- leaves no trace.
    local gray = info.quality == Enum.ItemQuality.Poor
    if junk == gray then
        List()[info.itemID] = nil
    else
        List()[info.itemID] = junk
    end
    Refresh()
end

local keys = CreateFrame("Frame")
keys:Hide()
keys:EnableKeyboard(true)
keys:SetScript("OnKeyDown", function(self, key)
    local caught = key == KEY and not IsModifierKeyDown()
    self:SetPropagateKeyboardInput(not caught)
    if caught then Toggle() end
end)
keys:RegisterEvent("PLAYER_REGEN_DISABLED")
keys:SetScript("OnEvent", keys.Hide)

hooksecurefunc(GameTooltip, "SetBagItem", function(_, bag, slot)
    hoveredBag, hoveredSlot = bag, slot
    if ns.Get("junkMarking") and not InCombatLockdown() then keys:Show() end
end)
-- SetBagItem clears the tooltip before the hook above runs.
GameTooltip:HookScript("OnTooltipCleared", function() keys:Hide() end)
GameTooltip:HookScript("OnHide", function() keys:Hide() end)

local loaded
ns.RegisterFeature({
    key = "junkMarking", label = "Mark junk with Space",
    section = "Quality of Life", category = "Vendors & trainers",
    tooltip = "Space over a bag item marks it as junk or clears the mark.",
    apply = function()
        -- Login's apply: the bags paint their marks as they open.
        if not loaded then loaded = true; return end
        Refresh()
    end,
})
ns.RegisterFeature({
    key = "junkSmallCross", label = "Smaller cross", section = "Quality of Life", category = "Vendors & trainers",
    tooltip = "A small cross in the icon's top-right corner.",
    default = false, requires = "junkMarking",
    apply = function()
        for _, mark in ipairs(made) do LayOut(mark) end
    end,
})

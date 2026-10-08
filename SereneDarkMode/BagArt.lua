-------------------------------------------------------------------------------
--  Bag Art -- the bag windows, separate bags and combined: the metal frame,
--  the slots' rims and empty slots, gray quality borders, the search box,
--  the money and currency bars, and a darker background. Slot buttons are
--  made and reused as bags open, so new ones are picked up whenever a bag
--  updates.
-------------------------------------------------------------------------------
local _, ns = ...

local ART = {
    [8069114] = true, [8069116] = true, [8069118] = true,  -- Forever's metal frame
    [130841] = true,                                       -- a slot's rim
    [4701877] = true, [4701880] = true,                    -- the money and currency bars
    [8086476] = true,                                      -- the search box
}
local EMPTY_SLOT = "bags-item-slot64"

local function IsArt(tex) return ART[tex:GetTexture()] end

local function IsEmpty(icon) return icon:GetAtlas() == EMPTY_SLOT end

-- The search box and the currency bar move to whichever window holds the
-- backpack.
ns.AddDarkArt("BagItemSearchBox", IsArt)
ns.AddDarkArt("BackpackTokenFrame", IsArt)

-------------------------------------------------------------------------------
--  Tinted parts: Blizzard colors these itself, so they are darkened from the
--  color Blizzard gives them rather than painted over.
--  The background is already a dark see-through tint. An item's quality
--  border is gray for poor and common items, which goes dark; the colored
--  ones keep showing the quality.
-------------------------------------------------------------------------------
local BG = 0.5
local GRAY_BORDER = 0.4

local function Background() return BG end

local function QualityBorder(c)
    local gray = math.abs(c[1] - c[2]) < 0.01 and math.abs(c[2] - c[3]) < 0.01
    return gray and GRAY_BORDER or 1
end

local colors = {}   -- [texture] = { r, g, b, a } from Blizzard
local factors = {}  -- [texture] = fn(color) giving its darkening in Dark mode
local tinting  -- Tint's own SetVertexColor also runs the hook

local function Tint(tex)
    local c = colors[tex]
    local k = ns.Get("darkMode") and factors[tex](c) or 1
    tinting = true
    tex:SetVertexColor(c[1] * k, c[2] * k, c[3] * k, c[4])
    tinting = false
end

local function AddTint(tex, factor)
    if colors[tex] then return end
    colors[tex] = { tex:GetVertexColor() }
    factors[tex] = factor
    hooksecurefunc(tex, "SetVertexColor", function(self, r, g, b, a)
        if tinting then return end
        colors[self] = { r, g, b, a or 1 }
        Tint(self)
    end)
    Tint(tex)
end

ns.OnDarkMode(function()
    for tex in pairs(colors) do Tint(tex) end
end)

-------------------------------------------------------------------------------
local searched = {}  -- [bag window or slot button] = true once searched

local function Update(bag)
    if not searched[bag] then
        searched[bag] = true
        ns.AddDarkArtNow(bag, IsArt)
        for _, r in ipairs({ bag.Bg:GetRegions() }) do
            if r:GetObjectType() == "Texture" then AddTint(r, Background) end
        end
    end
    for _, button in ipairs({ bag:GetChildren() }) do
        if button.GetBagID and button.icon and not searched[button] then
            searched[button] = true
            ns.AddDarkArtNow(button, IsArt)
            ns.AddDarkSlot(button.icon, IsEmpty)
            AddTint(button.IconBorder, QualityBorder)
        end
    end
end

hooksecurefunc(ContainerFrameCombinedBags, "UpdateItems", Update)
local i = 1
while _G["ContainerFrame" .. i] do
    hooksecurefunc(_G["ContainerFrame" .. i], "UpdateItems", Update)
    i = i + 1
end

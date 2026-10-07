-------------------------------------------------------------------------------
--  Bag Art -- the bag windows, separate bags and combined: the metal frame,
--  the slots' rims, empty slots, dimmed items and counts, gray quality
--  borders, the search box, the money and currency bars with dimmed money,
--  and a darker background. Slot buttons are made and reused as bags open,
--  so new ones are picked up whenever a bag updates.
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
--  Tinted parts: the background is already a dark see-through tint. An
--  item's quality border is gray for poor and common items, which goes
--  dark; the colored ones keep showing the quality.
-------------------------------------------------------------------------------
local BG = 0.5
local GRAY_BORDER = 0.4

local function Background() return BG end

local function QualityBorder(c)
    local gray = math.abs(c[1] - c[2]) < 0.01 and math.abs(c[2] - c[3]) < 0.01
    return gray and GRAY_BORDER or 1
end

-- The money bar's coins and amounts, dimmed like the items and their counts.
local COIN_BUTTON = { "GoldButton$", "SilverButton$", "CopperButton$" }

local function IsCoinButton(frame)
    local name = frame:GetName() or ""
    for _, pattern in ipairs(COIN_BUTTON) do
        if name:find(pattern) then return true end
    end
    return false
end

local function AddMoney(frame)
    for _, child in ipairs({ frame:GetChildren() }) do
        if IsCoinButton(child) then
            ns.AddDarkText(child:GetFontString())
            for _, r in ipairs({ child:GetRegions() }) do
                if r:GetObjectType() == "Texture" and (r:GetAtlas() or ""):find("^Coin%-") then
                    ns.AddDarkTint(r, ns.DimIcon)
                end
            end
        end
        AddMoney(child)
    end
end

-------------------------------------------------------------------------------
local searched = {}  -- [bag window or slot button] = true once searched

local function Update(bag)
    if not searched[bag] then
        searched[bag] = true
        ns.AddDarkArtNow(bag, IsArt)
        AddMoney(bag)
        for _, r in ipairs({ bag.Bg:GetRegions() }) do
            if r:GetObjectType() == "Texture" then ns.AddDarkTint(r, Background) end
        end
    end
    for _, button in ipairs({ bag:GetChildren() }) do
        if button.GetBagID and button.icon and not searched[button] then
            searched[button] = true
            ns.AddDarkArtNow(button, IsArt)
            ns.AddDarkTint(button.icon, ns.DimIcon, IsEmpty)
            ns.AddDarkTint(button.IconBorder, QualityBorder)
            ns.AddDarkText(button.Count)
        end
    end
end

hooksecurefunc(ContainerFrameCombinedBags, "UpdateItems", Update)
local i = 1
while _G["ContainerFrame" .. i] do
    hooksecurefunc(_G["ContainerFrame" .. i], "UpdateItems", Update)
    i = i + 1
end

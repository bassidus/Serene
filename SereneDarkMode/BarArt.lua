-------------------------------------------------------------------------------
--  Bar Art -- the action bars, the bag bar, the micro menu and the
--  experience bar.
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
--  Bar art: Forever's bar art (frame, wyverns, dividers, button rims) is
--  bronze, drawn from these files; desaturated and darkened (Dark mode) it
--  recedes behind the icons.
--  The micro menu's sheet also holds its colored icons, and the experience
--  bar's sheet its fills, so only the parts named here.
-------------------------------------------------------------------------------
local BRONZE = {
    [7948326] = true, [8154526] = true, [8119721] = true,
    [8200846] = { "ButtonBG" },
    [8143695] = { "ExperienceBar-Frame", "ExperienceBar-Divider" },
}

-- The rims around action buttons and bag slots and the micro menu's frame
-- go almost black; the micro buttons' own rims a little less.
local DARK_RIMS = 0.1
local DARK_MICRO_BUTTONS = 0.25
local MICRO_SHEET = 8200846

local buttonRims = {}  -- [texture] = true
ns.EachActionButton(function(btn) buttonRims[btn.NormalTexture] = true end)

local function IsBronze(tex)
    local file = BRONZE[tex:GetTexture()]
    if file == true or not file then return file end
    local atlas = tex:GetAtlas() or ""
    for _, part in ipairs(file) do
        if atlas:find(part, 1, true) then return true end
    end
    return false
end

local function Darkness(tex)
    if buttonRims[tex] or (tex:GetAtlas() or ""):lower():find("iconframe-bags", 1, true) then return DARK_RIMS end
end

local function MicroDarkness(tex)
    return tex:GetTexture() == MICRO_SHEET and DARK_MICRO_BUTTONS or DARK_RIMS
end

for _, name in ipairs({ "MainActionBar", "BagsBar", "StatusTrackingBarManager" }) do
    ns.AddDarkArt(name, IsBronze, Darkness)
end
ns.AddDarkArt("MicroMenuContainer", IsBronze, MicroDarkness)
ns.EachActionButton(function(btn) ns.AddDarkArt(btn:GetName(), IsBronze, Darkness) end)

-- The micro menu's background art is see-through in the image itself, so
-- whatever is behind the menu shows through. A dark gray fill under it,
-- inside the frame, closes it; black was darker than the bars beside it.
local MICRO_INSET = 4
local MICRO_FILL = 0.15
local microFill = MicroMenu:CreateTexture(nil, "BACKGROUND", nil, -8)
microFill:SetColorTexture(MICRO_FILL, MICRO_FILL, MICRO_FILL)
microFill:SetPoint("TOPLEFT", MicroMenu.BorderArt, MICRO_INSET, -MICRO_INSET)
microFill:SetPoint("BOTTOMRIGHT", MicroMenu.BorderArt, -MICRO_INSET, MICRO_INSET)
ns.OnDarkMode(function() microFill:SetShown(ns.Get("darkMode")) end)

-- An empty bag slot shows bronze in its icon texture.
local EMPTY_BAG = 4760248
local BAG_SLOTS = { "CharacterBag0Slot", "CharacterBag1Slot", "CharacterBag2Slot", "CharacterBag3Slot", "CharacterReagentBag0Slot" }

local function IsEmptyBag(icon) return icon:GetTexture() == EMPTY_BAG end

for _, name in ipairs(BAG_SLOTS) do ns.AddDarkSlot(_G[name .. "IconTexture"], IsEmptyBag) end

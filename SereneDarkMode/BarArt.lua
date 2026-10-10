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

-- The bag slots' rims are a brighter gold than the rest and need more to
-- match.
local DARK_BAGS = 0.25

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
    if (tex:GetAtlas() or ""):lower():find("iconframe-bags", 1, true) then return DARK_BAGS end
end

for _, name in ipairs({ "MainActionBar", "BagsBar", "MicroMenuContainer", "StatusTrackingBarManager" }) do
    ns.AddDarkArt(name, IsBronze, Darkness)
end
ns.EachActionButton(function(btn) ns.AddDarkArt(btn:GetName(), IsBronze, Darkness) end)

-- An empty bag slot shows bronze in its icon texture.
local EMPTY_BAG = 4760248
local BAG_SLOTS = { "CharacterBag0Slot", "CharacterBag1Slot", "CharacterBag2Slot", "CharacterBag3Slot", "CharacterReagentBag0Slot" }

local function IsEmptyBag(icon) return icon:GetTexture() == EMPTY_BAG end

for _, name in ipairs(BAG_SLOTS) do ns.AddDarkSlot(_G[name .. "IconTexture"], IsEmptyBag) end

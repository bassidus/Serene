-------------------------------------------------------------------------------
--  Bar Art -- the action bars, the bag bar, the micro menu and the
--  experience bar in Dark mode.
-------------------------------------------------------------------------------
local _, ns = ...

-- fn(button) for every action button.
local function EachButton(fn)
    for _, bar in ipairs(ns.ACTION_BUTTONS) do
        for i = 1, bar[3] do fn(_G[bar[1] .. i]) end
    end
end

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

local bronze = {}  -- [texture] = true, every bronze texture found

local DARK = 0.4
-- The bag slots' rims are a brighter gold than the rest and need more to
-- match.
local DARK_BAGS = 0.25

local function Paint(tex)
    local dark = ns.Get("darkMode")
    local v = 1
    if dark then
        v = (tex:GetAtlas() or ""):lower():find("iconframe-bags", 1, true) and DARK_BAGS or DARK
    end
    tex:SetDesaturated(dark)
    tex:SetVertexColor(v, v, v)
end

local function Repaint(tex)
    if ns.Get("darkMode") then Paint(tex) end
end

local function IsBronze(tex)
    local file = BRONZE[tex:GetTexture()]
    if file == true or not file then return file end
    local atlas = tex:GetAtlas() or ""
    for _, part in ipairs(file) do
        if atlas:find(part, 1, true) then return true end
    end
    return false
end

local function Collect(frame)
    for _, r in ipairs({ frame:GetRegions() }) do
        if r:GetObjectType() == "Texture" and not bronze[r] and IsBronze(r) then
            bronze[r] = true
            -- Blizzard swaps the atlas on some (a bar's empty-slot rims).
            hooksecurefunc(r, "SetAtlas", Repaint)
        end
    end
    for _, child in ipairs({ frame:GetChildren() }) do Collect(child) end
end

-- An empty bag slot shows bronze in its icon texture, which turns into the
-- bag's icon once a bag is equipped there.
local EMPTY_BAG = 4760248
local BAG_SLOTS = { "CharacterBag0Slot", "CharacterBag1Slot", "CharacterBag2Slot", "CharacterBag3Slot", "CharacterReagentBag0Slot" }

local emptySlots = {}  -- [icon texture] = true while it shows EMPTY_BAG
local painting  -- PaintSlot's own color calls also run its hooks

local function PaintSlot(tex)
    if painting then return end
    painting = true
    if tex:GetTexture() == EMPTY_BAG then
        emptySlots[tex] = true
        Paint(tex)
    elseif emptySlots[tex] then
        emptySlots[tex] = nil
        tex:SetDesaturated(false)
        tex:SetVertexColor(1, 1, 1)
    end
    painting = false
end

local function ApplyArt()
    if ns.Get("darkMode") and not next(bronze) then
        for _, frame in ipairs({ MainActionBar, BagsBar, MicroMenuContainer, StatusTrackingBarManager }) do Collect(frame) end
        EachButton(Collect)
        -- Blizzard's bag update resets the icon's color after login.
        for _, name in ipairs(BAG_SLOTS) do
            local icon = _G[name .. "IconTexture"]
            hooksecurefunc(icon, "SetTexture", PaintSlot)
            hooksecurefunc(icon, "SetDesaturated", PaintSlot)
            hooksecurefunc(icon, "SetVertexColor", PaintSlot)
        end
    end
    for tex in pairs(bronze) do Paint(tex) end
    for _, name in ipairs(BAG_SLOTS) do PaintSlot(_G[name .. "IconTexture"]) end
end

ns.OnDarkMode(ApplyArt)

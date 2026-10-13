-------------------------------------------------------------------------------
--  Pet Frame Clicks -- Blizzard's pet frame only takes the mouse over its
--  portrait (66 of its 120 pixels are cut off its hit rect on the right), so
--  clicks on its name and bars did nothing. A button over the whole frame
--  passes every click on to the pet frame itself: left targets, right opens
--  its menu, as Blizzard has them.
-------------------------------------------------------------------------------
local _, ns = ...

local clicks = CreateFrame("Button", nil, PetFrame, "SecureActionButtonTemplate")
-- The art fills the pet frame, and a protected frame can't be anchored to
-- a texture anyway.
clicks:SetAllPoints(PetFrame)
-- Below the bars, which keep their mouseover text.
clicks:SetFrameLevel(PetFrame:GetFrameLevel())
clicks:RegisterForClicks("AnyUp")
-- Otherwise it acts on the press while "ActionButtonUseKeyDown" is on, and
-- the pet frame (a unit button) opens its menu on the release.
clicks:SetAttribute("useOnKeyDown", false)
clicks:SetAttribute("type", "click")
clicks:SetAttribute("clickbutton", PetFrame)
-- The pet frame keeps its tooltip and highlight.
clicks:SetPropagateMouseMotion(true)

-------------------------------------------------------------------------------
--  Happiness: our own faces in place of Blizzard's icon, which keeps its
--  tooltip and shows and hides as before.
-------------------------------------------------------------------------------
local FACES = {
    "Interface\\AddOns\\SereneUnitFrames\\Media\\Unhappy",
    "Interface\\AddOns\\SereneUnitFrames\\Media\\Content",
    "Interface\\AddOns\\SereneUnitFrames\\Media\\Happy",
}

-- Read before ours exists, which would be among them.
local regions = {}
for _, region in ipairs({ PetFrameHappiness:GetRegions() }) do
    if region:IsObjectType("Texture") then regions[#regions + 1] = region end
end
local face = PetFrameHappiness:CreateTexture(nil, "ARTWORK")
-- Raised to sit level with the middle of the bars.
face:SetPoint("TOPLEFT", regions[1], 0, 4)
face:SetPoint("BOTTOMRIGHT", regions[1], 0, 4)

local happiness = CreateFrame("Frame")
happiness:SetScript("OnEvent", function()
    face:SetTexture(FACES[ns.Clean(C_PetInfo.GetPetHappiness())])
end)

function ns.ApplyHappinessFaces()
    local on = ns.Get("petFrameHappinessFaces")
    for _, region in ipairs(regions) do ns.SetHidden(region, on) end
    face:SetShown(on)
    if on then
        happiness:RegisterUnitEvent("UNIT_HAPPINESS", "pet")
        happiness:RegisterUnitEvent("UNIT_PET", "player")
        happiness:RegisterEvent("PLAYER_ENTERING_WORLD")
        happiness:GetScript("OnEvent")()
    else
        happiness:UnregisterAllEvents()
    end
end

-------------------------------------------------------------------------------
--  One bar: the power bar hidden and the health bar reaching down over its
--  place, the 1px gap included. Health grows from its top, since Blizzard
--  anchors it by its bottom. Its mask only fits the upper part (the cutout
--  for the ring, the rounded corner), so the lower part is drawn a second
--  time through a copy of the power bar's mask, where that mask sat; between
--  them they take Blizzard's own shape. The copy starts 4px further left,
--  like the power bar did.
--
--  Blizzard's bars lie over the portrait ring's edge, which shows on one
--  tall green bar, so a copy of the frame art cut to the ring lies on top.
-------------------------------------------------------------------------------
local health, power = PetFrame.healthbar, PetFrame.manabar
local EXTRA = power:GetHeight() + 1
local healthHeight = health:GetHeight()

-- Both masks fade out at the old gap between the bars, which left a dark
-- line there, so this one reaches 2px higher; its bottom stays put.
local SEAM = 2
local lowerMask = health:CreateMaskTexture()
lowerMask:SetAtlas(PetFrameManaBarMask:GetAtlas(), true)
lowerMask:SetHeight(lowerMask:GetHeight() + SEAM)
-- The power bar's mask at (-27, 4) from the power bar, which sat at (-4, -1)
-- from the bottom of the 10px health bar.
lowerMask:SetPoint("TOPLEFT", health, "TOPLEFT", -31, 4 - 1 - healthHeight + SEAM)
local lower = health:CreateTexture()
lower:AddMaskTexture(lowerMask)
lower:Hide()

-- The copy follows whichever fill shows: Blizzard's, or Smooth bars' on top.
local hooked = {}
local function SyncLower()
    local bar = ns.ShownBar(health)
    local fill = bar:GetStatusBarTexture()
    lower:SetParent(bar)
    lower:SetPoint("TOPLEFT", fill, -4, 0)
    lower:SetPoint("BOTTOMRIGHT", fill)
    local atlas = fill:GetAtlas()
    if atlas then lower:SetAtlas(atlas, false) else lower:SetTexture(fill:GetTexture()) end
    lower:SetDrawLayer(fill:GetDrawLayer())
    lower:SetVertexColor(fill:GetVertexColor())
    lower:SetDesaturated(fill:IsDesaturated())
    if not hooked[bar] then
        hooked[bar] = true
        for _, method in ipairs({ "SetStatusBarColor", "SetStatusBarDesaturated", "SetStatusBarTexture" }) do
            hooksecurefunc(bar, method, function(self)
                if lower:IsShown() and self == ns.ShownBar(health) then SyncLower() end
            end)
        end
    end
end

-- Above the bars and Smooth bars' copies of them.
local ringFrame = CreateFrame("Frame", nil, PetFrame)
ringFrame:SetAllPoints()
ringFrame:SetFrameLevel(health:GetFrameLevel() + 1)
local ring = ringFrame:CreateTexture(nil, "BORDER")
ring:SetAllPoints(PetFrameTexture)
-- Sized by eye: any larger and the dark background behind the bars, which
-- is art too, covers their start.
local ringMask = ringFrame:CreateMaskTexture()
-- Blank outside the circle; clamped, its edge reached across the bar as a
-- stripe of frame art.
ringMask:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
ringMask:SetSize(44, 44)
ringMask:SetPoint("CENTER", PetPortrait)
ring:AddMaskTexture(ringMask)
ringFrame:Hide()

-- The art's look as Blizzard and Dark mode set it.
local function SyncRing()
    ring:SetAtlas(PetFrameTexture:GetAtlas(), false)
    ring:SetDesaturated(PetFrameTexture:IsDesaturated())
    ring:SetVertexColor(PetFrameTexture:GetVertexColor())
end
for _, method in ipairs({ "SetAtlas", "SetDesaturated", "SetVertexColor" }) do
    hooksecurefunc(PetFrameTexture, method, function()
        if ringFrame:IsShown() then SyncRing() end
    end)
end

function ns.ApplyPetOneBar()
    local on = ns.Get("petFrameOneBar")
    local extra = on and EXTRA or 0
    ns.SetHidden(power, on)
    -- Its mouseover text would show over nothing.
    power:SetMouseMotionEnabled(not on)
    health:SetPoint("BOTTOMLEFT", PetPortrait, "RIGHT", 2, -3.5 - extra)
    health:SetHeight(healthHeight + extra)
    lower:SetShown(on)
    ringFrame:SetShown(on)
    if on then
        SyncLower()
        SyncRing()
    end
end

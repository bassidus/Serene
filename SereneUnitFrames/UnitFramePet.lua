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

local function UpdateFace()
    face:SetTexture(FACES[ns.Clean(C_PetInfo.GetPetHappiness())])
end
local happiness = CreateFrame("Frame")
happiness:SetScript("OnEvent", UpdateFace)

function ns.ApplyHappinessFaces()
    local on = ns.Get("petFrameHappinessFaces")
    for _, region in ipairs(regions) do ns.SetHidden(region, on) end
    face:SetShown(on)
    if on then
        happiness:RegisterUnitEvent("UNIT_HAPPINESS", "pet")
        happiness:RegisterUnitEvent("UNIT_PET", "player")
        happiness:RegisterEvent("PLAYER_ENTERING_WORLD")
        UpdateFace()
    else
        happiness:UnregisterAllEvents()
    end
end

-------------------------------------------------------------------------------
--  One bar: the power bar hidden and the health bar over both bars' slots
--  in the art. Blizzard's mask only fits a 10px bar, so it takes our shape
--  instead, the inside of the two slots with their rounded corners. Heal
--  prediction and Smooth bars go through the same mask.
--
--  The art has a bronze line between the slots, which would show in the
--  empty part of the bar, so a mask cuts it out of the art and a copy of
--  the art, moved down to put the health slot's inside there, fills it in.
--  The glows don't reach it.
-------------------------------------------------------------------------------
local health, power = PetFrame.healthbar, PetFrame.manabar
local MASK = PetFrameHealthBarMask
local MASK_FILE = "Interface\\AddOns\\SereneUnitFrames\\Media\\PetBarMask"
local ART_MASK_FILE = "Interface\\AddOns\\SereneUnitFrames\\Media\\PetArtMask"
-- The slots' inside; PetBarMask is drawn for it.
local WIDTH, HEIGHT = 68, 16.5
local LEFT, BOTTOM = 4, -12  -- from the portrait's right edge, as Blizzard anchors it
-- PetArtMask's cut, in units from the art's top left corner.
local CUT_LEFT, CUT_TOP, CUT_RIGHT, CUT_BOTTOM = 45, 26.5, 118, 31.5
local PATCH_DOWN = 5  -- the health slot's inside, clear of its rims
local TEXT_IN = 2  -- the texts' distance from the bar's edges
local healthWidth, healthHeight = health:GetSize()
local healthPoint = { health:GetPoint(1) }
local maskAtlas = MASK:GetAtlas()
local maskPoint = { MASK:GetPoint(1) }

local artMask = PetFrame:CreateMaskTexture()
artMask:SetTexture(ART_MASK_FILE)
artMask:SetAllPoints(PetFrameTexture)

local patch = PetFrame:CreateTexture(nil, "BORDER", nil, 1)
patch:SetAtlas(PetFrameTexture:GetAtlas())
patch:SetPoint("TOPLEFT", PetFrameTexture, 0, -PATCH_DOWN)
patch:SetPoint("BOTTOMRIGHT", PetFrameTexture, 0, -PATCH_DOWN)
local patchMask = PetFrame:CreateMaskTexture()
patchMask:SetTexture("Interface\\Buttons\\WHITE8X8", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
patchMask:SetPoint("TOPLEFT", PetFrameTexture, "TOPLEFT", CUT_LEFT, -CUT_TOP)
patchMask:SetPoint("BOTTOMRIGHT", PetFrameTexture, "TOPLEFT", CUT_RIGHT, -CUT_BOTTOM)
patch:AddMaskTexture(patchMask)
patch:Hide()
-- Dark mode darkens the art.
patch:SetDesaturated(PetFrameTexture:IsDesaturated())
patch:SetVertexColor(PetFrameTexture:GetVertexColor())
hooksecurefunc(PetFrameTexture, "SetDesaturated", function(_, on) patch:SetDesaturated(on) end)
hooksecurefunc(PetFrameTexture, "SetVertexColor", function(_, ...) patch:SetVertexColor(...) end)

local shaped  -- set while our masks are on, so Blizzard's mask is only put back after them

function ns.ApplyPetOneBar()
    local on = ns.Get("petFrameOneBar")
    ns.SetHidden(power, on)
    -- Its mouseover text would show over nothing.
    power:SetMouseMotionEnabled(not on)
    if on then
        health:SetPoint("BOTTOMLEFT", PetPortrait, "RIGHT", LEFT, BOTTOM)
        health:SetSize(WIDTH, HEIGHT)
    else
        health:SetPoint(unpack(healthPoint))
        health:SetSize(healthWidth, healthHeight)
    end
    -- Blizzard's anchors at 0 otherwise.
    health.LeftText:SetPoint("LEFT", on and TEXT_IN or 0, 0)
    health.RightText:SetPoint("RIGHT", on and -TEXT_IN or 0, 0)
    patch:SetShown(on)
    if on then
        MASK:SetTexture(MASK_FILE, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        MASK:ClearAllPoints()
        MASK:SetAllPoints(health)
        if not shaped then PetFrameTexture:AddMaskTexture(artMask) end
        shaped = true
    elseif shaped then
        MASK:SetAtlas(maskAtlas, true)
        MASK:ClearAllPoints()
        MASK:SetPoint(unpack(maskPoint))
        PetFrameTexture:RemoveMaskTexture(artMask)
        shaped = nil
    end
end

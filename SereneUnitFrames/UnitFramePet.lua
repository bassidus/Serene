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
--  One bar: the power bar hidden and the health bar over both bars' place.
--  Blizzard's mask only fits a 10px bar, so it takes our shape instead: cut
--  along the outside of the portrait ring on the left, so the bar meets the
--  ring rather than lying over it, and with the art's cut corners on the
--  right. Heal prediction and Smooth bars go through the same mask.
--
--  The art has a line where the two bars met, with a shadow under it, which
--  would show in the empty part of the bar, so a mask cuts them out of the
--  art and of its combat glows.
-------------------------------------------------------------------------------
local health, power = PetFrame.healthbar, PetFrame.manabar
local MASK = PetFrameHealthBarMask
local MASK_FILE = "Interface\\AddOns\\SereneUnitFrames\\Media\\PetBarMask"
local ART_MASK_FILE = "Interface\\AddOns\\SereneUnitFrames\\Media\\PetArtMask"
-- The art's box, from the ring to its right edge; PetBarMask is drawn for it.
local WIDTH, HEIGHT = 75, 18
local LEFT, BOTTOM = -2, -11  -- from the portrait's right edge, as Blizzard anchors it
-- The texts' distance from the bar's edges; the left one clear of the ring.
local LEFT_TEXT_IN, RIGHT_TEXT_IN = 6, 2
local healthWidth, healthHeight = health:GetSize()
local maskAtlas = MASK:GetAtlas()
local shaped  -- set while our masks are on, so Blizzard's mask is only put back after them

local artMasks = {}
for _, art in ipairs({ PetFrameTexture, PetFrameFlash, PetAttackModeTexture }) do
    local mask = art:GetParent():CreateMaskTexture()
    mask:SetTexture(ART_MASK_FILE)
    mask:SetAllPoints(PetFrameTexture)
    artMasks[art] = mask
end

function ns.ApplyPetOneBar()
    local on = ns.Get("petFrameOneBar")
    ns.SetHidden(power, on)
    -- Its mouseover text would show over nothing.
    power:SetMouseMotionEnabled(not on)
    if on then
        health:SetPoint("BOTTOMLEFT", PetPortrait, "RIGHT", LEFT, BOTTOM)
        health:SetSize(WIDTH, HEIGHT)
    else
        -- As in Blizzard's PetFrame.xml.
        health:SetPoint("BOTTOMLEFT", PetPortrait, "RIGHT", 2, -3.5)
        health:SetSize(healthWidth, healthHeight)
    end
    -- Blizzard's anchors at 0 otherwise.
    health.LeftText:SetPoint("LEFT", on and LEFT_TEXT_IN or 0, 0)
    health.RightText:SetPoint("RIGHT", on and -RIGHT_TEXT_IN or 0, 0)
    if on then
        MASK:SetTexture(MASK_FILE, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        MASK:ClearAllPoints()
        MASK:SetAllPoints(health)
        if not shaped then
            for art, mask in pairs(artMasks) do art:AddMaskTexture(mask) end
        end
        shaped = true
    elseif shaped then
        MASK:SetAtlas(maskAtlas, true)
        MASK:ClearAllPoints()
        MASK:SetPoint("TOPLEFT", -29, 3)
        for art, mask in pairs(artMasks) do art:RemoveMaskTexture(mask) end
        shaped = nil
    end
end

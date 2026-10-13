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
--  One bar: the power bar hidden and the health bar over both bars' place,
--  the 1px gap included. Health grows from its top, since Blizzard anchors
--  it by its bottom. Blizzard's mask only fits a 10px bar, so it takes our
--  shape instead: square on the left, under the portrait ring, rounded on
--  the right. Heal prediction and Smooth bars go through the same mask.
--
--  Blizzard's bars lie over the ring's edge, which shows on one tall green
--  bar, so a copy of the frame art cut to the ring lies on top, and the left
--  text moves out from under it. The art behind the bars is see-through and
--  has a line (red in combat) where they met, which showed in the empty part
--  of the bar; a solid background covers it.
-------------------------------------------------------------------------------
local health, power = PetFrame.healthbar, PetFrame.manabar
local MASK = PetFrameHealthBarMask
local MASK_FILE = "Interface\\AddOns\\SereneUnitFrames\\Media\\PetBarMask"
local EXTRA = power:GetHeight() + 1
-- Further left, the bar shows in the ring's hole beside the portrait.
local WIDER = 2.5
local TEXT_IN = 2.5  -- the left text's distance from the bar's edge, clear of the ring
local healthWidth, healthHeight = health:GetSize()
local maskAtlas = MASK:GetAtlas()
local shaped  -- set once our shape is on, so Blizzard's mask is only put back after it

local background = health:CreateTexture(nil, "BACKGROUND", nil, -8)
background:SetColorTexture(0.06, 0.06, 0.06)
background:SetAllPoints()
background:AddMaskTexture(MASK)
background:Hide()

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
    ns.SetHidden(power, on)
    -- Its mouseover text would show over nothing.
    power:SetMouseMotionEnabled(not on)
    local wider, extra = on and WIDER or 0, on and EXTRA or 0
    health:SetPoint("BOTTOMLEFT", PetPortrait, "RIGHT", 2 - wider, -3.5 - extra)
    health:SetSize(healthWidth + wider, healthHeight + extra)
    -- Blizzard's anchor at 0 otherwise.
    health.LeftText:SetPoint("LEFT", on and TEXT_IN or 0, 0)
    if on then
        MASK:SetTexture(MASK_FILE, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        MASK:ClearAllPoints()
        MASK:SetAllPoints(health)
        shaped = true
    elseif shaped then
        -- As in Blizzard's PetFrame.xml.
        MASK:SetAtlas(maskAtlas, true)
        MASK:ClearAllPoints()
        MASK:SetPoint("TOPLEFT", -29, 3)
        shaped = nil
    end
    background:SetShown(on)
    ringFrame:SetShown(on)
    if on then SyncRing() end
end

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

-------------------------------------------------------------------------------
--  Happiness: our own icons in place of Blizzard's, which keeps its tooltip
--  and shows and hides as before. One folder of three per style, and the
--  gold ring around them on its own so Dark mode can darken it. Only on a
--  hunter, the one class whose pet has a mood.
-------------------------------------------------------------------------------
local _, ns = ...

local _, CLASS = UnitClass("player")
if CLASS ~= "HUNTER" then return end

local MOODS = { "Unhappy", "Content", "Happy" }

function ns.HappinessIcon(style, name)
    return "Interface\\AddOns\\SereneUnitFrames\\Media\\Happiness\\" .. style .. "\\" .. name
end

-- Read before ours exists, which would be among them.
local regions = {}
for _, region in ipairs({ PetFrameHappiness:GetRegions() }) do
    if region:IsObjectType("Texture") then regions[#regions + 1] = region end
end
local icon = PetFrameHappiness:CreateTexture(nil, "ARTWORK")
-- Raised to sit level with the middle of the bars.
icon:SetPoint("TOPLEFT", regions[1], 0, 4)
icon:SetPoint("BOTTOMRIGHT", regions[1], 0, 4)
local ring = PetFrameHappiness:CreateTexture(nil, "OVERLAY")
ring:SetAllPoints(icon)
-- For Serene Dark Mode.
Serene.petHappinessRing = ring

local function UpdateIcon()
    local style = ns.Get("petFrameHappiness")
    local mood = MOODS[ns.Clean(C_PetInfo.GetPetHappiness())]
    icon:SetTexture(mood and ns.HappinessIcon(style, mood))
    -- The faces have no ring.
    ring:SetTexture(mood and style ~= "faces" and ns.HappinessIcon(style, "Ring") or nil)
end
local happiness = CreateFrame("Frame")
happiness:SetScript("OnEvent", UpdateIcon)

function ns.ApplyHappiness()
    local on = ns.Get("petFrameHappiness") ~= "blizzard"
    for _, region in ipairs(regions) do ns.SetHidden(region, on) end
    icon:SetShown(on)
    ring:SetShown(on)
    if on then
        happiness:RegisterUnitEvent("UNIT_HAPPINESS", "pet")
        happiness:RegisterUnitEvent("UNIT_PET", "player")
        happiness:RegisterEvent("PLAYER_ENTERING_WORLD")
        UpdateIcon()
    else
        happiness:UnregisterAllEvents()
    end
end

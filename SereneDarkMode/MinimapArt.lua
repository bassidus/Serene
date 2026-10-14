-------------------------------------------------------------------------------
--  Minimap Art -- Forever's bronze ring and Blizzard's gold frame and
--  buttons around the minimap, and the gold border of Serene's icon.
-------------------------------------------------------------------------------
local _, ns = ...

-- [file] = text a texture's atlas needs to count. The ring's sheet also
-- holds the colored day and night dial.
local ART = { [8026708] = "Frame", [4618666] = "", [4618675] = "", [4618669] = "" }

local function IsArt(tex)
    local want = ART[tex:GetTexture()]
    if not want then return false end
    local atlas = tex:GetAtlas() or ""
    -- Highlights and the mail icon keep their color.
    return atlas:find(want, 1, true) and not atlas:find("Mouseover", 1, true)
        and not atlas:find("Mail", 1, true)
end

ns.AddDarkArt("MinimapCluster", IsArt)

-- LibDBIcon's round border; the rest of the button is the logo.
local ICON_BORDER = 136430

ns.AddDarkArt("LibDBIcon10_Serene", function(tex) return tex:GetTexture() == ICON_BORDER end)

-------------------------------------------------------------------------------
--  Above the minimap: the zone name, the clock and the addon count are
--  dimmed by alpha, since Blizzard colors the zone name by its PvP status.
--  The calendar keeps its colors and is darkened; its highlight keeps its
--  strength.
-------------------------------------------------------------------------------
local DIM = 0.7
local CALENDAR = 0.6

-- The addon count is its button's own text, whose font the button applies
-- again on hover, so the font itself is a dim copy.
local COUNT_FONT = GameFontHighlightSmall
local dimCount = CreateFont("SereneDimCount")
dimCount:CopyFontObject(COUNT_FONT)
dimCount:SetAlpha(DIM)

local function IsCalendar(r)
    local atlas = r:GetObjectType() == "Texture" and r:GetAtlas() or ""
    return atlas:find("UI-HUD-Calendar", 1, true) and not atlas:find("Mouseover", 1, true)
end

ns.OnDarkMode(function()
    local dark = ns.Get("darkMode")
    MinimapZoneText:SetAlpha(dark and DIM or 1)
    TimeManagerClockTicker:SetAlpha(dark and DIM or 1)
    AddonCompartmentFrame:SetNormalFontObject(dark and dimCount or COUNT_FONT)
    local v = dark and CALENDAR or 1
    for _, r in ipairs({ GameTimeFrame:GetRegions() }) do
        if IsCalendar(r) then r:SetVertexColor(v, v, v) end
    end
end)

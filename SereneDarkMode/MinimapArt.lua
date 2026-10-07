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

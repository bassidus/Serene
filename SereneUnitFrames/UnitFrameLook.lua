-------------------------------------------------------------------------------
--  Unit Frame Look -- dark frame art, name, level and the health/
--  mana text on Blizzard's unit frames (player, pet, target, focus, their
--  targets, party).
--
--  Like the class colors, everything is painted from outside: regions are
--  hidden with alpha (Blizzard keeps calling Show/Hide on them), and no
--  fields are written to the frames. Whenever Blizzard updates a frame
--  (UnitFrame_Update) or puts an alpha back, our look goes straight back on.
--  The health/mana text uses Blizzard's own CVars.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local DARK = 0.3  -- vertex color of the desaturated frame art in Dark Mode

-------------------------------------------------------------------------------
--  The parts of each frame, looked up once
-------------------------------------------------------------------------------
local parts = setmetatable({}, { __mode = "k" })

-- art: darkened in Dark Mode.
local function PartsOf(frame)
    local p = parts[frame]
    if p then return p end
    -- UnitFrame_Initialize keeps the name on the frame.
    p = { name = frame.name, level = {}, art = {}, bars = { frame.healthbar, frame.manabar } }
    if frame == PlayerFrame then
        local box = frame.PlayerFrameContainer
        local main = frame.PlayerFrameContent.PlayerFrameContentMain
        local extra = frame.PlayerFrameContent.PlayerFrameContentContextual
        p.level = { PlayerLevelText, main.LevelBackgroundCircle }
        p.levelText = PlayerLevelText
        p.art = { box.FrameTexture, box.AlternatePowerFrameTexture, box.VehicleFrameTexture,
                  extra.PlayerPortraitCornerIcon, main.LevelBackgroundCircle }
    elseif frame.TargetFrameContainer then  -- target and focus
        local main = frame.TargetFrameContent.TargetFrameContentMain
        local extra = frame.TargetFrameContent.TargetFrameContentContextual
        p.level = { main.LevelText, main.LevelBackgroundCircle, extra.HighLevelTexture }
        p.levelText = main.LevelText
        p.art = { frame.TargetFrameContainer.FrameTexture, main.LevelBackgroundCircle }
        p.nameBackground = main.ReputationColor
    elseif frame == PetFrame then
        p.art = { PetFrameTexture }
    else  -- target of target, party
        p.art = { frame.FrameTexture or frame.Texture, frame.VehicleTexture }
    end
    parts[frame] = p
    return p
end

-- Target of target runs UnitFrame_Update every frame while shown, so the
-- hooks below must not build tables per call.
local FRAMES = { PlayerFrame, PetFrame, TargetFrame, TargetFrameToT, FocusFrame, FocusFrameToT,
    PartyFrame.MemberFrame1, PartyFrame.MemberFrame2, PartyFrame.MemberFrame3, PartyFrame.MemberFrame4 }

local ours = {}
for _, frame in ipairs(FRAMES) do ours[frame] = true end

local function Frames() return FRAMES end

-- Only the frames above; boss and arena frames also go through UnitFrame_Update.
local function IsOurs(frame) return ours[frame] end

local SetHidden = ns.SetHidden

-------------------------------------------------------------------------------
--  Dark Mode: the frame art desaturated and darkened
-------------------------------------------------------------------------------
local darkened = {}  -- [texture] = Blizzard's desaturation

local function SetDark(tex, on)
    if not tex then return end
    if on then
        if darkened[tex] == nil then darkened[tex] = tex:IsDesaturated() or false end
        tex:SetDesaturated(true)
        tex:SetVertexColor(DARK, DARK, DARK)
    elseif darkened[tex] ~= nil then
        tex:SetDesaturated(darkened[tex])
        tex:SetVertexColor(1, 1, 1)
        darkened[tex] = nil
    end
end

-------------------------------------------------------------------------------
--  Name color
-------------------------------------------------------------------------------
local nameColors = {}  -- [font string] = Blizzard's color

local function ClassColor(unit)
    if not unit or not Clean(UnitIsPlayer(unit)) then return nil end
    local _, class = UnitClass(unit)
    return RAID_CLASS_COLORS[Clean(class)]
end

local function ColorName(fs, unit)
    if not fs then return end
    local value = ns.Get("unitFrameNameColor")
    local r, g, b = ns.ColorRGB(value)
    if not r and value == "class" then
        local c = ClassColor(unit)
        if c then r, g, b = c.r, c.g, c.b end
    end
    if r then
        if not nameColors[fs] then nameColors[fs] = { fs:GetTextColor() } end
        fs:SetTextColor(r, g, b)
    elseif nameColors[fs] then
        local o = nameColors[fs]
        fs:SetTextColor(o[1], o[2], o[3], o[4])
        nameColors[fs] = nil
    end
end

-------------------------------------------------------------------------------
--  Level color
-------------------------------------------------------------------------------
-- The Level Color setting, or nil for Blizzard's own colors.
local function LevelRGB()
    return ns.ColorRGB(ns.Get("unitFrameLevelColor"))
end

-- The level number in its circle: Blizzard colors it (by difficulty, or
-- white on the player) whenever the level updates, so the color goes
-- straight back on; Blizzard's latest color is kept to hand back.
local levelColors = {}  -- [font string] = Blizzard's color
local coloring

local function ColorLevel(fs)
    if not fs then return end
    local r, g, b = LevelRGB()
    if r then
        if not levelColors[fs] then
            levelColors[fs] = { fs:GetVertexColor() }
            hooksecurefunc(fs, "SetVertexColor", function(self, r2, g2, b2, a2)
                if coloring then return end
                local o = levelColors[self]
                o[1], o[2], o[3], o[4] = r2, g2, b2, a2
                local cr, cg, cb = LevelRGB()
                if cr then
                    coloring = true
                    self:SetVertexColor(cr, cg, cb)
                    coloring = nil
                end
            end)
        end
        coloring = true
        fs:SetVertexColor(r, g, b)
        coloring = nil
    elseif levelColors[fs] then
        local o = levelColors[fs]
        coloring = true
        fs:SetVertexColor(o[1], o[2], o[3], o[4] or 1)
        coloring = nil
    end
end

-------------------------------------------------------------------------------
--  Painting a frame
-------------------------------------------------------------------------------
local function Style(frame)
    local p = PartsOf(frame)
    local dark = ns.Enabled("unitFrameDark")
    for _, tex in pairs(p.art) do SetDark(tex, dark) end
    SetHidden(p.name, ns.Enabled("unitFrameHideName"))
    SetHidden(p.nameBackground, true)  -- the colored bar behind the name, gone like on the player frame
    ColorName(p.name, frame.unit)
    local hideLevel = ns.Enabled("unitFrameHideLevel")
    for _, region in pairs(p.level) do SetHidden(region, hideLevel) end
    ColorLevel(p.levelText)
end

local function StyleAll()
    for _, frame in ipairs(Frames()) do Style(frame) end
end

-- For the unit frame fonts.
ns.UnitFrames, ns.IsUnitFrame, ns.UnitFrameParts = Frames, IsOurs, PartsOf

-- Target and focus swap their frame art (rare, elite...) after UnitFrame_Update.
hooksecurefunc(TargetFrame, "CheckClassification", Style)
hooksecurefunc(FocusFrame, "CheckClassification", Style)

-------------------------------------------------------------------------------
--  Health/mana text: Blizzard's Status Text CVars
-------------------------------------------------------------------------------
-- Like Blizzard's own setting, None also turns "statusText" off, so the
-- numbers only show while the mouse is over a bar. Current is Blizzard's
-- "current / max" with the max taken off afterwards (Blizzard's own switch
-- for that is a field on each bar, which we leave alone).
local TEXT_MODES = { none = "NONE", current = "NUMERIC", value = "NUMERIC", percent = "PERCENT", both = "BOTH" }

local function SetCurrent(bar, textString, value)
    local text = bar.capNumericDisplay and AbbreviateLargeNumbers(value) or BreakUpLargeNumbers(value)
    if bar.prefix and bar.alwaysPrefix then text = bar.prefix .. " " .. text end
    textString:SetText(text)
end

local function CurrentOnly(bar, textString, value)
    if ns.Get("unitFrameText") ~= "current" or GetCVar("statusTextDisplay") ~= "NUMERIC" then return end
    if not textString:IsShown() or bar.isZero or bar.numericDisplayTransformFunc or bar.disableMaxValue then
        return
    end
    -- Formatting fails on a secret value; Blizzard's text then stays.
    pcall(SetCurrent, bar, textString, value)
end

local barHooked = setmetatable({}, { __mode = "k" })

local function HookBars(frame)
    for _, bar in ipairs(PartsOf(frame).bars) do
        if not barHooked[bar] and bar.UpdateTextStringWithValues then
            barHooked[bar] = true
            hooksecurefunc(bar, "UpdateTextStringWithValues", CurrentOnly)
        end
    end
end

-- Left and right: the text keeps Blizzard's anchor (in the middle of the bar)
-- but is made as wide as the bar and justified to one side. Blizzard's
-- anchors read back as secret values, so they can't be copied or moved.
local ALIGN = { left = "LEFT", right = "RIGHT" }
local PAD = 2  -- from the bar's edge, like Blizzard's own left/right text
local aligned = setmetatable({}, { __mode = "k" })

local function AlignBars(frame)
    local align = ALIGN[ns.Get("unitFrameTextAlign")]
    for _, bar in ipairs(PartsOf(frame).bars) do
        local fs = bar.TextString
        local width = fs and Clean(bar:GetWidth())
        if align and width and width > 2 * PAD then
            fs:SetWidth(width - 2 * PAD)
            fs:SetJustifyH(align)
            aligned[fs] = true
        elseif aligned[fs] then
            fs:SetWidth(0)  -- back to fitting the text, as Blizzard has it
            fs:SetJustifyH("CENTER")
            aligned[fs] = nil
        end
    end
end

local function AlignAll()
    for _, frame in ipairs(Frames()) do AlignBars(frame) end
end

-- Every Blizzard unit frame passes through here when its unit changes.
hooksecurefunc("UnitFrame_Update", function(frame)
    if not IsOurs(frame) then return end
    Style(frame)
    HookBars(frame)
    AlignBars(frame)
end)

local lastText

local function ApplyText()
    local value = ns.Get("unitFrameText")
    local mode = TEXT_MODES[value]
    for _, frame in ipairs(Frames()) do HookBars(frame) end
    -- Current and Current / max share a CVar value, so the option itself
    -- counts too (and the first time, so Current takes the max off at login).
    local changed = GetCVar("statusTextDisplay") ~= mode or lastText ~= value
    lastText = value
    if GetCVar("statusTextDisplay") ~= mode then SetCVar("statusTextDisplay", mode) end
    -- The bars only redraw their text when "statusText" changes or the value
    -- does, so at full health a new mode would not show until a hit.
    -- Changing "statusText" lets Blizzard's own CVAR_UPDATE handler redraw
    -- them; calling the bars from here can't read their (secret) values.
    local on = mode == "NONE" and "0" or "1"
    if GetCVar("statusText") ~= on then
        SetCVar("statusText", on)
    elseif changed and on == "1" and not InCombatLockdown() then
        SetCVar("statusText", "0")
        SetCVar("statusText", "1")
    end
end

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local SECTION = "Unit frames"

ns.RegisterFeature({
    key = "unitFrameDark", label = "Dark frames", section = SECTION, category = "Appearance",
    apply = StyleAll,
})
ns.RegisterFeature({
    key = "unitFrameHideName", label = "Hide names", section = SECTION, category = "Name",
    tooltip = "Names on the unit frames",
    default = false, apply = StyleAll,
})
ns.RegisterFeature({
    key = "unitFrameNameColor", label = "Name color", section = SECTION, category = "Name", type = "color",
    default = "default", apply = StyleAll,
    specials = {
        { value = "default", label = "Default", swatch = function() return "ffd100" end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex },
    },
})
ns.RegisterFeature({
    key = "unitFrameHideLevel", label = "Hide level", section = SECTION, category = "Level",
    tooltip = "Levels on the unit frames",
    beside = true,
    default = false, apply = StyleAll,
})
ns.RegisterFeature({
    key = "unitFrameLevelColor", label = "Level color", section = SECTION, category = "Level", type = "color",
    default = "ffd100", apply = StyleAll,
    specials = {
        { value = "default", label = "Default", swatch = function() return "ffffff", "40d940", "ffd100", "ff4d1a" end },
    },
})
ns.RegisterFeature({
    key = "unitFrameText", label = "Format", section = SECTION, category = "Health & mana",
    tooltip = "Numbers on the health and mana bars",
    type = "dropdown",
    default = "both", apply = ApplyText,
    options = function()
        return {
            { value = "none",     label = "None" },
            { value = "current",  label = "Current" },
            { value = "value",    label = "Current / max" },
            { value = "percent",  label = "Percent" },
            { value = "both",     label = "Both" },
        }
    end,
})
ns.RegisterFeature({
    key = "unitFrameTextAlign", label = "Alignment", section = SECTION, category = "Health & mana",
    type = "dropdown", beside = true,
    default = "center", apply = AlignAll,
    options = function()
        return {
            { value = "left",   label = "Left" },
            { value = "center", label = "Center" },
            { value = "right",  label = "Right" },
        }
    end,
})

-------------------------------------------------------------------------------
--  Unit Frame Look -- dark frame art, portrait, name, level and the health/
--  mana text on Blizzard's unit frames (player, pet, target, focus, their
--  targets, party).
--
--  Like the class colors, everything is painted from outside: regions are
--  hidden with alpha (Blizzard keeps calling Show/Hide on them), and no
--  fields are written to the frames. Whenever Blizzard updates a frame
--  (UnitFrame_Update) or puts an alpha back, our look goes straight back on.
--  The text and the class icon portraits are Blizzard's own CVars.
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
    p = { name = frame.name, level = {}, art = {} }
    if frame == PlayerFrame then
        local box = frame.PlayerFrameContainer
        local main = frame.PlayerFrameContent and frame.PlayerFrameContent.PlayerFrameContentMain
        local extra = frame.PlayerFrameContent and frame.PlayerFrameContent.PlayerFrameContentContextual
        p.level = { PlayerLevelText, main and main.LevelBackgroundCircle }
        p.levelText = PlayerLevelText
        if box then
            p.art = { box.FrameTexture, box.AlternatePowerFrameTexture, box.VehicleFrameTexture,
                      extra and extra.PlayerPortraitCornerIcon, main and main.LevelBackgroundCircle }
        end
    elseif frame.TargetFrameContainer then  -- target and focus
        local box = frame.TargetFrameContainer
        local main = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentMain
        local extra = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentContextual
        if main then
            p.level = { main.LevelText, main.LevelBackgroundCircle, extra and extra.HighLevelTexture }
            p.levelText = main.LevelText
        end
        p.art = { box.FrameTexture, main and main.LevelBackgroundCircle }
        p.nameBackground = main and main.ReputationColor
    elseif frame == PetFrame then
        p.art = { PetFrameTexture }
    else  -- target of target, party
        p.art = { frame.FrameTexture or frame.Texture, frame.VehicleTexture }
    end
    parts[frame] = p
    return p
end

local FRAMES = { "PlayerFrame", "PetFrame", "TargetFrame", "TargetFrameToT", "FocusFrame", "FocusFrameToT",
    "PartyMemberFrame1", "PartyMemberFrame2", "PartyMemberFrame3", "PartyMemberFrame4" }

local function Frames()
    local list = {}
    for _, name in ipairs(FRAMES) do
        if _G[name] then list[#list + 1] = _G[name] end
    end
    if PartyFrame and PartyFrame.PartyMemberFramePool then
        for f in PartyFrame.PartyMemberFramePool:EnumerateActive() do list[#list + 1] = f end
    end
    return list
end

-- Only the frames above; boss and arena frames also go through UnitFrame_Update.
local function IsOurs(frame)
    if parts[frame] then return true end
    for _, name in ipairs(FRAMES) do
        if _G[name] == frame then return true end
    end
    return PartyFrame ~= nil and frame:GetParent() == PartyFrame
end

-------------------------------------------------------------------------------
--  Hiding: alpha 0, put back whenever Blizzard sets an alpha of its own
-------------------------------------------------------------------------------
local hidden, hooked = {}, {}
local setting  -- set while we change an alpha, so our own call is not taken for Blizzard's

local function SetHidden(region, on)
    if not region then return end
    if on then
        if not hooked[region] then
            hooked[region] = true
            hooksecurefunc(region, "SetAlpha", function(self)
                if hidden[self] and not setting then
                    setting = true
                    self:SetAlpha(0)
                    setting = nil
                end
            end)
        end
        hidden[region] = true
        setting = true
        region:SetAlpha(0)
        setting = nil
    elseif hidden[region] then
        hidden[region] = nil
        setting = true
        region:SetAlpha(1)
        setting = nil
    end
end

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

local classColors = {}
local function ClassColor(unit)
    if not unit or not Clean(UnitIsPlayer(unit)) then return nil end
    local _, class = UnitClass(unit)
    class = Clean(class)
    if not class then return nil end
    local c = classColors[class]
    if not c then
        c = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
        classColors[class] = c
    end
    return c
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
                levelColors[self] = { r2, g2, b2, a2 }
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
    if not frame or frame.IsForbidden and frame:IsForbidden() then return end
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

-- Every Blizzard unit frame passes through here when its unit changes.
if UnitFrame_Update then
    hooksecurefunc("UnitFrame_Update", function(frame)
        if IsOurs(frame) then Style(frame) end
    end)
end
-- Target and focus swap their frame art (rare, elite...) after that update.
for _, frame in ipairs({ TargetFrame, FocusFrame }) do
    if frame and frame.CheckClassification then hooksecurefunc(frame, "CheckClassification", Style) end
end

-------------------------------------------------------------------------------
--  Portrait: Blizzard's class icon CVars
-------------------------------------------------------------------------------
local PORTRAIT_CVARS = { "ReplaceMyPlayerPortrait", "ReplaceOtherPlayerPortraits" }
local lastPortrait

local function ApplyPortrait()
    local value = ns.Get("unitFramePortrait")
    -- Only switching away from class icons turns the CVars off again, so a
    -- choice made in Blizzard's own settings is left alone otherwise.
    local cvar = value == "class" and "1" or (lastPortrait == "class" and "0") or nil
    lastPortrait = value
    if cvar then
        for _, name in ipairs(PORTRAIT_CVARS) do pcall(SetCVar, name, cvar) end
        if UnitFramePortrait_Update then
            for _, frame in ipairs(Frames()) do
                if frame.portrait and frame.unit then pcall(UnitFramePortrait_Update, frame) end
            end
        end
    end
end

-------------------------------------------------------------------------------
--  Health/mana text: Blizzard's Status Text CVars
-------------------------------------------------------------------------------
-- Like Blizzard's own setting, None also turns "statusText" off, so the
-- numbers only show while the mouse is over a bar. Current is Blizzard's
-- "current / max" with the max taken off afterwards (Blizzard's own switch
-- for that is a field on each bar, which we leave alone).
local TEXT_MODES = { none = "NONE", current = "NUMERIC", value = "NUMERIC", percent = "PERCENT", both = "BOTH" }

local function CurrentOnly(bar, textString, value)
    if ns.Get("unitFrameText") ~= "current" or GetCVar("statusTextDisplay") ~= "NUMERIC" then return end
    if not textString:IsShown() or bar.isZero or bar.numericDisplayTransformFunc or bar.disableMaxValue then
        return
    end
    -- Formatting fails on a secret value; Blizzard's text then stays.
    pcall(function()
        local text = bar.capNumericDisplay and AbbreviateLargeNumbers(value) or BreakUpLargeNumbers(value)
        if bar.prefix and bar.alwaysPrefix then text = bar.prefix .. " " .. text end
        textString:SetText(text)
    end)
end

local barHooked = setmetatable({}, { __mode = "k" })

local function HookBars(frame)
    for _, bar in ipairs({ frame.healthbar, frame.manabar }) do
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
    for _, bar in ipairs({ frame.healthbar, frame.manabar }) do
        local fs = bar and bar.TextString
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

if UnitFrame_Update then
    hooksecurefunc("UnitFrame_Update", function(frame)
        if IsOurs(frame) then
            HookBars(frame)
            AlignBars(frame)
        end
    end)
end

local lastText

local function ApplyText()
    local value = ns.Get("unitFrameText")
    local mode = TEXT_MODES[value]
    if not mode then return end
    for _, frame in ipairs(Frames()) do HookBars(frame) end
    -- Current and Current / max share a CVar value, so the option itself
    -- counts too (and the first time, so Current takes the max off at login).
    local changed = GetCVar("statusTextDisplay") ~= mode or lastText ~= value
    lastText = value
    if GetCVar("statusTextDisplay") ~= mode then pcall(SetCVar, "statusTextDisplay", mode) end
    -- The bars only redraw their text when "statusText" changes or the value
    -- does, so at full health a new mode would not show until a hit.
    -- Changing "statusText" lets Blizzard's own CVAR_UPDATE handler redraw
    -- them; calling the bars from here can't read their (secret) values.
    local on = mode == "NONE" and "0" or "1"
    if GetCVar("statusText") ~= on then
        pcall(SetCVar, "statusText", on)
    elseif changed and on == "1" and not InCombatLockdown() then
        pcall(SetCVar, "statusText", "0")
        pcall(SetCVar, "statusText", "1")
    end
end

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local SECTION = "Unit frames"

ns.RegisterFeature({
    key = "unitFrameDark", label = "Dark frames", section = SECTION, category = "Appearance",
    default = false, apply = StyleAll,
    tooltip = "Darkens the art around the player, target, party and pet frames.",
})
ns.RegisterFeature({
    key = "unitFramePortrait", label = "Portrait", section = SECTION, category = "Appearance", type = "dropdown",
    hideLabel = true,
    default = "portrait", apply = ApplyPortrait,
    tooltip = "Class icon shows players' class icon instead of their face.",
    options = function()
        return {
            { value = "portrait", label = "Portrait" },
            { value = "class",    label = "Class icon" },
        }
    end,
})
ns.RegisterFeature({
    key = "unitFrameHideName", label = "Hide names", section = SECTION, category = "Name",
    default = false, apply = StyleAll,
})
ns.RegisterFeature({
    key = "unitFrameNameColor", label = "Name color", section = SECTION, category = "Name", type = "color",
    default = "default", apply = StyleAll,
    specials = {
        { value = "default", label = "Default", swatch = function() return "ffd100" end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex,
          tooltip = "Players' class color; everyone else keeps the default." },
    },
})
ns.RegisterFeature({
    key = "unitFrameHideLevel", label = "Hide level", section = SECTION, category = "Level",
    default = false, apply = StyleAll,
})
ns.RegisterFeature({
    key = "unitFrameLevelColor", label = "Level color", section = SECTION, category = "Level", type = "color",
    default = "ffd100", apply = StyleAll,
    specials = {
        { value = "default", label = "Default", swatch = function() return "ffffff", "40d940", "ffd100", "ff4d1a" end,
          tooltip = "Blizzard's colors: by difficulty for enemies, white on your own frame." },
    },
})
ns.RegisterFeature({
    key = "unitFrameText", label = "Health/mana numbers", section = SECTION, category = "Health & mana",
    type = "dropdown",
    default = "both", apply = ApplyText,
    tooltip = "How the numbers on the health and mana bars read. None shows them only while the mouse is over a bar.\n"
        .. "Both shows the percent on the left and the value on the right, so Alignment doesn't change it.",
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
    type = "dropdown",
    default = "center", apply = AlignAll,
    options = function()
        return {
            { value = "left",   label = "Left" },
            { value = "center", label = "Center" },
            { value = "right",  label = "Right" },
        }
    end,
})

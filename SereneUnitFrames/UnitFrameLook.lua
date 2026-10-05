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

-- art: darkened in Dark Mode. frame: hidden with the portrait, since the
-- frame art is drawn around it (with the combat and status glows that share
-- its shape).
local function PartsOf(frame)
    local p = parts[frame]
    if p then return p end
    -- UnitFrame_Initialize keeps the name and portrait on the frame.
    p = { name = frame.name, portrait = frame.portrait, level = {}, art = {}, frame = {} }
    if frame == PlayerFrame then
        local box = frame.PlayerFrameContainer
        local main = frame.PlayerFrameContent and frame.PlayerFrameContent.PlayerFrameContentMain
        local extra = frame.PlayerFrameContent and frame.PlayerFrameContent.PlayerFrameContentContextual
        p.level = { PlayerLevelText, main and main.LevelBackgroundCircle }
        if box then
            p.art = { box.FrameTexture, box.AlternatePowerFrameTexture, box.VehicleFrameTexture,
                      extra and extra.PlayerPortraitCornerIcon, main and main.LevelBackgroundCircle }
            p.frame = { box.FrameTexture, box.AlternatePowerFrameTexture, box.VehicleFrameTexture,
                        box.FrameFlash, main and main.StatusTexture, extra and extra.PlayerPortraitCornerIcon }
        end
    elseif frame.TargetFrameContainer then  -- target and focus
        local box = frame.TargetFrameContainer
        local main = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentMain
        local extra = frame.TargetFrameContent and frame.TargetFrameContent.TargetFrameContentContextual
        if main then
            p.level = { main.LevelText, main.LevelBackgroundCircle, extra and extra.HighLevelTexture }
        end
        p.art = { box.FrameTexture, main and main.LevelBackgroundCircle }
        p.frame = { box.FrameTexture, box.Flash, box.BossPortraitFrameTexture }
        p.nameBackground = main and main.ReputationColor
    elseif frame == PetFrame then
        p.art = { PetFrameTexture }
        p.frame = { PetFrameTexture, PetFrameFlash, PetAttackModeTexture }
    else  -- target of target, party
        p.art = { frame.FrameTexture or frame.Texture, frame.VehicleTexture }
        p.frame = { frame.FrameTexture or frame.Texture, frame.VehicleTexture, frame.Flash,
                    frame.PartyMemberOverlay and frame.PartyMemberOverlay.Status }
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
--  Level in the name: "14 Hogger", in gold ("??" when too high). Used while
--  the portrait is hidden, since the level circle sits on the frame art.
-------------------------------------------------------------------------------
local baseNames, ourNames = {}, {}  -- [font string] = Blizzard's text / the text we set

local LEVEL_COLOR = "|cffffd100"  -- the gold of Blizzard's own level text

local function LevelPrefix(unit)
    if not unit or not Clean(UnitExists(unit)) or Clean(UnitIsCorpse(unit)) then return nil end
    local level = Clean(UnitEffectiveLevel(unit))
    if not level then return nil end
    return LEVEL_COLOR .. (level > 0 and level or "??") .. "|r "
end

local function NameLevel(fs, unit, on)
    if not fs then return end
    local text = fs:GetText()
    if issecretvalue and issecretvalue(text) then return end
    -- Blizzard wrote a new name since our last one: that is the base now.
    if text ~= ourNames[fs] then baseNames[fs] = text end
    local base = baseNames[fs]
    local prefix = on and base and base ~= "" and LevelPrefix(unit)
    local want = prefix and (prefix .. base) or base
    if want ~= text then fs:SetText(want) end
    ourNames[fs] = prefix and want or nil
end

-------------------------------------------------------------------------------
--  Painting a frame
-------------------------------------------------------------------------------
local function Style(frame)
    if not frame or frame.IsForbidden and frame:IsForbidden() then return end
    local p = PartsOf(frame)
    local dark = ns.Enabled("unitFrameDark")
    for _, tex in pairs(p.art) do SetDark(tex, dark) end
    local noPortrait = ns.Get("unitFramePortrait") == "hidden"
    SetHidden(p.portrait, noPortrait)
    for _, region in pairs(p.frame) do SetHidden(region, noPortrait) end
    SetHidden(p.name, ns.Enabled("unitFrameHideName"))
    SetHidden(p.nameBackground, ns.Enabled("unitFrameHideNameBackground"))
    ColorName(p.name, frame.unit)
    local hideLevel = ns.Enabled("unitFrameHideLevel")
    for _, region in pairs(p.level) do SetHidden(region, hideLevel or noPortrait) end
    NameLevel(p.name, frame.unit, noPortrait and not hideLevel)
end

local function StyleAll()
    for _, frame in ipairs(Frames()) do Style(frame) end
end

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
--  Portrait: Blizzard's class icon CVars, or hidden
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
    StyleAll()
end

-------------------------------------------------------------------------------
--  Health/mana text: Blizzard's Status Text CVars
-------------------------------------------------------------------------------
local TEXT_MODES = { value = "NUMERIC", percent = "PERCENT", both = "BOTH" }

local function ApplyText()
    local mode = TEXT_MODES[ns.Get("unitFrameText")]
    if not mode then return end  -- "blizzard": the game's own setting
    if GetCVar("statusText") ~= "1" then pcall(SetCVar, "statusText", "1") end
    if GetCVar("statusTextDisplay") ~= mode then pcall(SetCVar, "statusTextDisplay", mode) end
end

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
local SECTION = "Unit Frames"

ns.RegisterFeature({
    key = "unitFrameDark", label = "Dark Mode", section = SECTION, default = false, apply = StyleAll,
    tooltip = "Dark frames around the player, target, party and pet frames.",
})
ns.RegisterFeature({
    key = "unitFramePortrait", label = "Portrait", section = SECTION, type = "dropdown",
    default = "portrait", apply = ApplyPortrait,
    tooltip = "Class Icon shows players' class icon instead of their face.\nHidden also hides the frame around it, and the level moves before the name.",
    options = function()
        return {
            { value = "portrait", label = "Portrait" },
            { value = "class",    label = "Class Icon" },
            { value = "hidden",   label = "Hidden" },
        }
    end,
})
ns.RegisterFeature({
    key = "unitFrameHideName", label = "Hide Name", section = SECTION, default = false, apply = StyleAll,
})
ns.RegisterFeature({
    key = "unitFrameHideNameBackground", label = "Hide Name Background", section = SECTION,
    apply = StyleAll,
    tooltip = "Removes the colored bar (blue, red, yellow...) behind the name on the target and focus frames, like the player frame.",
})
ns.RegisterFeature({
    key = "unitFrameNameColor", label = "Name Color", section = SECTION, type = "color",
    default = "default", apply = StyleAll,
    specials = {
        { value = "default", label = "Default", swatch = function() return "ffd100" end },
        { value = "class",   label = "Class", swatch = ns.PlayerClassHex,
          tooltip = "Players' class color; everyone else keeps the default." },
    },
})
-- The level in the name follows level ups.
local levelWatch = CreateFrame("Frame")
levelWatch:RegisterEvent("UNIT_LEVEL")
levelWatch:SetScript("OnEvent", function(_, _, unit)
    if ns.Get("unitFramePortrait") ~= "hidden" or ns.Enabled("unitFrameHideLevel") then return end
    for _, frame in ipairs(Frames()) do
        if frame.unit and Clean(UnitIsUnit(frame.unit, unit)) then Style(frame) end
    end
end)

ns.RegisterFeature({
    key = "unitFrameHideLevel", label = "Hide Level", section = SECTION, default = false, apply = StyleAll,
    tooltip = "While the portrait is hidden, the level is shown before the name instead, e.g. \"14 Hogger\".",
})
ns.RegisterFeature({
    key = "unitFrameText", label = "Health/Mana Text", section = SECTION, type = "dropdown",
    default = "blizzard", apply = ApplyText,
    tooltip = "Value, Percent and Both are always shown.\nBlizzard keeps the game's own Status Text setting.",
    options = function()
        return {
            { value = "blizzard", label = "Blizzard" },
            { value = "value",    label = "Value" },
            { value = "percent",  label = "Percent" },
            { value = "both",     label = "Both" },
        }
    end,
})

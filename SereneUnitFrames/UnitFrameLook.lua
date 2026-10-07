-------------------------------------------------------------------------------
--  Unit Frame Look -- dark frame art (Dark mode), longer names and hidden
--  portrait damage numbers on Blizzard's unit frames.
--
--  Everything is painted from outside: regions are hidden with alpha
--  (Blizzard keeps calling Show/Hide on them), and no fields are written to
--  the frames. Whenever Blizzard updates a frame (UnitFrame_Update), our
--  look goes back on if it has not taken yet.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local DARK = 0.3  -- vertex color of the desaturated frame art in Dark mode

-------------------------------------------------------------------------------
--  The parts of each frame, looked up once
-------------------------------------------------------------------------------
local parts = {}

-- art: darkened in Dark mode.
local function PartsOf(frame)
    local p = parts[frame]
    if p then return p end
    -- UnitFrame_Initialize keeps the name on the frame.
    p = { name = frame.name, art = {}, bars = { frame.healthbar, frame.manabar } }
    if frame == PlayerFrame then
        local box = frame.PlayerFrameContainer
        local main = frame.PlayerFrameContent.PlayerFrameContentMain
        local extra = frame.PlayerFrameContent.PlayerFrameContentContextual
        p.levelText = PlayerLevelText
        p.art = { box.FrameTexture, box.AlternatePowerFrameTexture, box.VehicleFrameTexture,
                  extra.PlayerPortraitCornerIcon, main.LevelBackgroundCircle }
    elseif frame.TargetFrameContainer then  -- target and focus
        local main = frame.TargetFrameContent.TargetFrameContentMain
        p.levelText = main.LevelText
        p.art = { frame.TargetFrameContainer.FrameTexture, main.LevelBackgroundCircle }
    elseif frame == PetFrame then
        p.art = { PetFrameTexture }
    else  -- target of target, party
        p.art = { frame.FrameTexture or frame.Texture, frame.VehicleTexture }
    end
    parts[frame] = p
    return p
end

-- For the fonts and the status text.
ns.UnitFrameParts = PartsOf

-------------------------------------------------------------------------------
--  Dark mode: the frame art desaturated and darkened
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
--  Longer names: the name reaches the right end of the health bar instead of
--  stopping short of it (the player frame's cuts off at 96 of ~130 pixels).
--  Both sit in the same frame, so the difference holds at any scale or
--  position; it is measured once, as soon as the frame is laid out.
--  A name that still does not fit shows only its first word, rather than
--  a first name with half a surname.
-------------------------------------------------------------------------------
local widened = {}    -- [font string] = true once it reaches the bar's end
local fullNames = {}  -- [font string] = Blizzard's latest text
local naming  -- set while we change a name, so our own call is not taken for Blizzard's

local function FitName(fs)
    local full = fullNames[fs]
    if not full then return end
    naming = true
    fs:SetText(full)
    if Clean(fs:IsTruncated()) then
        local first = full:match("^(%S+)%s")
        if first then fs:SetText(first) end
    end
    naming = nil
end

-- Returns false while the frame is not laid out yet, to be tried again.
local function WidenName(fs, bar)
    if widened[fs] then return true end
    local left, right = Clean(fs:GetLeft()), Clean(bar:GetRight())
    if not (left and right) then return false end
    widened[fs] = true
    fs:SetWidth(right - left - 2)
    fullNames[fs] = Clean(fs:GetText())
    hooksecurefunc(fs, "SetText", function(self, text)
        if naming then return end
        fullNames[self] = Clean(text)
        FitName(self)
    end)
    FitName(fs)
    return true
end

-------------------------------------------------------------------------------
--  Styling a frame
-------------------------------------------------------------------------------
-- Returns false while the frame is not laid out yet.
local function Style(frame)
    local p = PartsOf(frame)
    local dark = ns.Get("darkMode")
    for _, tex in pairs(p.art) do SetDark(tex, dark) end
    return WidenName(p.name, frame.healthbar)
end

-- [frame] = true once styled for the current Dark mode; target of target
-- passes through UnitFrame_Update every frame while it shows.
local styled = {}

local function StyleAll()
    for _, frame in ipairs(ns.UnitFrames()) do styled[frame] = Style(frame) end
end

hooksecurefunc("UnitFrame_Update", function(frame)
    if ns.IsUnitFrame(frame) and not styled[frame] then styled[frame] = Style(frame) end
end)

-- Target and focus swap their frame art (rare, elite...) after UnitFrame_Update.
hooksecurefunc(TargetFrame, "CheckClassification", Style)
hooksecurefunc(FocusFrame, "CheckClassification", Style)

ns.OnDarkMode(StyleAll)

-------------------------------------------------------------------------------
--  Damage numbers on the player's and the pet's portraits
-------------------------------------------------------------------------------
local HITS = { PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator, PetHitIndicator }

function ns.ApplyHideHits()
    for _, region in ipairs(HITS) do ns.SetHidden(region, ns.Get("unitFrameHideHits")) end
end

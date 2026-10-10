-------------------------------------------------------------------------------
--  Unit Frame Look -- longer names and hidden portrait damage numbers on
--  Blizzard's unit frames.
--
--  Everything is painted from outside: regions are hidden with alpha
--  (Blizzard keeps calling Show/Hide on them), and no fields are written to
--  the frames. Whenever Blizzard updates a frame (UnitFrame_Update), our
--  look goes back on if it has not taken yet.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

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

-- [frame] = true once its name is widened; target of target passes through
-- UnitFrame_Update every frame while it shows.
local widenedFrames = {}

local function Widen(frame)
    widenedFrames[frame] = WidenName(ns.UnitFrameParts(frame).name, frame.healthbar)
end

for _, frame in ipairs(ns.UnitFrames()) do Widen(frame) end

ns.OnUnitFrameUpdate(function(frame)
    if not widenedFrames[frame] then Widen(frame) end
end)

-------------------------------------------------------------------------------
--  Damage numbers on the player's and the pet's portraits
-------------------------------------------------------------------------------
local HITS = { PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator, PetHitIndicator }

function ns.ApplyHideHits()
    for _, region in ipairs(HITS) do ns.SetHidden(region, ns.Get("unitFrameHideHits")) end
end

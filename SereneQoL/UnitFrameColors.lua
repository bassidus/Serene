-------------------------------------------------------------------------------
--  Class Colored Health -- players' health bars on Blizzard's unit frames
--  (player, target, target of target, focus, party) take the class color.
--  Everyone else keeps Blizzard's own color.
--
--  Blizzard's bars are painted from outside: no fields are written to its
--  frames (that would taint them), our bookkeeping lives in a local table.
--  The bar's texture is desaturated before tinting, since the modern art is
--  a green atlas that a color alone would only darken. Whenever Blizzard
--  repaints a player's bar, the class color goes straight back on.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local state = setmetatable({}, { __mode = "k" })  -- [bar] = Blizzard's look + ours
local painting  -- set while we color, so our own calls are not taken for Blizzard's

local function ClassColor(unit)
    if not (unit and ns.Enabled("unitFrameClassColors")) then return nil end
    if not Clean(UnitIsPlayer(unit)) or not Clean(UnitIsConnected(unit)) then return nil end
    local _, class = UnitClass(unit)
    class = Clean(class)
    return class and (C_ClassColor and C_ClassColor.GetClassColor(class) or RAID_CLASS_COLORS[class])
end

local function IsDesaturated(bar)
    if bar.IsStatusBarDesaturated then return bar:IsStatusBarDesaturated() end
    local tex = bar:GetStatusBarTexture()
    return tex and tex:IsDesaturated() or false
end

local function SetDesaturated(bar, on)
    if bar.SetStatusBarDesaturated then
        bar:SetStatusBarDesaturated(on)
    else
        local tex = bar:GetStatusBarTexture()
        if tex then tex:SetDesaturated(on) end
    end
end

local function Paint(bar, unit)
    local s = state[bar]
    if not s then return end
    if unit then s.unit = unit end
    local c = ClassColor(s.unit)
    painting = true
    if c then
        SetDesaturated(bar, true)
        bar:SetStatusBarColor(c.r, c.g, c.b)
        s.colored = true
    elseif s.colored then
        SetDesaturated(bar, s.desat)
        bar:SetStatusBarColor(s.r, s.g, s.b)
        s.colored = nil
    end
    painting = nil
end

-- First sight of a bar: remember Blizzard's look and follow its repaints.
local function Track(bar, unit)
    if not bar or not bar.SetStatusBarColor then return end
    if not state[bar] then
        local r, g, b = bar:GetStatusBarColor()
        state[bar] = { r = r, g = g, b = b, desat = IsDesaturated(bar) }
        hooksecurefunc(bar, "SetStatusBarColor", function(self, r2, g2, b2)
            if painting then return end
            local s = state[self]
            if ClassColor(s.unit) then
                Paint(self)
            else
                -- Blizzard's color for a non-player is what we hand back later.
                s.r, s.g, s.b = r2, g2, b2
                if s.colored then
                    SetDesaturated(self, s.desat)
                    s.colored = nil
                end
            end
        end)
        -- New art (vehicle, Edit Mode) arrives saturated.
        hooksecurefunc(bar, "SetStatusBarTexture", function(self)
            if state[self].colored then SetDesaturated(self, true) end
        end)
    end
    Paint(bar, unit or bar.unit)
end

local function FindBar(frame)
    if not frame then return nil end
    local bar = frame.healthbar or frame.healthBar or frame.HealthBar
    if bar then return bar end
    local box = frame.HealthBarsContainer or frame.HealthBarContainer
    if not box then
        -- 12.x art: Frame.FrameContent.FrameContentMain.HealthBarsContainer
        local name = frame:GetName()
        local content = name and frame[name .. "Content"]
        local main = content and content[name .. "ContentMain"]
        box = main and main.HealthBarsContainer
    end
    return box and (box.HealthBar or box.healthBar)
end

local FRAMES = { "PlayerFrame", "TargetFrame", "TargetFrameToT", "FocusFrame", "FocusFrameToT",
    "PartyMemberFrame1", "PartyMemberFrame2", "PartyMemberFrame3", "PartyMemberFrame4" }

local function TrackFrame(frame)
    local bar = FindBar(frame)
    if bar then Track(bar, bar.unit or frame.unit) end
end

local function RefreshAll()
    for _, name in ipairs(FRAMES) do TrackFrame(_G[name]) end
    if PartyFrame and PartyFrame.PartyMemberFramePool then
        for f in PartyFrame.PartyMemberFramePool:EnumerateActive() do TrackFrame(f) end
    end
    for bar in pairs(state) do Paint(bar) end
end

-- Every Blizzard unit frame bar passes through here when its unit changes.
if UnitFrameHealthBar_Update then
    hooksecurefunc("UnitFrameHealthBar_Update", function(bar, unit) Track(bar, unit) end)
end

-- Fallback for paths that skip the update above (and the first paint).
local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event, unit)
    if event == "UNIT_CONNECTION" then
        for bar, s in pairs(state) do
            if s.unit and UnitIsUnit(s.unit, unit) then Paint(bar) end
        end
        return
    end
    RefreshAll()
end)

ns.RegisterFeature({
    key = "unitFrameClassColors", label = "Class Colored Healthbars", section = "QoL",
    apply = function()
        if ns.Enabled("unitFrameClassColors") then
            for _, event in ipairs({ "PLAYER_ENTERING_WORLD", "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED",
                                     "GROUP_ROSTER_UPDATE", "UNIT_CONNECTION" }) do
                pcall(watcher.RegisterEvent, watcher, event)
            end
        else
            watcher:UnregisterAllEvents()
        end
        RefreshAll()
    end,
    tooltip = "Class colors on the player, target, target of target and party frames.",
})

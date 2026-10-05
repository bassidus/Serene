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
    return RAID_CLASS_COLORS[Clean(class)]
end

-- c is the class color when the caller has just looked it up.
local function Paint(bar, unit, c)
    local s = state[bar]
    if not s then return end
    if unit then s.unit = unit end
    c = c or ClassColor(s.unit)
    painting = true
    if c then
        bar:SetStatusBarDesaturated(true)
        bar:SetStatusBarColor(c.r, c.g, c.b)
        s.colored = true
    elseif s.colored then
        bar:SetStatusBarDesaturated(s.desat)
        bar:SetStatusBarColor(s.r, s.g, s.b)
        s.colored = nil
    end
    painting = nil
end

-- First sight of a bar: remember Blizzard's look and follow its repaints.
local function Track(bar, unit)
    if not state[bar] then
        local r, g, b = bar:GetStatusBarColor()
        state[bar] = { r = r, g = g, b = b, desat = bar:IsStatusBarDesaturated() }
        hooksecurefunc(bar, "SetStatusBarColor", function(self, r2, g2, b2)
            if painting then return end
            local s = state[self]
            local c = ClassColor(s.unit)
            if c then
                Paint(self, nil, c)
            else
                -- Blizzard's color for a non-player is what we hand back later.
                s.r, s.g, s.b = r2, g2, b2
                if s.colored then
                    self:SetStatusBarDesaturated(s.desat)
                    s.colored = nil
                end
            end
        end)
        -- New art (vehicle, Edit Mode) arrives saturated.
        hooksecurefunc(bar, "SetStatusBarTexture", function(self)
            if state[self].colored then self:SetStatusBarDesaturated(true) end
        end)
    end
    Paint(bar, unit or bar.unit)
end

local function RefreshAll()
    for _, frame in ipairs(ns.UnitFrames()) do Track(frame.healthbar, frame.healthbar.unit or frame.unit) end
    for bar in pairs(state) do Paint(bar) end
end

-- Every Blizzard unit frame bar passes through here when its unit changes.
hooksecurefunc("UnitFrameHealthBar_Update", Track)

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
    key = "unitFrameClassColors", label = "Class-colored health bars", section = "Unit frames", category = "Appearance",
    apply = function()
        if ns.Enabled("unitFrameClassColors") then
            for _, event in ipairs({ "PLAYER_ENTERING_WORLD", "PLAYER_TARGET_CHANGED", "PLAYER_FOCUS_CHANGED",
                                     "GROUP_ROSTER_UPDATE", "UNIT_CONNECTION" }) do
                watcher:RegisterEvent(event)
            end
        else
            watcher:UnregisterAllEvents()
        end
        RefreshAll()
    end,
    tooltip = "NPCs keep Blizzard's colors.",
})

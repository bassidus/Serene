-------------------------------------------------------------------------------
--  Bar Visibility -- per bar, when it shows: out of combat, in combat, or
--  never with neither ticked. Mouse over narrows those to while the mouse
--  is over the bar (and a second after). A bar shown in and out of combat
--  without mouse over is left to Blizzard's settings. A bar linked to another takes its ticks, and the
--  mouse over either shows both. Only the bar's alpha changes, so its
--  buttons keep working and the keybinds fire while it is faded out.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local SECTION = "Action Bars"
local LINGER = 1   -- seconds a bar stays after the mouse left it
local FADE = 0.3   -- seconds from hidden to shown and back
local HOVER_CHECK = 0.05

-- Bars 1-8 are numbered as in GetActionBarToggles.
local BARS = {
    { id = "1", label = "Action Bar 1", frame = "MainActionBar" },
    { id = "2", label = "Action Bar 2", frame = "MultiBarBottomLeft" },
    { id = "3", label = "Action Bar 3", frame = "MultiBarBottomRight" },
    { id = "4", label = "Action Bar 4", frame = "MultiBarRight" },
    { id = "5", label = "Action Bar 5", frame = "MultiBarLeft" },
    { id = "6", label = "Action Bar 6", frame = "MultiBar5" },
    { id = "7", label = "Action Bar 7", frame = "MultiBar6" },
    { id = "8", label = "Action Bar 8", frame = "MultiBar7" },
    { id = "stance", label = "Stance Bar", frame = "StanceBar" },
    { id = "pet", label = "Pet Bar", frame = "PetActionBar" },
    { id = "micro", label = "Micro Menu", frame = "MicroMenuContainer" },
    { id = "bags", label = "Bags Bar", frame = "BagsBar" },
    -- The manager's own rect is a strip at the screen's bottom edge, behind
    -- the micro menu; the bars it holds sit above the action bar.
    { id = "xp", label = "XP Bar", frame = "StatusTrackingBarManager",
      over = { "MainStatusTrackingBarContainer", "SecondaryStatusTrackingBarContainer" } },
    -- EndCaps' own rect sits over the bar; the art is in its two children.
    { id = "caps", label = UnitFactionGroup("player") == "Horde" and "Wyverns" or "Gryphons",
      frame = "MainActionBar.EndCaps",
      over = { "MainActionBar.EndCaps.LeftEndCap", "MainActionBar.EndCaps.RightEndCap" } },
}

-- The art at the bar's ends is a child of the first bar and would fade with
-- it; it has its own row instead.
MainActionBar.EndCaps:SetIgnoreParentAlpha(true)

local KEY = "barVisibility"
local NO_RULE = {}

local state = {}  -- [bar id] = { alpha =, lastHover = }
for _, bar in ipairs(BARS) do state[bar.id] = { lastHover = -math.huge } end

local hovered = {}  -- [group] = true while the mouse is over one of its bars

local watcher = CreateFrame("Frame")
watcher:Hide()
local hoverElapsed = 0

-- A global frame, or a field of one as "Parent.Child".
local function Resolve(path)
    local frame
    for name in path:gmatch("[^.]+") do
        frame = frame and frame[name] or _G[name]
    end
    return frame
end

local function Frame(bar)
    return Resolve(bar.frame)
end

local function MouseOver(bar)
    if not bar.over then return Clean(Frame(bar):IsMouseOver()) end
    for _, path in ipairs(bar.over) do
        local frame = Resolve(path)
        if frame:IsShown() and Clean(frame:IsMouseOver()) then return true end
    end
end

local function Rule(bar)
    local all = ns.Get(KEY)
    local own = all[bar.id] or NO_RULE
    if own.link then return all[own.link] or NO_RULE end
    return own
end

-- Bars linked to one another share the id they link to.
local function Group(bar)
    return (ns.Get(KEY)[bar.id] or NO_RULE).link or bar.id
end

local function Managed(rule)
    return not (rule.noCombat and rule.combat and not rule.hover)
end

-- Every bar shows while Edit Mode is open or something is on the cursor.
local function Forced()
    return EditModeManagerFrame:IsShown() or GetCursorInfo()
end

-- Whether the bar may show now, mouse over aside.
local function Allowed(rule)
    local inCombat = InCombatLockdown()
    return inCombat and rule.combat or not inCombat and rule.noCombat
end

local function Target(rule, st, now)
    if Forced() then return 1 end
    if not Allowed(rule) then return 0 end
    if rule.hover and now - st.lastHover >= LINGER then return 0 end
    return 1
end

local function BarOf(frame)
    for _, bar in ipairs(BARS) do
        if Frame(bar) == frame then return bar end
        if bar.over then
            for _, path in ipairs(bar.over) do
                if Resolve(path) == frame then return bar end
            end
        end
    end
end

-- A faded-out bar keeps its mouse so its buttons and keybinds work; its
-- buttons' tooltips would show too.
GameTooltip:HookScript("OnShow", function(self)
    local frame = self:GetOwner()
    while frame do
        local bar = BarOf(frame)
        if bar then
            local rule = Rule(bar)
            if Managed(rule) and not Forced() and not Allowed(rule) then self:Hide() end
            return
        end
        frame = frame:GetParent()
    end
end)

watcher:SetScript("OnUpdate", function(self, elapsed)
    local now = GetTime()
    hoverElapsed = hoverElapsed + elapsed
    local checkHover = hoverElapsed >= HOVER_CHECK
    if checkHover then hoverElapsed = 0 end
    local step = elapsed / FADE

    if checkHover then
        wipe(hovered)
        for _, bar in ipairs(BARS) do
            if Rule(bar).hover and Frame(bar):IsShown() and MouseOver(bar) then
                hovered[Group(bar)] = true
            end
        end
    end

    for _, bar in ipairs(BARS) do
        local frame, rule, st = Frame(bar), Rule(bar), state[bar.id]
        if frame:IsShown() and Managed(rule) then
            if checkHover and rule.hover and hovered[Group(bar)] then st.lastHover = now end
            local target = Target(rule, st, now)
            local alpha = st.alpha or 1
            if alpha ~= target then
                alpha = target > alpha and math.min(alpha + step, 1) or math.max(alpha - step, 0)
                st.alpha = alpha
                frame:SetAlpha(alpha)
            end
        end
    end
end)

-- Runs at login and on every change: bars left to Blizzard go back to full
-- alpha right away; the watcher only runs while some bar is not.
local function Refresh()
    local watching = false
    for _, bar in ipairs(BARS) do
        if not Managed(Rule(bar)) then
            local st = state[bar.id]
            if st.alpha then
                st.alpha = nil
                Frame(bar):SetAlpha(1)
            end
        else
            watching = true
        end
    end
    hoverElapsed = HOVER_CHECK
    watcher:SetShown(watching)
end

local rows, default = {}, {}
for i, bar in ipairs(BARS) do
    rows[i] = { key = bar.id, label = bar.label }
    default[bar.id] = { noCombat = true, combat = true }
end

ns.RegisterFeature({
    key = KEY, label = "Visibility", section = SECTION, category = "Visibility",
    type = "grid", default = default, apply = Refresh, closed = true,
    rows = rows, rowLabel = "Bar", link = "Linked to",
    columns = {
        { field = "noCombat", label = "Out of combat" },
        { field = "combat", label = "In combat" },
        { field = "hover", label = "Mouse over" },
    },
})

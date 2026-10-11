-------------------------------------------------------------------------------
--  Bar Visibility -- per bar, when it shows: always, out of combat, in
--  combat, on mouse over (and a second after), or never when nothing is
--  ticked. Only the bar's alpha changes, so its buttons keep working and
--  the keybinds fire while it is faded out.
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
    { id = "caps", label = UnitFactionGroup("player") == "Horde" and "Wyverns" or "Gryphons",
      frame = "MainActionBar", field = "EndCaps" },
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
}

-- The art at the bar's ends is a child of the first bar and would fade with
-- it; it has its own row instead.
MainActionBar.EndCaps:SetIgnoreParentAlpha(true)

local ALWAYS = { always = true }
local KEY = "barVisibility"

local state = {}  -- [bar id] = { alpha =, lastHover = }
for _, bar in ipairs(BARS) do state[bar.id] = { lastHover = -math.huge } end

local watcher = CreateFrame("Frame")
watcher:Hide()
local hoverElapsed = 0

local function Frame(bar)
    local frame = _G[bar.frame]
    return bar.field and frame[bar.field] or frame
end

local function MouseOver(bar)
    if not bar.over then return Clean(Frame(bar):IsMouseOver()) end
    for _, name in ipairs(bar.over) do
        local frame = _G[name]
        if frame:IsShown() and Clean(frame:IsMouseOver()) then return true end
    end
end

local function Rule(bar)
    return ns.Get(KEY)[bar.id] or ALWAYS
end

local function Target(rule, st, now)
    if rule.always or EditModeManagerFrame:IsShown() or GetCursorInfo() then return 1 end
    if rule.combat and InCombatLockdown() then return 1 end
    if rule.noCombat and not InCombatLockdown() then return 1 end
    if rule.hover and now - st.lastHover < LINGER then return 1 end
    return 0
end

watcher:SetScript("OnUpdate", function(self, elapsed)
    local now = GetTime()
    hoverElapsed = hoverElapsed + elapsed
    local checkHover = hoverElapsed >= HOVER_CHECK
    if checkHover then hoverElapsed = 0 end
    local step = elapsed / FADE

    for _, bar in ipairs(BARS) do
        local frame, rule, st = Frame(bar), Rule(bar), state[bar.id]
        if frame:IsShown() then
            if checkHover and rule.hover and MouseOver(bar) then st.lastHover = now end
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

-- Runs at login and on every change: bars that became Always go back to
-- full alpha right away; the watcher only runs while some bar is not Always.
local function Refresh()
    local watching = false
    for _, bar in ipairs(BARS) do
        if Rule(bar).always then
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

local rows = {}
for i, bar in ipairs(BARS) do rows[i] = { key = bar.id, label = bar.label } end

ns.RegisterFeature({
    key = KEY, label = "Visibility", section = SECTION, category = "Visibility",
    type = "grid", default = {}, apply = Refresh,
    rows = rows, rowDefault = ALWAYS, exclusive = "always",
    columns = {
        { field = "always", label = "Always" },
        { field = "noCombat", label = "Out of combat" },
        { field = "combat", label = "In combat" },
        { field = "hover", label = "Mouse over" },
    },
})

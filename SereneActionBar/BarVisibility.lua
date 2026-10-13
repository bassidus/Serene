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
    { id = "1", label = "Action Bar 1", frame = MainActionBar },
    { id = "2", label = "Action Bar 2", frame = MultiBarBottomLeft },
    { id = "3", label = "Action Bar 3", frame = MultiBarBottomRight },
    { id = "4", label = "Action Bar 4", frame = MultiBarRight },
    { id = "5", label = "Action Bar 5", frame = MultiBarLeft },
    { id = "6", label = "Action Bar 6", frame = MultiBar5 },
    { id = "7", label = "Action Bar 7", frame = MultiBar6 },
    { id = "8", label = "Action Bar 8", frame = MultiBar7 },
    { id = "stance", label = "Stance Bar", frame = StanceBar },
    { id = "pet", label = "Pet Bar", frame = PetActionBar },
    { id = "micro", label = "Micro Menu", frame = MicroMenuContainer },
    { id = "bags", label = "Bags Bar", frame = BagsBar },
    -- The manager's own rect is a strip at the screen's bottom edge, behind
    -- the micro menu; the bars it holds sit above the action bar.
    { id = "xp", label = "XP Bar", frame = StatusTrackingBarManager,
      over = { MainStatusTrackingBarContainer, SecondaryStatusTrackingBarContainer } },
    -- EndCaps' own rect sits over the bar; the art is in its two children.
    { id = "caps", label = UnitFactionGroup("player") == "Horde" and "Wyverns" or "Gryphons",
      frame = MainActionBar.EndCaps,
      over = { MainActionBar.EndCaps.LeftEndCap, MainActionBar.EndCaps.RightEndCap } },
}

-- The art at the bar's ends is a child of the first bar and would fade with
-- it; it has its own row instead.
MainActionBar.EndCaps:SetIgnoreParentAlpha(true)

local KEY = "barVisibility"
local NO_RULE = {}

local state = {}  -- [bar id] = { alpha =, lastHover = }
for _, bar in ipairs(BARS) do state[bar.id] = { lastHover = -math.huge } end

-- Read from the setting in Refresh, so the watcher and the tooltip hook
-- don't look it up on every frame.
local rules, groups = {}, {}  -- [bar id] = rule, id of the bar it links to

local barOf = {}  -- [frame] = bar, for the frames whose tooltip it hides
for _, bar in ipairs(BARS) do
    barOf[bar.frame] = bar
    if bar.over then
        for _, frame in ipairs(bar.over) do barOf[frame] = bar end
    end
end

local hovered = {}  -- [group] = true while the mouse is over one of its bars

local watcher = CreateFrame("Frame")
watcher:Hide()
local hoverElapsed = 0
local watching = false  -- some bar is not left to Blizzard
local fading = false    -- some bar's alpha is on its way to its target

local function MouseOver(bar)
    if not bar.over then return Clean(bar.frame:IsMouseOver()) end
    for _, frame in ipairs(bar.over) do
        if frame:IsShown() and Clean(frame:IsMouseOver()) then return true end
    end
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

local function Target(rule, st, now, forced)
    if forced then return 1 end
    if not Allowed(rule) then return 0 end
    if rule.hover and now - st.lastHover >= LINGER then return 0 end
    return 1
end

-- A faded-out bar keeps its mouse so its buttons and keybinds work; its
-- buttons' tooltips would show too.
GameTooltip:HookScript("OnShow", function(self)
    local frame = self:GetOwner()
    while frame do
        local bar = barOf[frame]
        if bar then
            local rule = rules[bar.id]
            if Managed(rule) and not Forced() and not Allowed(rule) then self:Hide() end
            return
        end
        frame = frame:GetParent()
    end
end)

-- Runs every frame only while a bar fades; otherwise it does nothing
-- between the mouse checks.
watcher:SetScript("OnUpdate", function(self, elapsed)
    hoverElapsed = hoverElapsed + elapsed
    local checkHover = hoverElapsed >= HOVER_CHECK
    if not checkHover and not fading then return end
    local step = elapsed / FADE
    if checkHover then hoverElapsed = 0 end
    local now, forced = GetTime(), Forced()

    if checkHover then
        wipe(hovered)
        for _, bar in ipairs(BARS) do
            if rules[bar.id].hover and bar.frame:IsShown() and MouseOver(bar) then
                hovered[groups[bar.id]] = true
            end
        end
    end

    -- Settled once every bar is where it should be and none waits on the
    -- mouse; then only the events below wake the watcher.
    local settled = true
    fading = false
    for _, bar in ipairs(BARS) do
        local frame, rule, st = bar.frame, rules[bar.id], state[bar.id]
        if Managed(rule) then
            local target = Target(rule, st, now, forced)
            local alpha = st.alpha or 1
            if not frame:IsShown() then
                -- No fade for a hidden bar, so it is right when it shows.
                if alpha ~= target then
                    st.alpha = target
                    frame:SetAlpha(target)
                end
            else
                if rule.hover then
                    settled = false
                    if checkHover and hovered[groups[bar.id]] then
                        st.lastHover = now
                        target = Target(rule, st, now, forced)
                    end
                end
                if alpha ~= target then
                    alpha = target > alpha and math.min(alpha + step, 1) or math.max(alpha - step, 0)
                    st.alpha = alpha
                    frame:SetAlpha(alpha)
                    if alpha ~= target then
                        settled = false
                        fading = true
                    end
                end
            end
        end
    end
    if settled then self:Hide() end
end)

-- What Target() reads: combat, the cursor and Edit Mode.
local function Wake()
    if not watching then return end
    hoverElapsed = HOVER_CHECK
    watcher:Show()
end
watcher:RegisterEvent("PLAYER_REGEN_DISABLED")
watcher:RegisterEvent("PLAYER_REGEN_ENABLED")
watcher:RegisterEvent("CURSOR_CHANGED")
watcher:SetScript("OnEvent", Wake)
EditModeManagerFrame:HookScript("OnShow", Wake)
EditModeManagerFrame:HookScript("OnHide", Wake)

-- Runs at login and on every change: bars left to Blizzard go back to full
-- alpha right away; the watcher only runs while some bar is not, and sleeps
-- while nothing moves.
local function Refresh()
    local all = ns.Get(KEY)
    for _, bar in ipairs(BARS) do
        local own = all[bar.id] or NO_RULE
        rules[bar.id] = own.link and (all[own.link] or NO_RULE) or own
        groups[bar.id] = own.link or bar.id
    end
    watching = false
    for _, bar in ipairs(BARS) do
        if not Managed(rules[bar.id]) then
            local st = state[bar.id]
            if st.alpha then
                st.alpha = nil
                bar.frame:SetAlpha(1)
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

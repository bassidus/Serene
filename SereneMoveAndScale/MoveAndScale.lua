-------------------------------------------------------------------------------
--  Move & scale -- Blizzard's windows moved with the mouse and made
--  smaller or bigger: a scale in percent for each, from its slider or
--  Ctrl + scroll over it. A window grows and shrinks from its top left
--  corner, and is never made taller than the screen.
--
--  A frame's anchor offsets count in its own scale, so a smaller window
--  would slide toward the edge it is anchored to. Each anchor is kept as
--  set (by the window's XML or by Blizzard as it opens) and set again with
--  the offsets divided by the scale, which leaves the corner in place. A
--  window moved by hand goes to its own spot instead, every time Blizzard
--  places it, and gets its scale back every time Blizzard sets one (some
--  windows shrink themselves to fit the screen as they open).
--
--  Moved spots and Ctrl + scroll sizes last for the session. With
--  "Remember" on, the spots are kept in SereneDB.windowPositions (by frame
--  name, the top left corner in UIParent units) and Ctrl + scroll sets the
--  window's slider; with it off, windows start each session at Blizzard's
--  spot and their slider size. A middle click puts a window back at
--  Blizzard's spot and size.
--
--  A window is dragged from any spot that does not take the press itself
--  (a button, text field, slider or model), panels covering it included:
--  the left button is watched with GLOBAL_MOUSE_DOWN and the window set at
--  the cursor every frame, which also works on a window that was open when
--  moving was turned on (RegisterForDrag only takes effect once it opens
--  again).
--
--  Each entry lists the frame names the window may have on this client
--  (classic and modern names; every one that exists on UIParent is used,
--  so a panel inside another window is left alone). Frames made by an
--  addon loaded later (load on demand or not) are taken in as each addon
--  loads. At 100 % a window Serene never scaled is left
--  to Blizzard. A scaleOnly entry (the objective tracker, which Edit Mode
--  places) only gets its scale: its anchors, the screen height limit and
--  the mouse are left out, and it need not sit on UIParent.
--  Changes to a protected window wait for the end of combat.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Move & scale"

local WINDOWS = {
    { key = "Character", label = "Character", category = "Your character",
      frames = { "CharacterFrame" },
      tooltip = "The character window, with reputation, skills and honor." },
    { key = "Spellbook", label = "Spellbook", category = "Your character",
      frames = { "SpellBookFrame", "PlayerSpellsFrame" } },
    { key = "Talents", label = "Talents", category = "Your character",
      frames = { "TalentFrame", "PlayerTalentFrame", "ClassTalentFrame" },
      tooltip = "Where talents share the spellbook's window, the Spellbook size is used." },
    { key = "Professions", label = "Professions", category = "Your character",
      frames = { "TradeSkillFrame", "CraftFrame", "ProfessionsFrame", "ProfessionsBookFrame" },
      tooltip = "Profession windows such as Blacksmithing, Cooking and Enchanting." },
    { key = "QuestLog", label = "Quest log", category = "Your character",
      frames = { "QuestLogFrame", "QuestLogDetailFrame" } },
    { key = "Social", label = "Social", category = "Your character",
      frames = { "FriendsFrame", "CommunitiesFrame" },
      tooltip = "Friends, who, guild and raid." },
    { key = "Achievements", label = "Achievements", category = "Your character",
      frames = { "AchievementFrame" } },
    { key = "Macros", label = "Macros", category = "Your character",
      frames = { "MacroFrame" } },

    { key = "Gossip", label = "Quest givers & gossip", category = "NPCs",
      frames = { "QuestFrame", "GossipFrame", "ItemTextFrame" },
      tooltip = "What an NPC says when you talk to them, the quests they give, and books and letters you read." },
    { key = "Merchant", label = "Vendors", category = "NPCs",
      frames = { "MerchantFrame" } },
    { key = "Trainer", label = "Trainers", category = "NPCs",
      frames = { "ClassTrainerFrame" } },
    { key = "Bank", label = "Bank", category = "NPCs",
      frames = { "BankFrame" } },
    { key = "Mail", label = "Mailbox", category = "NPCs",
      frames = { "MailFrame", "OpenMailFrame" } },
    { key = "Auction", label = "Auction house", category = "NPCs",
      frames = { "AuctionFrame", "AuctionHouseFrame" } },
    { key = "Taxi", label = "Flight master", category = "NPCs",
      frames = { "TaxiFrame", "FlightMapFrame" } },
    { key = "Stable", label = "Stable master", category = "NPCs",
      frames = { "PetStableFrame", "StableFrame" } },

    { key = "WorldMap", label = "World map", category = "Other",
      frames = { "WorldMapFrame" } },
    { key = "Groups", label = "Group finder & PvP", category = "Other",
      frames = { "LFGParentFrame", "PVEFrame", "PVPFrame", "PVPParentFrame", "BattlefieldFrame", "WorldStateScoreFrame" } },
    { key = "DressUp", label = "Dressing room", category = "Other",
      frames = { "DressUpFrame" } },
    { key = "Inspect", label = "Inspect", category = "Other",
      frames = { "InspectFrame" } },
    { key = "Trade", label = "Trade", category = "Other",
      frames = { "TradeFrame" } },
    { key = "GameMenu", label = "Game menu & settings", category = "Other",
      frames = { "GameMenuFrame", "SettingsPanel", "InterfaceOptionsFrame", "VideoOptionsFrame", "KeyBindingFrame", "AddonList" },
      tooltip = "The Escape menu, Blizzard's settings, key bindings and the addon list." },
    { key = "Tracker", label = "Objective tracker", category = "Other", scaleOnly = true,
      frames = { "ObjectiveTrackerFrame", "WatchFrame", "QuestWatchFrame" },
      tooltip = "The quest list at the side of the screen. It grows and shrinks from where Blizzard "
          .. "(or Edit Mode) puts it, and is not moved with the mouse." },
}

local function Key(window) return "windowScale" .. window.key end

local STEP, MIN, MAX = 5, 50, 150

local scaled = {}   -- frame -> true while Serene's scale is on it
local placed = {}   -- frame -> true while it sits at its moved spot
local hooked = {}   -- frame -> its window, once its hooks are in
local anchors = {}  -- frame -> { [point] = { relativeTo, relativePoint, x, y } } at scale 1
local mouse = {}    -- frame -> true once it can be moved and resized with the mouse
local ownWheel = {} -- frame -> true when Blizzard already takes its mouse wheel
local moved = {}    -- frame name -> { left, top }; SereneDB.windowPositions while remembered
local sessionScale = {}  -- window -> percent set by Ctrl + scroll, while not remembered
local pending       -- windows waiting for combat to end
local busy          -- while Serene sets points or scale, which the hooks skip

local function Locked(frame) return InCombatLockdown() and frame:IsProtected() end

local function Percent(window) return sessionScale[window] or ns.Get(Key(window)) end

-- Effective scale against UIParent's: UIParent units per frame unit.
local function Ratio(frame) return frame:GetEffectiveScale() / UIParent:GetEffectiveScale() end

local function Spot(frame)
    return ns.Enabled("windowMove") and moved[frame:GetName()]
end

-- Puts the frame at its moved spot, or back on Blizzard's anchors with the
-- offsets divided by the scale.
local function Anchor(frame)
    if not anchors[frame] then return end  -- scaleOnly
    if not (scaled[frame] or placed[frame] or Spot(frame)) or Locked(frame) then return end
    local spot = Spot(frame)
    busy = true
    if spot then
        local r = Ratio(frame)
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", spot[1] / r, spot[2] / r)
        placed[frame] = true
    elseif next(anchors[frame]) then
        local s = frame:GetScale()
        frame:ClearAllPoints()
        for point, a in pairs(anchors[frame]) do
            frame:SetPoint(point, a[1], a[2], a[3] / s, a[4] / s)
        end
        placed[frame] = nil
    end
    busy = false
end

local function Scale(window, frame)
    if Locked(frame) then
        pending = pending or {}
        pending[window] = true
        return
    end
    local pct = Percent(window)
    if pct ~= 100 or scaled[frame] then
        local scale = pct / 100
        -- No taller than the screen (a maximized world map is the screen).
        local height = frame:GetHeight()
        if scale > 1 and height and height > 0 and not window.scaleOnly then
            scale = math.max(1, math.min(scale, UIParent:GetHeight() / height))
        end
        busy = true
        frame:SetScale(scale)
        busy = false
        scaled[frame] = pct ~= 100 or nil
    end
    Anchor(frame)
end

-- The points as they are now, counted at scale 1, kept as Blizzard sets
-- new ones; and Serene's scale back on whenever Blizzard sets its own.
local function Hook(frame, window)
    hooked[frame] = window
    hooksecurefunc(frame, "SetScale", function(self)
        if not busy and scaled[self] then Scale(window, self) end
    end)
    if window.scaleOnly then return end
    anchors[frame] = {}
    local s = frame:GetScale()
    for i = 1, frame:GetNumPoints() do
        local point, relativeTo, relativePoint, x, y = frame:GetPoint(i)
        anchors[frame][point] = { relativeTo, relativePoint, x * s, y * s }
    end
    local function Clear(self)
        if not busy then anchors[self] = {} end
    end
    hooksecurefunc(frame, "ClearAllPoints", Clear)
    hooksecurefunc(frame, "SetAllPoints", Clear)
    -- Blizzard places its panels as they open, in offsets meant for scale 1.
    hooksecurefunc(frame, "SetPoint", function(self, point)
        if busy then return end
        point = point:upper()
        for i = 1, self:GetNumPoints() do
            local p, relativeTo, relativePoint, x, y = self:GetPoint(i)
            if p == point then anchors[self][p] = { relativeTo, relativePoint, x, y } end
        end
        Anchor(self)
    end)
end

local ApplyWindow

-- The cursor in UIParent units.
local function Cursor()
    local x, y = GetCursorPosition()
    local s = UIParent:GetEffectiveScale()
    return x / s, y / s
end

local drag  -- { frame =, name =, left =, top =, x =, y = } while a window follows the cursor

-- From the press, so the window does not jump by the distance moved
-- before the drag began.
local function StartDrag(frame, x, y)
    if not ns.Enabled("windowMove") or Locked(frame) or not frame:GetLeft() then return end
    local r = Ratio(frame)
    drag = { frame = frame, name = frame:GetName(), left = frame:GetLeft() * r, top = frame:GetTop() * r, x = x, y = y }
end

-- Keeps the spot where the window ended up, kept on screen.
local function StopDrag()
    if not drag then return end
    local frame = drag.frame
    drag = nil
    local left, top = frame:GetLeft(), frame:GetTop()
    if not left then return end
    local r = Ratio(frame)
    moved[frame:GetName()] = { left * r, top * r }
    Anchor(frame)
end

-- The new size by the cursor for a moment.
local sizeTip
local function ShowPercent(frame, pct)
    GameTooltip:SetOwner(frame, "ANCHOR_CURSOR")
    GameTooltip:SetText(pct .. "%", 1, 1, 1)
    GameTooltip:Show()
    if sizeTip then sizeTip:Cancel() end
    sizeTip = C_Timer.NewTimer(1, function()
        sizeTip = nil
        if GameTooltip:IsOwned(frame) then GameTooltip:Hide() end
    end)
end

local function Wheel(frame, delta)
    if not (ns.Enabled("windowMove") and IsControlKeyDown()) or Locked(frame) then return end
    local window = hooked[frame]
    local pct = math.min(MAX, math.max(MIN, Percent(window) + delta * STEP))
    if pct == Percent(window) then return end
    if ns.Enabled("windowRemember") then
        ns.SetValue(Key(window), pct)
    else
        sessionScale[window] = pct
        ApplyWindow(window)
    end
    ShowPercent(frame, pct)
end

-- Middle click: Blizzard's spot and size.
local function ResetWindow(frame)
    if Locked(frame) then return end
    moved[frame:GetName()] = nil
    ns.SetValue(Key(hooked[frame]), 100)  -- its apply drops the session size and places the window
end

-- The mouse wheel is only taken while Ctrl is down, so scrolling over a
-- window still zooms the camera.
local function EnableMouse(frame)
    if mouse[frame] or Locked(frame) then return end
    mouse[frame] = true
    ownWheel[frame] = frame:IsMouseWheelEnabled()
    frame:SetClampedToScreen(true)
    frame:HookScript("OnHide", function(self)
        if drag and drag.frame == self then StopDrag() end
    end)
    frame:HookScript("OnMouseWheel", Wheel)
end

local CLICKABLE = { "Button", "EditBox", "Slider", "Model", "ModelScene" }

local function TakesPress(region)
    for _, kind in ipairs(CLICKABLE) do
        if region:IsObjectType(kind) then return true end
    end
    return region.HasScript and region:HasScript("OnMouseDown") and region:GetScript("OnMouseDown") ~= nil
end

-- The window under the cursor, unless what is on top there takes the press.
local function WindowAtCursor()
    local focus
    if GetMouseFoci then focus = GetMouseFoci()[1] else focus = GetMouseFocus() end
    if not focus or not focus.IsObjectType or (focus.IsForbidden and focus:IsForbidden()) then return end
    if not mouse[focus] and TakesPress(focus) then return end
    while focus and not mouse[focus] do focus = focus:GetParent() end
    return focus
end

-- A left press on a window becomes a drag once the cursor moves a little;
-- then the window follows the cursor.
local DRAG_START = 4  -- UIParent units
local press           -- { frame =, x =, y = } until it is dragged or let go

local watcher = CreateFrame("Frame")
watcher:Hide()
watcher:SetScript("OnUpdate", function(self)
    local x, y = Cursor()
    if press and math.abs(x - press.x) + math.abs(y - press.y) >= DRAG_START then
        StartDrag(press.frame, press.x, press.y)
        press = nil
    end
    if drag and not Locked(drag.frame) then
        moved[drag.name] = { drag.left + x - drag.x, drag.top + y - drag.y }
        Anchor(drag.frame)
    end
    if not (press or drag) then self:Hide() end
end)

local function MouseDown(button)
    if button ~= "LeftButton" or not ns.Enabled("windowMove") then return end
    local frame = WindowAtCursor()
    if not frame then return end
    local x, y = Cursor()
    press = { frame = frame, x = x, y = y }
    watcher:Show()
end

local function MouseUp(button)
    if button == "LeftButton" then
        press = nil
        StopDrag()
    elseif button == "MiddleButton" and ns.Enabled("windowMove") then
        local frame = WindowAtCursor()
        if frame then ResetWindow(frame) end
    end
end

local function WheelOn()
    local on = ns.Enabled("windowMove") and IsControlKeyDown()
    for frame in pairs(mouse) do
        if not ownWheel[frame] and not Locked(frame) then frame:EnableMouseWheel(on) end
    end
end

function ApplyWindow(window)
    for _, name in ipairs(window.frames) do
        local frame = _G[name]
        if type(frame) == "table" and frame.SetScale and (window.scaleOnly or frame:GetParent() == UIParent) then
            if not hooked[frame] then Hook(frame, window) end
            if ns.Enabled("windowMove") and not window.scaleOnly then EnableMouse(frame) end
            Scale(window, frame)
        end
    end
end

local function ApplyAll()
    for _, window in ipairs(WINDOWS) do ApplyWindow(window) end
end

-- A frame of the window that has turned up on UIParent since it was applied.
local function NewFrame(window)
    for _, name in ipairs(window.frames) do
        local frame = _G[name]
        if type(frame) == "table" and frame.SetScale and not hooked[frame]
            and (window.scaleOnly or frame:GetParent() == UIParent) then
            return true
        end
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:RegisterEvent("MODIFIER_STATE_CHANGED")
events:RegisterEvent("GLOBAL_MOUSE_DOWN")
events:RegisterEvent("GLOBAL_MOUSE_UP")
events:SetScript("OnEvent", function(_, event, arg)
    if event == "ADDON_LOADED" then
        -- Before login the frames are taken in by ApplyAll.
        if not IsLoggedIn() then return end
        for _, window in ipairs(WINDOWS) do
            if NewFrame(window) then ApplyWindow(window) end
        end
        return
    end
    if event == "MODIFIER_STATE_CHANGED" then
        if arg == "LCTRL" or arg == "RCTRL" then WheelOn() end
        return
    end
    if event == "GLOBAL_MOUSE_DOWN" then return MouseDown(arg) end
    if event == "GLOBAL_MOUSE_UP" then return MouseUp(arg) end
    if not pending then return end
    local waiting = pending
    pending = nil
    for window in pairs(waiting) do ApplyWindow(window) end
end)

-- Turned on, the session's spots become the saved ones (at login: the saved
-- ones are loaded) and Ctrl + scroll sizes go to the sliders.
local function ApplyRemember()
    if ns.Enabled("windowRemember") then
        moved = SereneDB.windowPositions or moved
        SereneDB.windowPositions = moved
        for window, pct in pairs(sessionScale) do ns.SetValue(Key(window), pct) end
    else
        SereneDB.windowPositions = nil
    end
end

ns.OnReset(function()
    wipe(moved)
    wipe(sessionScale)
end, SECTION)

ns.SetPageIntro(SECTION, "With \"Move windows with the mouse\" on:\n"
    .. "- Drag a window by any spot that is not a button or a model to move it.\n"
    .. "- Hold Ctrl and scroll over a window to make it smaller or bigger.\n"
    .. "- Middle-click a window to put it back at Blizzard's spot and size.\n"
    .. "The sliders below set each window's size, from 50% to 150%. 100% is Blizzard's size.")

ns.RegisterFeature({
    key = "windowMove", label = "Move windows with the mouse", section = SECTION, category = "Mouse",
    default = false, apply = ApplyAll,
    tooltip = "Drag a window by any spot that is not a button or a model to move it. Hold Ctrl and scroll over a "
        .. "window to make it smaller or bigger. Middle-click a window to put it back at Blizzard's "
        .. "spot and size.",
})
ns.RegisterFeature({
    key = "windowRemember", label = "Remember positions and sizes", section = SECTION, category = "Mouse",
    requires = "windowMove", apply = ApplyRemember,
    tooltip = "Windows you have moved, and sizes set with Ctrl + scroll, stay after a reload or logout. "
        .. "Off: each session starts with Blizzard's spots and the sizes below.",
})

-- Two sliders to a row: every second one in a category goes beside the one before.
local inCategory = {}
for _, window in ipairs(WINDOWS) do
    inCategory[window.category] = (inCategory[window.category] or 0) + 1
    ns.RegisterFeature({
        key = Key(window), label = window.label, section = SECTION, category = window.category,
        beside = inCategory[window.category] % 2 == 0, type = "slider", min = MIN, max = MAX, step = STEP, default = 100, suffix = "%",
        -- A slider change wins over a Ctrl + scroll size from this session.
        apply = function() sessionScale[window] = nil; ApplyWindow(window) end,
        tooltip = window.tooltip,  -- what all the sliders do is in the page intro
    })
end

-------------------------------------------------------------------------------
--  Move & Scale -- Blizzard's windows dragged with the mouse and scaled from
--  a slider or Ctrl + scroll. A window scales from its top left corner and
--  is never made taller than the screen. A frame's anchor offsets count in
--  its own scale, so each anchor Blizzard sets is kept at scale 1 and set
--  again divided by the scale; a moved window goes to its own spot instead.
--  Dragging watches GLOBAL_MOUSE_DOWN/UP and follows the cursor, since
--  RegisterForDrag does not take on a window that is already open.
--  Changes to a protected window wait for the end of combat.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Move & Scale"

local WINDOWS = {
    { key = "Character", label = "Character sheet",
      frames = { "CharacterFrame" } },
    { key = "Bags", label = "Bags", titleMenu = true,
      frames = { "ContainerFrameCombinedBags", "ContainerFrame1", "ContainerFrame2", "ContainerFrame3",
                 "ContainerFrame4", "ContainerFrame5", "ContainerFrame6", "ContainerFrame7" } },
    { key = "Spellbook", label = "Spellbook & talents",
      frames = { "PlayerSpellsFrame" }, handles = { "TalentsFrame.ButtonsParent" } },
    { key = "Professions", label = "Professions & recipes",
      frames = { "ProfessionsFrame", "InspectRecipeFrame" } },
    { key = "Social", label = "Friends & guild",
      frames = { "FriendsFrame", "CommunitiesFrame", "GuildControlUI" } },
    { key = "Achievements", label = "Achievements",
      frames = { "AchievementFrame" } },
    { key = "Macros", label = "Macros",
      frames = { "MacroFrame" } },
    { key = "Collections", label = "Mounts, pets & toys",
      frames = { "CollectionsJournal" } },

    { key = "Gossip", label = "NPC talk & quest text",
      frames = { "QuestFrame", "GossipFrame", "ItemTextFrame" } },
    { key = "Merchant", label = "Vendor",
      frames = { "MerchantFrame" } },
    { key = "Trainer", label = "Trainer",
      frames = { "ClassTrainerFrame" } },
    { key = "Bank", label = "Bank",
      frames = { "BankFrame" } },
    { key = "Mail", label = "Mailbox",
      frames = { "MailFrame", "OpenMailFrame" } },
    { key = "Auction", label = "Auction house",
      frames = { "AuctionHouseFrame" } },
    { key = "Taxi", label = "Flight master map",
      frames = { "TaxiFrame", "FlightMapFrame" } },
    { key = "Stable", label = "Stable master",
      frames = { "PetStableFrame" } },
    { key = "Guild", label = "Guild charter & tabard",
      frames = { "GuildRegistrarFrame", "PetitionFrame", "TabardFrame" } },

    { key = "WorldMap", label = "World map & quest log",
      frames = { "WorldMapFrame", "QuestLogPopupDetailFrame" } },
    { key = "Loot", label = "Loot & roll history",
      frames = { "LootFrame", "GroupLootHistoryFrame" } },
    { key = "ItemRef", label = "Item links from chat",
      frames = { "ItemRefTooltip" } },
    { key = "ReadyCheck", label = "Ready check & role poll",
      frames = { "ReadyCheckFrame", "RolePollPopup" } },
    { key = "Groups", label = "Group finder (LFG)",
      frames = { "LFGParentFrame" } },
    { key = "DressUp", label = "Dressing room",
      frames = { "DressUpFrame", "ModelPreviewFrame" } },
    { key = "Inspect", label = "Inspect player",
      frames = { "InspectFrame" } },
    { key = "Trade", label = "Trade with a player",
      frames = { "TradeFrame" } },
    { key = "Chat", label = "Chat settings & channels",
      frames = { "ChatConfigFrame", "ChannelFrame" } },
    { key = "Calendar", label = "Clock & calendar",
      frames = { "TimeManagerFrame", "CalendarFrame" } },
    { key = "Scoreboard", label = "Battleground scores",
      frames = { "PVPMatchScoreboard", "PVPMatchResults" } },
    { key = "DeathRecap", label = "Death recap",
      frames = { "DeathRecapFrame" } },
    { key = "LuaErrors", label = "Lua error window",
      frames = { "ScriptErrorsFrame" } },
    { key = "GameMenu", label = "Escape menu & settings",
      frames = { "GameMenuFrame", "SettingsPanel", "AddonList", "HelpFrame", "QuickKeybindFrame" } },
    { key = "Tracker", label = "Quest tracker", scaleOnly = true,
      frames = { "ObjectiveTrackerFrame" } },
}

local byKey = {}
for _, window in ipairs(WINDOWS) do byKey[window.key] = window end

local STEP, MIN, MAX = 5, 50, 150

local scaled = {}   -- frame -> true while Serene's scale is on it
local placed = {}   -- frame -> true while it sits at its moved spot
local hooked = {}   -- frame -> its window, once its hooks are in
local anchors = {}  -- frame -> { [point] = { relativeTo, relativePoint, x, y } } at scale 1
local mouse = {}    -- frame -> true once it can be moved and resized with the mouse
local moved = {}    -- frame name -> { left, top }; SereneDB.windowPositions from login
-- SereneDB.windowScales: window key -> percent other than 100
local pending       -- windows waiting for combat to end
local busy          -- while Serene sets points or scale, which the hooks skip

-- Windows take the mouse while it drags or resizes them.
local function Handled() return ns.Get("moveAndScale") end

local function Locked(frame) return InCombatLockdown() and frame:IsProtected() end

local function Saved(window)
    return SereneDB.windowScales and SereneDB.windowScales[window.key] or 100
end

-- The window the Size slider is set to.
local function Picked() return byKey[ns.Get("windowSizeWindow")] end

-- Effective scale against UIParent's: UIParent units per frame unit.
local function Ratio(frame) return frame:GetEffectiveScale() / UIParent:GetEffectiveScale() end

local function Spot(frame)
    return Handled() and moved[frame:GetName()]
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
    local pct = Saved(window)
    if pct ~= 100 or scaled[frame] then
        local scale = pct / 100
        -- No taller than the screen (a maximized world map is the screen).
        local height = frame:GetHeight()
        if scale > 1 and height > 0 and not window.scaleOnly then
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

-- Only frames on the screen itself, so a panel inside another window is left
-- alone. The separate bags sit in ContainerFrameContainer, which covers
-- UIParent; the Lua error window has no parent, so it shows with the UI hidden.
local function OnScreen(window, frame)
    local parent = frame:GetParent()
    return window.scaleOnly or parent == UIParent or parent == ContainerFrameContainer or parent == nil
end

local function Script(region, script)
    return region:HasScript(script) and region:GetScript(script) ~= nil
end

-- The cursor in UIParent units.
local function Cursor()
    local x, y = GetCursorPosition()
    local s = UIParent:GetEffectiveScale()
    return x / s, y / s
end

local drag  -- { frame =, name =, left =, top =, x =, y =, own = } while a window follows the cursor

-- From the press, so the window does not jump by the distance moved
-- before the drag began. A window Blizzard drags itself (item links, loot
-- history) is left to that, and only its spot is kept.
local function StartDrag(frame, x, y)
    if not Handled() or Locked(frame) or not frame:GetLeft() then return end
    local r = Ratio(frame)
    drag = { frame = frame, name = frame:GetName(), left = frame:GetLeft() * r, top = frame:GetTop() * r, x = x, y = y,
             own = Script(frame, "OnDragStart") }
    Menu.GetManager():CloseMenus()  -- a bag's title opened its menu on the press
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

local function SetSaved(window, pct)
    SereneDB.windowScales = SereneDB.windowScales or {}
    SereneDB.windowScales[window.key] = pct ~= 100 and pct or nil
    if Picked() == window then SereneDB.windowSize = pct end
    ApplyWindow(window)
    if ns.RefreshOptions then ns.RefreshOptions() end
end

local function Wheel(frame, delta)
    if not (Handled() and IsControlKeyDown()) or Locked(frame) then return end
    local window = hooked[frame]
    local pct = math.min(MAX, math.max(MIN, Saved(window) + delta * STEP))
    if pct == Saved(window) then return end
    SetSaved(window, pct)
    ns.FlashTip(frame, pct .. "%")
end

-- Middle click: Blizzard's spot and size.
local function ResetWindow(frame)
    if Locked(frame) then return end
    moved[frame:GetName()] = nil
    SetSaved(hooked[frame], 100)  -- also places the window
end

-- A window that lets the mouse through (the character window, ready
-- check) takes it, or its title and border could not be dragged.
local function EnableMouse(frame)
    if mouse[frame] or Locked(frame) then return end
    mouse[frame] = true
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    frame:HookScript("OnHide", function(self)
        if drag and drag.frame == self then StopDrag() end
    end)
end

local CLICKABLE = { "EditBox", "Slider", "Model", "ModelScene" }

-- A button with nothing to do on a click is a label or an overlay.
local function TakesPress(region)
    for _, kind in ipairs(CLICKABLE) do
        if region:IsObjectType(kind) then return true end
    end
    if Script(region, "OnMouseDown") then return true end
    return region:IsObjectType("Button") and (Script(region, "OnClick") or Script(region, "OnMouseUp"))
end

-- Parts that take the press and still drag the window: its handles, and a
-- bag's title, which opens the bag's menu on the press.
local function Handle(region, frame)
    local window = hooked[frame]
    if window.titleMenu and region:GetParent() == frame and region:IsObjectType("Button")
        and not Script(region, "OnClick") then
        return true
    end
    if not window.handles then return end
    for _, path in ipairs(window.handles) do
        local part = frame
        for key in path:gmatch("[^.]+") do part = part and part[key] end
        if part == region then return true end
    end
end

-- The window under the cursor, unless what is on top there takes the press.
local function WindowAtCursor()
    local focus = GetMouseFoci()[1]
    if not focus or not focus.IsObjectType or focus:IsForbidden() then return end
    local frame = focus
    while frame and not mouse[frame] do frame = frame:GetParent() end
    if not frame or (focus ~= frame and TakesPress(focus) and not Handle(focus, frame)) then return end
    return frame
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
    if drag and not drag.own and not Locked(drag.frame) then
        local spot = moved[drag.name] or {}
        spot[1], spot[2] = drag.left + x - drag.x, drag.top + y - drag.y
        moved[drag.name] = spot
        Anchor(drag.frame)
    end
    if not (press or drag) then self:Hide() end
end)

local function MouseDown(button)
    if button ~= "LeftButton" or not Handled() then return end
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
    elseif button == "MiddleButton" and Handled() then
        local frame = WindowAtCursor()
        if frame then ResetWindow(frame) end
    end
end

-- While Ctrl is down, a frame that takes only the mouse wheel lies over the
-- window under the cursor: the panels and lists inside a window would keep
-- the wheel from it. Without Ctrl, scrolling over a window zooms the camera.
local wheelCatcher = CreateFrame("Frame", nil, UIParent)
wheelCatcher:SetFrameStrata("FULLSCREEN_DIALOG")
wheelCatcher:EnableMouseWheel(true)
wheelCatcher:Hide()
local wheelWindow

wheelCatcher:SetScript("OnMouseWheel", function(_, delta) Wheel(wheelWindow, delta) end)

local function WindowUnderCursor()
    for _, focus in ipairs(GetMouseFoci()) do
        if focus ~= wheelCatcher and focus.IsObjectType and not focus:IsForbidden() then
            while focus and not mouse[focus] do focus = focus:GetParent() end
            return focus
        end
    end
end

local ctrlWatcher = CreateFrame("Frame")
ctrlWatcher:Hide()
local ctrlElapsed = 0
ctrlWatcher:SetScript("OnUpdate", function(_, elapsed)
    ctrlElapsed = ctrlElapsed + elapsed
    if ctrlElapsed < 0.1 then return end
    ctrlElapsed = 0
    local window = WindowUnderCursor()
    if window == wheelWindow then return end
    wheelWindow = window
    wheelCatcher:ClearAllPoints()
    if window then wheelCatcher:SetAllPoints(window) end
    wheelCatcher:SetShown(window ~= nil)
end)

local function WheelOn()
    local on = Handled() and IsControlKeyDown()
    ctrlElapsed = 0.1  -- the first check right away
    ctrlWatcher:SetShown(on)
    if not on then
        wheelWindow = nil
        wheelCatcher:Hide()
    end
end

function ApplyWindow(window)
    for _, name in ipairs(window.frames) do
        local frame = _G[name]
        if frame and OnScreen(window, frame) then
            if not hooked[frame] then Hook(frame, window) end
            if Handled() and not window.scaleOnly then EnableMouse(frame) end
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
        if frame and not hooked[frame] and OnScreen(window, frame) then
            return true
        end
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_REGEN_ENABLED")

-- The mouse is only watched while Move & Scale is on.
local function SyncEvents()
    for _, event in ipairs({ "GLOBAL_MOUSE_DOWN", "GLOBAL_MOUSE_UP", "MODIFIER_STATE_CHANGED" }) do
        if Handled() then events:RegisterEvent(event) else events:UnregisterEvent(event) end
    end
end
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

ns.OnReset(function()
    wipe(moved)
    SereneDB.windowScales = nil
end, SECTION)

ns.RegisterFeature({
    key = "moveAndScale", label = "Enable Move & Scale", section = SECTION, category = "Settings",
    default = false,
    apply = function()
        -- The first apply runs at login, once SereneDB is loaded.
        SereneDB.windowPositions = SereneDB.windowPositions or moved
        moved = SereneDB.windowPositions
        ApplyAll(); SyncEvents(); WheelOn()
    end,
    tooltip = "Drag a window to move it, Ctrl + mouse wheel resizes it and middle-click resets it",
})
ns.RegisterFeature({
    key = "windowResetPositions", button = "Reset positions", section = SECTION, category = "Settings",
    type = "button", beside = true,
    click = function()
        wipe(moved)
        ApplyAll()
    end,
})

-- In alphabetical order: there are too many to scan for one in any other.
local sorted = {}
for i, window in ipairs(WINDOWS) do sorted[i] = window end
table.sort(sorted, function(a, b) return a.label < b.label end)

local function SizeOptions()
    local options = {}
    for _, window in ipairs(sorted) do
        local pct = Saved(window)
        options[#options + 1] = { value = window.key,
                                  label = pct == 100 and window.label or (window.label .. " (" .. pct .. "%)") }
    end
    return options
end

-- One slider for every window: it shows the size of the window picked in
-- the list, so picking one sets the slider without changing a size.
ns.RegisterFeature({
    key = "windowSizeWindow", label = "Window", section = SECTION, category = "Scale Windows", space = true,
    type = "dropdown", default = WINDOWS[1].key, options = SizeOptions,
    tooltip = "A set size for each window",
    apply = function() SereneDB.windowSize = Saved(Picked()) end,
})
ns.RegisterFeature({
    key = "windowSize", label = "Size", section = SECTION, category = "Scale Windows", beside = true,
    type = "slider", min = MIN, max = MAX, step = STEP, default = 100, suffix = "%",
    apply = function() SetSaved(Picked(), ns.Get("windowSize")) end,
})

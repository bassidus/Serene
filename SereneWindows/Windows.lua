-------------------------------------------------------------------------------
--  Windows -- Blizzard's windows moved with the mouse and made smaller or
--  bigger: a scale in percent for each, from its slider or Ctrl + scroll
--  over it. A window grows and shrinks from its top left corner.
--
--  A frame's anchor offsets count in its own scale, so a smaller window
--  would slide toward the edge it is anchored to. Each anchor is kept as
--  set (by the window's XML or by Blizzard as it opens) and set again with
--  the offsets divided by the scale, which leaves the corner in place. A
--  window moved by hand goes to its own spot instead, every time Blizzard
--  places it.
--
--  Moved spots and Ctrl + scroll sizes last for the session. With
--  "Remember" on, the spots are kept in SereneDB.windowPositions (by frame
--  name, the top left corner in UIParent units) and Ctrl + scroll sets the
--  window's slider; with it off, windows start each session at Blizzard's
--  spot and their slider size.
--
--  Each entry lists the frame names the window may have on this client
--  (every one that exists is used) and the load-on-demand addons that
--  create them; those are set up as they load.
--  At 100 % a window Serene never scaled is left to Blizzard, which shrinks
--  some windows to fit small screens. Changes to a protected window wait
--  for the end of combat.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Windows"

local WINDOWS = {
    { key = "Character", label = "Character", category = "Your character",
      frames = { "CharacterFrame" },
      tooltip = "The character window, with reputation, skills and honor." },
    { key = "Spellbook", label = "Spellbook", category = "Your character",
      frames = { "SpellBookFrame", "PlayerSpellsFrame" }, addons = { "Blizzard_PlayerSpells" } },
    { key = "Talents", label = "Talents", category = "Your character",
      frames = { "TalentFrame", "PlayerTalentFrame", "ClassTalentFrame" },
      addons = { "Blizzard_TalentUI", "Blizzard_ClassTalentUI" } },
    { key = "Professions", label = "Professions", category = "Your character",
      frames = { "TradeSkillFrame", "CraftFrame", "ProfessionsFrame" },
      addons = { "Blizzard_TradeSkillUI", "Blizzard_CraftUI", "Blizzard_Professions" },
      tooltip = "Profession windows such as Blacksmithing, Cooking and Enchanting." },
    { key = "QuestLog", label = "Quest log", category = "Your character",
      frames = { "QuestLogFrame" } },
    { key = "Social", label = "Social", category = "Your character",
      frames = { "FriendsFrame" },
      tooltip = "Friends, who, guild and raid." },
    { key = "Macros", label = "Macros", category = "Your character",
      frames = { "MacroFrame" }, addons = { "Blizzard_MacroUI" } },

    { key = "Gossip", label = "Quest givers & gossip", category = "NPCs",
      frames = { "QuestFrame", "GossipFrame" },
      tooltip = "What an NPC says when you talk to them, and the quests they give." },
    { key = "Merchant", label = "Vendors", category = "NPCs",
      frames = { "MerchantFrame" } },
    { key = "Trainer", label = "Trainers", category = "NPCs",
      frames = { "ClassTrainerFrame" }, addons = { "Blizzard_TrainerUI" } },
    { key = "Bank", label = "Bank", category = "NPCs",
      frames = { "BankFrame" } },
    { key = "Mail", label = "Mailbox", category = "NPCs",
      frames = { "MailFrame", "OpenMailFrame" } },
    { key = "Auction", label = "Auction house", category = "NPCs",
      frames = { "AuctionFrame", "AuctionHouseFrame" },
      addons = { "Blizzard_AuctionUI", "Blizzard_AuctionHouseUI" } },
    { key = "Taxi", label = "Flight master", category = "NPCs",
      frames = { "TaxiFrame" } },

    { key = "WorldMap", label = "World map", category = "Other",
      frames = { "WorldMapFrame" } },
    { key = "DressUp", label = "Dressing room", category = "Other",
      frames = { "DressUpFrame" } },
    { key = "Inspect", label = "Inspect", category = "Other",
      frames = { "InspectFrame" }, addons = { "Blizzard_InspectUI" } },
    { key = "Trade", label = "Trade", category = "Other",
      frames = { "TradeFrame" } },
}

local function Key(window) return "windowScale" .. window.key end

local STEP, MIN, MAX = 5, 50, 150

local scaled = {}   -- frame -> true while Serene's scale is on it
local placed = {}   -- frame -> true while it sits at its moved spot
local hooked = {}   -- frame -> its window, once its hooks are in
local anchors = {}  -- frame -> { [point] = { relativeTo, relativePoint, x, y } } at scale 1
local mouse = {}    -- frame -> true once it can be dragged
local ownWheel = {} -- frame -> true when Blizzard already takes its mouse wheel
local moved = {}    -- frame name -> { left, top }; SereneDB.windowPositions while remembered
local sessionScale = {}  -- window -> percent set by Ctrl + scroll, while not remembered
local dragging = {}
local pending       -- windows waiting for combat to end
local busy          -- while Serene sets points, which the SetPoint hook skips

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

-- The points as they are now, counted at scale 1, and kept as Blizzard
-- sets new ones.
local function KeepAnchors(frame)
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

local function Scale(window, frame)
    if Locked(frame) then
        pending = pending or {}
        pending[window] = true
        return
    end
    local pct = Percent(window)
    if pct ~= 100 or scaled[frame] then
        frame:SetScale(pct / 100)
        scaled[frame] = pct ~= 100 or nil
    end
    Anchor(frame)
end

local ApplyWindow

local function StopDrag(frame)
    if not dragging[frame] then return end
    dragging[frame] = nil
    frame:StopMovingOrSizing()
    -- Serene keeps the spot; the game's own layout cache would bring it
    -- back even with Remember off.
    if frame.SetUserPlaced then frame:SetUserPlaced(false) end
    local left, top = frame:GetLeft(), frame:GetTop()
    if not left then return end
    local r = Ratio(frame)
    moved[frame:GetName()] = { left * r, top * r }
    Anchor(frame)
end

local function Wheel(frame, delta)
    if not (ns.Enabled("windowMove") and IsControlKeyDown()) then return end
    local window = hooked[frame]
    local pct = math.min(MAX, math.max(MIN, Percent(window) + delta * STEP))
    if pct == Percent(window) then return end
    if ns.Enabled("windowRemember") then
        ns.SetValue(Key(window), pct)
    else
        sessionScale[window] = pct
        ApplyWindow(window)
    end
end

-- Dragged by any spot that is not a button; the mouse wheel is only taken
-- while Ctrl is down, so scrolling over a window still zooms the camera.
local function EnableMouse(frame)
    if mouse[frame] or Locked(frame) then return end
    mouse[frame] = true
    ownWheel[frame] = frame:IsMouseWheelEnabled()
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:RegisterForDrag("LeftButton")
    frame:HookScript("OnDragStart", function(self)
        if not ns.Enabled("windowMove") or Locked(self) then return end
        dragging[self] = true
        self:StartMoving()
    end)
    frame:HookScript("OnDragStop", StopDrag)
    frame:HookScript("OnHide", StopDrag)
    frame:HookScript("OnMouseWheel", Wheel)
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
        if type(frame) == "table" and frame.SetScale then
            if not hooked[frame] then
                hooked[frame] = window
                KeepAnchors(frame)
                -- Blizzard sets some windows' scale again as they open.
                frame:HookScript("OnShow", function(self) Scale(window, self) end)
            end
            if ns.Enabled("windowMove") then EnableMouse(frame) end
            Scale(window, frame)
        end
    end
end

local function ApplyAll()
    for _, window in ipairs(WINDOWS) do ApplyWindow(window) end
end

-- Blizzard's fit-to-screen runs after the window is shown; ours goes on top.
if UpdateScaleForFit then
    hooksecurefunc("UpdateScaleForFit", function(frame)
        local window = hooked[frame]
        if window then Scale(window, frame) end
    end)
end

local byAddon = {}
for _, window in ipairs(WINDOWS) do
    for _, addon in ipairs(window.addons or {}) do byAddon[addon] = window end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:RegisterEvent("MODIFIER_STATE_CHANGED")
events:SetScript("OnEvent", function(_, event, arg)
    if event == "ADDON_LOADED" then
        if SereneDB and byAddon[arg] then ApplyWindow(byAddon[arg]) end
        return
    end
    if event == "MODIFIER_STATE_CHANGED" then
        if arg == "LCTRL" or arg == "RCTRL" then WheelOn() end
        return
    end
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

ns.RegisterFeature({
    key = "windowMove", label = "Move windows with the mouse", section = SECTION, category = "Mouse",
    default = false, apply = ApplyAll,
    tooltip = "Drag a window by an empty spot or its title to move it. Hold Ctrl and scroll over a "
        .. "window to make it smaller or bigger.",
})
ns.RegisterFeature({
    key = "windowRemember", label = "Remember positions and sizes", section = SECTION, category = "Mouse",
    requires = "windowMove", apply = ApplyRemember,
    tooltip = "Windows you have moved, and sizes set with Ctrl + scroll, stay after a reload or logout. "
        .. "Off: each session starts with Blizzard's spots and the sizes below.",
})

for _, window in ipairs(WINDOWS) do
    ns.RegisterFeature({
        key = Key(window), label = window.label, section = SECTION, category = window.category,
        type = "slider", min = MIN, max = MAX, step = STEP, default = 100, suffix = "%",
        -- A slider change wins over a Ctrl + scroll size from this session.
        apply = function() sessionScale[window] = nil; ApplyWindow(window) end,
        tooltip = (window.tooltip and window.tooltip .. " " or "")
            .. "100% is Blizzard's size. Lower makes the window smaller, higher makes it bigger.",
    })
end

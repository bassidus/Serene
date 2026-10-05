-------------------------------------------------------------------------------
--  Window sizes -- a scale in percent for each of Blizzard's windows. A
--  window grows and shrinks from its anchor, usually its top left corner.
--
--  A frame's anchor offsets count in its own scale, so a smaller window
--  would slide toward the edge it is anchored to. Each anchor is kept as
--  set (by the window's XML or by Blizzard as it opens) and set again with
--  the offsets divided by the scale, which leaves the corner in place.
--
--  Each entry lists the frame names the window may have on this client
--  (every one that exists is scaled) and the load-on-demand addons that
--  create them; those are scaled as they load.
--  At 100 % a window Serene never scaled is left to Blizzard, which shrinks
--  some windows to fit small screens. Scaling waits for the end of combat on
--  a protected window.
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

local scaled = {}   -- frame -> true while Serene's scale is on it
local hooked = {}   -- frame -> its window, once its OnShow is hooked
local anchors = {}  -- frame -> { [point] = { relativeTo, relativePoint, x, y } } at scale 1
local pending       -- windows waiting for combat to end
local busy          -- while Reanchor sets points, which the SetPoint hook skips

local function Locked(frame) return InCombatLockdown() and frame:IsProtected() end

local function Reanchor(frame)
    if Locked(frame) then return end
    local s = frame:GetScale()
    busy = true
    for point, a in pairs(anchors[frame]) do
        frame:SetPoint(point, a[1], a[2], a[3] / s, a[4] / s)
    end
    busy = false
end

-- The points as they are now, counted at scale 1.
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
        if scaled[self] then Reanchor(self) end
    end)
end

local function Scale(window, frame)
    local pct = ns.Get(Key(window))
    if pct == 100 and not scaled[frame] then return end
    if Locked(frame) then
        pending = pending or {}
        pending[window] = true
        return
    end
    frame:SetScale(pct / 100)
    scaled[frame] = pct ~= 100 or nil
    Reanchor(frame)
end

local function ApplyWindow(window)
    for _, name in ipairs(window.frames) do
        local frame = _G[name]
        if type(frame) == "table" and frame.SetScale then
            if not hooked[frame] then
                hooked[frame] = window
                KeepAnchors(frame)
                -- Blizzard sets some windows' scale again as they open.
                frame:HookScript("OnShow", function(self) Scale(window, self) end)
            end
            Scale(window, frame)
        end
    end
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
events:SetScript("OnEvent", function(_, event, addon)
    if event == "ADDON_LOADED" then
        if SereneDB and byAddon[addon] then ApplyWindow(byAddon[addon]) end
        return
    end
    if not pending then return end
    local waiting = pending
    pending = nil
    for window in pairs(waiting) do ApplyWindow(window) end
end)

for _, window in ipairs(WINDOWS) do
    ns.RegisterFeature({
        key = Key(window), label = window.label, section = SECTION, category = window.category,
        type = "slider", min = 50, max = 150, step = 5, default = 100, suffix = "%",
        apply = function() ApplyWindow(window) end,
        tooltip = (window.tooltip and window.tooltip .. " " or "")
            .. "100% is Blizzard's size. Lower makes the window smaller, higher makes it bigger.",
    })
end

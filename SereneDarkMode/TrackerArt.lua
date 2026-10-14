-------------------------------------------------------------------------------
--  Tracker Art -- the quest tracker's header bars and buttons and the quest
--  timer's frame, and darker quest icons.
-------------------------------------------------------------------------------
local _, ns = ...

-- Forever's tracker sheet also holds the check marks and glows, which keep
-- their color.
local TRACKER = 8268353

local function IsArt(tex)
    local atlas = tex:GetAtlas() or ""
    if tex:GetTexture() == TRACKER then
        return (atlas:find("Objective-Header", 1, true) or atlas:find("QuestTrackerButton-", 1, true))
            and not atlas:find("Highlight", 1, true)
    end
    return atlas:find("DiamondMetal", 1, true)
end

ns.AddDarkArt("ObjectiveTrackerFrame", IsArt)

-------------------------------------------------------------------------------
--  The modules: only put under ObjectiveTrackerFrame after login, later than
--  Dark mode's first search, and their quest rows and icons are made as
--  quests show up, so each module is searched again after every layout.
--  The quest icons are darkened and keep their colors.
-------------------------------------------------------------------------------
local ICON = 0.6
local icons = {}  -- [icon texture] = true

local MODULES = {}
for _, name in ipairs({
    "QuestObjectiveTracker", "CampaignQuestObjectiveTracker", "AchievementObjectiveTracker",
    "BonusObjectiveTracker", "WorldQuestObjectiveTracker", "ScenarioObjectiveTracker",
    "ProfessionsRecipeTracker", "MonthlyActivitiesObjectiveTracker", "AdventureObjectiveTracker",
    "InitiativeTasksObjectiveTracker", "UIWidgetObjectiveTracker",
}) do
    MODULES[#MODULES + 1] = _G[name]
end

-- A quest icon is a POI button with its art on itself or on its Display.
-- Its glows keep their strength.
local function IsIcon(tex)
    local frame = tex:GetParent()
    return (frame.IsPOIButton or frame:GetParent().IsPOIButton)
        and not (tex:GetAtlas() or ""):find("Glow", 1, true)
end

local function PaintIcon(tex)
    local v = ns.Get("darkMode") and ICON or 1
    tex:SetVertexColor(v, v, v)
end

local function CollectIcons(frame)
    for _, r in ipairs({ frame:GetRegions() }) do
        if r:GetObjectType() == "Texture" and not icons[r] and IsIcon(r) then
            icons[r] = true
            PaintIcon(r)
        end
    end
    for _, child in ipairs({ frame:GetChildren() }) do CollectIcons(child) end
end

local function Update(module)
    if not ns.Get("darkMode") then return end
    ns.AddDarkArtNow(module, IsArt)
    CollectIcons(module.ContentsFrame)
end

for _, module in ipairs(MODULES) do hooksecurefunc(module, "EndLayout", Update) end

ns.OnDarkMode(function()
    for _, module in ipairs(MODULES) do Update(module) end
    for tex in pairs(icons) do PaintIcon(tex) end
end)

-------------------------------------------------------------------------------
--  Tracker Art -- the quest tracker's header bars and buttons and the quest
--  timer's frame.
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

-- The modules are only put under ObjectiveTrackerFrame after login, later
-- than Dark mode's first search.
for _, module in ipairs({
    "QuestObjectiveTracker", "CampaignQuestObjectiveTracker", "AchievementObjectiveTracker",
    "BonusObjectiveTracker", "WorldQuestObjectiveTracker", "ScenarioObjectiveTracker",
    "ProfessionsRecipeTracker", "MonthlyActivitiesObjectiveTracker", "AdventureObjectiveTracker",
    "InitiativeTasksObjectiveTracker", "UIWidgetObjectiveTracker",
}) do
    ns.AddDarkArt(module, IsArt)
end

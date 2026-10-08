-------------------------------------------------------------------------------
--  Auto Accept / Auto Turn-In Quests. Besides gossip, handles QUEST_PROGRESS
--  (item hand-in step) and QUEST_GREETING (the old-style quest list many
--  vanilla NPCs use instead of a gossip menu).
--
--  An NPC with several quests: after each accept or turn-in the NPC's list
--  is looked at again (a moment later, also when no new event comes), and
--  quests just taken are skipped, since the list can still show them.
-------------------------------------------------------------------------------
local _, ns = ...

local RECENT = 5  -- seconds a just-taken quest is skipped in a stale list

local takenTitle, takenID = {}, {}  -- [title] / [questID] = GetTime() when taken

local function Recent(t) return t and GetTime() - t < RECENT end

local function OnQuest(questID)
    return Recent(takenID[questID]) or C_QuestLog.IsOnQuest(questID)
end

local function Settings()
    if IsShiftKeyDown() then return false, false end
    return ns.Get("autoAcceptQuests"), ns.Get("autoTurnInQuests")
end

local function Gossip()
    local accept, turnIn = Settings()
    if turnIn then
        for _, quest in ipairs(C_GossipInfo.GetActiveQuests()) do
            if quest.questID and quest.isComplete and not Recent(takenID[quest.questID]) then
                return C_GossipInfo.SelectActiveQuest(quest.questID)
            end
        end
    end
    if accept then
        for _, quest in ipairs(C_GossipInfo.GetAvailableQuests()) do
            if quest.questID and not quest.isTrivial and not quest.repeatable and not OnQuest(quest.questID) then
                return C_GossipInfo.SelectAvailableQuest(quest.questID)
            end
        end
    end
end

local function Greeting()
    local accept, turnIn = Settings()
    if turnIn then
        for i = 1, GetNumActiveQuests() do
            local title, isComplete = GetActiveTitle(i)
            if isComplete and not Recent(takenTitle[title]) then return SelectActiveQuest(i) end
        end
    end
    if accept then
        for i = 1, GetNumAvailableQuests() do
            local isTrivial, _, isRepeatable = GetAvailableQuestInfo(i)
            if not isTrivial and not isRepeatable and not Recent(takenTitle[GetAvailableTitle(i)]) then
                return SelectAvailableQuest(i)
            end
        end
    end
end

-- Remembers the quest in the open window, so a stale list does not pick it
-- again; forgets the ones taken long enough ago.
local function Taken()
    local now = GetTime()
    for _, taken in ipairs({ takenTitle, takenID }) do
        for k, t in pairs(taken) do
            if not Recent(t) then taken[k] = nil end
        end
    end
    local title = GetTitleText()
    if title and title ~= "" then takenTitle[title] = now end
    local id = GetQuestID()
    if id and id ~= 0 then takenID[id] = now end
end

-- The NPC's list, if it is still (or again) on screen.
local function Next()
    if GossipFrame:IsShown() then
        Gossip()
    elseif QuestFrameGreetingPanel:IsShown() then
        Greeting()
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("GOSSIP_SHOW")
f:RegisterEvent("QUEST_GREETING")
f:RegisterEvent("QUEST_DETAIL")
f:RegisterEvent("QUEST_PROGRESS")
f:RegisterEvent("QUEST_COMPLETE")
f:RegisterEvent("QUEST_FINISHED")
f:SetScript("OnEvent", function(_, event)
    local accept, turnIn = Settings()
    if not (accept or turnIn) then return end

    if event == "GOSSIP_SHOW" then
        Gossip()

    elseif event == "QUEST_GREETING" then
        Greeting()

    elseif event == "QUEST_DETAIL" then
        if accept then
            Taken()
            AcceptQuest()
        end

    elseif event == "QUEST_PROGRESS" then
        if turnIn and IsQuestCompletable() then CompleteQuest() end

    elseif event == "QUEST_COMPLETE" then
        if not turnIn then return end
        local numChoices = GetNumQuestChoices()
        if numChoices <= 1 then
            Taken()
            GetQuestReward(numChoices)
        end

    elseif event == "QUEST_FINISHED" then
        -- The quest window closed (accepted, handed in or walked away): carry
        -- on with the NPC's next quest if its list is showing.
        C_Timer.After(0.3, Next)
    end
end)

ns.RegisterFeature({
    key = "autoAcceptQuests", label = "Accept quests automatically", section = "Quests", category = "Automation",
})
ns.RegisterFeature({
    key = "autoTurnInQuests", label = "Turn in quests automatically", section = "Quests", category = "Automation",
})

-- Drawn by SereneNameplates (NameplateQuest.lua), which adds the apply.
ns.RegisterFeature({
    key = "nameplateQuest", label = "Mark quest enemies", section = "Quests", category = "Nameplates",
    tooltip = "A quest icon with progress (3/8) on enemies you need.",
    beside = true,
    addon = "SereneNameplates",
})
ns.RegisterFeature({
    key = "nameplateQuestColor", label = "Color their health bars", section = "Quests", category = "Nameplates",
    tooltip = "Quest enemies get their own bar color.",
    requires = "nameplateQuest",
    addon = "SereneNameplates",
})
ns.RegisterFeature({
    key = "nameplateQuestBarColor", label = "Hostile quest enemy color", section = "Quests", category = "Nameplates",
    type = "color",
    button = "Hostile color", default = "default", requires = { "nameplateQuest", "nameplateQuestColor" },
    addon = "SereneNameplates",
    specials = {
        { value = "default", label = "Default", swatch = function() return ns.QUEST_HOSTILE end },
    },
})
ns.RegisterFeature({
    key = "nameplateQuestNeutralColor", label = "Neutral quest enemy color", section = "Quests", category = "Nameplates",
    type = "color", beside = true,
    button = "Neutral color", default = "default", requires = { "nameplateQuest", "nameplateQuestColor" },
    addon = "SereneNameplates",
    specials = {
        { value = "default", label = "Default", swatch = function() return ns.QUEST_NEUTRAL end },
    },
})

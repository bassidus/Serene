-------------------------------------------------------------------------------
--  Nameplate Quest Enemies -- a quest icon with the objective's progress (e.g.
--  3/8) on enemies your quests still need, and optionally a colored bar.
--
--  The unit's tooltip data carries quest title and objective lines with a
--  completed flag, so no text parsing is needed. Only quests in your own log
--  count (a group member's objectives show on your tooltips too). Cached per
--  unit until the quest log changes.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

local QUEST_COLOR = { ns.ColorRGB(ns.QUEST_GREEN) }
local cache = {}  -- unit -> false, or the progress text ("" when it has none)

local Clean = ns.Clean

-- Progress text of the first unfinished objective of yours on this unit, or false.
local function QuestProgress(unit)
    local cached = cache[unit]
    if cached ~= nil then return cached end
    local result = false
    local LT = Enum.TooltipDataLineType
    -- Players are never quest kills; skip their tooltip data.
    local info = not UnitIsPlayer(unit) and C_TooltipInfo.GetUnit(unit)
    if info then
        local questID
        for _, line in ipairs(info.lines) do
            if line.type == LT.QuestTitle then
                questID = Clean(line.id)
            elseif line.type == LT.QuestObjective then
                local done = Clean(line.completed)
                -- An unreadable quest id counts, so a real quest mob is never missed.
                if done == false and (not questID or C_QuestLog.IsOnQuest(questID)) then
                    local have, need = Clean(line.numFulfilled), Clean(line.numRequired)
                    local text = Clean(line.leftText)
                    -- Area objectives keep their real progress (a percent) in the text only.
                    local pct = text and text:match("(%d+)%s*%%")
                    if pct then
                        result = pct .. "%"
                    elseif have and need and need > 1 then
                        result = have .. "/" .. need
                    else
                        result = ""
                    end
                    break
                end
            end
        end
    end
    cache[unit] = result
    return result
end

-- The chosen bar colors, rebuilt only when a setting changes. Neutral quest
-- mobs get their own, so yellow and red ones stay apart.
local barColors = {
    hostile = { key = "nameplateQuestBarColor", default = { ns.ColorRGB(ns.QUEST_HOSTILE) } },
    neutral = { key = "nameplateQuestNeutralColor", default = { ns.ColorRGB(ns.QUEST_NEUTRAL) } },
}
local function BarColor(bar)
    local value = ns.Get(bar.key)
    if value ~= bar.value then
        bar.value = value
        local r, g, b = ns.ColorRGB(value)
        bar.color = r and { r, g, b } or bar.default
    end
    return bar.color
end

function NP.QuestColor(unit, neutral)
    if ns.Get("nameplateQuest") and ns.Get("nameplateQuestColor") and QuestProgress(unit) then
        return BarColor(neutral and barColors.neutral or barColors.hostile)
    end
end

-------------------------------------------------------------------------------
--  Plate pieces
-------------------------------------------------------------------------------
local function Create(plate)
    -- Icon just left of the health bar (NP.StackLeft); the progress on the
    -- name's row, as far right as the bar goes (the name ends where it starts).
    local q = CreateFrame("Frame", nil, plate.overlay)
    q:Hide()
    q.icon = q:CreateTexture(nil, "OVERLAY")
    q.icon:SetAllPoints()
    q.icon:SetAtlas("Crosshair_Quest_64")
    q.text = q:CreateFontString(nil, "OVERLAY")
    q.text:SetPoint("BOTTOMRIGHT", plate.health, "TOPRIGHT", 0, 3)
    q.text:SetJustifyH("RIGHT")
    q.text:SetTextColor(QUEST_COLOR[1], QUEST_COLOR[2], QUEST_COLOR[3])
    plate.quest = q
end

local function Layout(plate)
    local q = plate.quest
    local size = ns.Get("nameplateFontSize") + 6
    q:SetSize(size, size)
    NP.SetFont(q.text, -1)
end

local function Update(plate)
    local q = plate.quest
    local progress = ns.Get("nameplateQuest") and QuestProgress(plate.unit)
    if progress then
        q.text:SetText(progress)
        q:Show()
        plate.name:SetPoint("BOTTOMRIGHT", q.text, "BOTTOMLEFT", -3, 0)
    else
        q:Hide()
        plate.name:SetPoint("BOTTOMRIGHT", plate.health, "TOPRIGHT", 0, 3)
    end
    NP.StackLeft(plate)
end

NP.RegisterModule({
    create = Create,
    layout = Layout,
    attach = Update,
    detach = function(plate)
        cache[plate.unit] = nil
        plate.quest:Hide()
        plate.name:SetPoint("BOTTOMRIGHT", plate.health, "TOPRIGHT", 0, 3)
    end,
})

-- Kill credit and accepted/turned-in quests come as bursts of
-- QUEST_LOG_UPDATE; drop the cache at once, repaint after the burst.
-- Listens only while the marker is on and Serene draws plates.
local pending = false
local function Repaint()
    pending = false
    for _, plate in pairs(NP.plates) do
        Update(plate)
        NP.UpdateHealthColor(plate)
    end
end
local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function()
    wipe(cache)
    if pending or not next(NP.plates) then return end
    pending = true
    C_Timer.After(0.3, Repaint)
end)

local function SyncEvents()
    if ns.Get("nameplateQuest") then
        watcher:RegisterEvent("QUEST_LOG_UPDATE")
        -- Your own log only; group members' changes do not affect your marks.
        watcher:RegisterUnitEvent("UNIT_QUEST_LOG_CHANGED", "player")
    else
        watcher:UnregisterAllEvents()
        wipe(cache)
    end
end
NP.OnRefresh(SyncEvents)

-- Only markers and colors change: repaint in place, no plate is rebuilt.
local function Refresh()
    wipe(cache)
    SyncEvents()
    if NP.layoutGen then Repaint() end
end

-- The settings are on the Quests tab, so SereneQuests registers them (the
-- TOC loads it first) and shows them dimmed without this addon. Without
-- SereneQuests they keep their saved values.
for _, key in ipairs({ "nameplateQuest", "nameplateQuestColor", "nameplateQuestBarColor", "nameplateQuestNeutralColor" }) do
    local f = ns.featureByKey[key]
    if f then f.apply = Refresh end
end

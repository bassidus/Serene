-------------------------------------------------------------------------------
--  Nameplate Quest Mobs -- a quest icon with the objective's progress (e.g.
--  3/8) on enemies your quests still need, and optionally a colored bar.
--
--  The unit's tooltip data carries quest title and objective lines with a
--  completed flag, so no text parsing is needed. Only quests in your own log
--  count (a group member's objectives show on your tooltips too). Cached per
--  unit until the quest log changes.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

local QUEST_COLOR = { 0.157, 0.855, 0.475 }
local cache = {}  -- unit -> false, or the progress text ("" when it has none)

local Clean = ns.Clean

-- Progress text of the first unfinished objective of yours on this unit, or false.
local function QuestProgress(unit)
    local cached = cache[unit]
    if cached ~= nil then return cached end
    local result = false
    local LT = Enum and Enum.TooltipDataLineType
    -- Players are never quest kills; skip their tooltip data.
    local info = LT and C_TooltipInfo and not Clean(UnitIsPlayer(unit)) and C_TooltipInfo.GetUnit(unit)
    if info and info.lines then
        local onQuest = C_QuestLog and C_QuestLog.IsOnQuest
        local questID
        for _, line in ipairs(info.lines) do
            if line.type == LT.QuestTitle then
                questID = Clean(line.id)
            elseif line.type == LT.QuestObjective then
                local done = Clean(line.completed)
                -- An unreadable quest id counts, so a real quest mob is never missed.
                if done == false and (not questID or not onQuest or onQuest(questID)) then
                    local have, need = Clean(line.numFulfilled), Clean(line.numRequired)
                    local text = Clean(line.leftText)
                    -- Area objectives keep their real progress (a percent) in the text only.
                    local pct = type(text) == "string" and text:match("(%d+)%s*%%")
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

-- The chosen bar color, rebuilt only when the setting changes.
local barValue, barColor
local function BarColor()
    local value = ns.Get("nameplateQuestBarColor")
    if value ~= barValue then
        barValue = value
        local r, g, b = ns.ColorRGB(value)
        barColor = r and { r, g, b } or QUEST_COLOR
    end
    return barColor
end

function NP.QuestColor(unit)
    if ns.Enabled("nameplateQuest") and ns.Enabled("nameplateQuestColor") and QuestProgress(unit) then
        return BarColor()
    end
end

-------------------------------------------------------------------------------
--  Plate pieces
-------------------------------------------------------------------------------
local function Create(plate)
    local q = CreateFrame("Frame", nil, plate.overlay)
    q:SetPoint("BOTTOMRIGHT", plate.health, "TOPRIGHT", 0, 1)
    q:Hide()
    q.icon = q:CreateTexture(nil, "OVERLAY")
    q.icon:SetPoint("RIGHT")
    if C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo("Crosshair_Quest_64") then
        q.icon:SetAtlas("Crosshair_Quest_64")
    else
        q.icon:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon")
    end
    q.text = q:CreateFontString(nil, "OVERLAY")
    q.text:SetPoint("RIGHT", q.icon, "LEFT", -1, 0)
    q.text:SetTextColor(QUEST_COLOR[1], QUEST_COLOR[2], QUEST_COLOR[3])
    plate.quest = q
end

local function Layout(plate)
    local q = plate.quest
    local size = ns.Get("nameplateFontSize") + 6
    q.icon:SetSize(size, size)
    q:SetHeight(size)
    NP.SetFont(q.text, -1)
end

-- The name ends where the quest marker starts.
local function SetNameEnd(plate, shown)
    plate.name:ClearAllPoints()
    plate.name:SetPoint("BOTTOMLEFT", plate.health, "TOPLEFT", 0, 3)
    if shown then
        plate.name:SetPoint("BOTTOMRIGHT", plate.quest.text, "BOTTOMLEFT", -2, 0)
    else
        plate.name:SetPoint("BOTTOMRIGHT", plate.health, "TOPRIGHT", 0, 3)
    end
end

local function Update(plate)
    local q = plate.quest
    local progress = plate.unit and ns.Enabled("nameplateQuest") and QuestProgress(plate.unit)
    if progress then
        q.text:SetText(progress)
        q:SetWidth(q.icon:GetWidth() + q.text:GetStringWidth() + 1)
        q:Show()
    else
        q:Hide()
    end
    SetNameEnd(plate, progress and true or false)
end

NP.RegisterModule({
    create = Create,
    layout = Layout,
    attach = Update,
    detach = function(plate)
        if plate.unit then cache[plate.unit] = nil end
        plate.quest:Hide()
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
    if ns.Enabled("nameplateQuest") and NP.Active() then
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
    if NP.layoutGen then NP.Repaint() end
end

ns.RegisterFeature({
    key = "nameplateQuest", label = "Quest Mobs", section = "Nameplates", apply = Refresh,
    tooltip = "Marks enemies your quests still need with a quest icon and your progress (e.g. 3/8).",
})
ns.RegisterFeature({
    key = "nameplateQuestColor", label = "Color Quest Mobs", section = "Nameplates", requires = "nameplateQuest",
    apply = Refresh,
    tooltip = "Also colors quest mobs' health bars (green unless you pick another color below). "
        .. "Threat colors yield to it.",
})
ns.RegisterFeature({
    key = "nameplateQuestBarColor", label = "Quest Mob Color", section = "Nameplates", type = "color",
    default = "default", requires = { "nameplateQuest", "nameplateQuestColor" }, apply = Refresh,
    tooltip = "Health bar color of quest mobs. Default is the quest green.",
    specials = {
        { value = "default", label = "Default", tooltip = "The quest green." },
    },
})

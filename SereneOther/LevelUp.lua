-------------------------------------------------------------------------------
--  Level Up -- on a new level, says in chat how long the last level took and
--  the total time played, then takes a screenshot with that line in it and
--  says so once it is saved.
--
--  The time a level began is kept per character. Any /played answer gives
--  it; at the ding it is the new total, so it doesn't matter whether the
--  server has already reset "time this level" when it answers.
-------------------------------------------------------------------------------
local _, ns = ...

local SHOT_DELAY = 1  -- seconds, so the chat line and the level-up banner are in the shot

local me
local dinged  -- waiting for the /played answer to a ding

-- Blizzard prints every /played answer in the chat windows that show system
-- messages. Ours stay quiet: those windows skip the event until it is in.
local muted = {}

-- A frame later, so the answer being handled now doesn't reach them.
local function Unmute()
    for _, frame in ipairs(muted) do frame:RegisterEvent("TIME_PLAYED_MSG") end
    wipe(muted)
end

local function RequestQuietly()
    ChatFrameUtil.ForEachChatFrame(function(frame)
        if frame:IsEventRegistered("TIME_PLAYED_MSG") then
            frame:UnregisterEvent("TIME_PLAYED_MSG")
            muted[#muted + 1] = frame
        end
    end)
    RequestTimePlayed()
    -- The windows hear /played again even if no answer ever comes.
    C_Timer.After(10, Unmute)
end

local watcher = CreateFrame("Frame")

-- Listens only around our own shot, so the confirmation lands after the
-- capture and a manual screenshot stays silent.
local function TakeShot()
    watcher:RegisterEvent("SCREENSHOT_SUCCEEDED")
    watcher:RegisterEvent("SCREENSHOT_FAILED")
    Screenshot()
end

watcher:SetScript("OnEvent", function(_, event, a, b)
    if event == "PLAYER_LEVEL_UP" then
        dinged = true
        RequestQuietly()
        return
    end
    if event == "SCREENSHOT_SUCCEEDED" or event == "SCREENSHOT_FAILED" then
        watcher:UnregisterEvent("SCREENSHOT_SUCCEEDED")
        watcher:UnregisterEvent("SCREENSHOT_FAILED")
        if event == "SCREENSHOT_SUCCEEDED" then ns.Print("Screenshot taken") end
        return
    end
    -- TIME_PLAYED_MSG: total, time this level
    if #muted > 0 then C_Timer.After(0, Unmute) end
    local starts = SereneDB.levelStart
    if not dinged then
        starts[me] = a - b
        return
    end
    local start = starts[me]
    if start then ns.Print("Last level took " .. SecondsToTime(a - start)) end
    ns.Print("Total played time is " .. SecondsToTime(a))
    starts[me], dinged = a, false
    C_Timer.After(SHOT_DELAY, TakeShot)
end)

ns.RegisterFeature({
    key = "levelUpShot", label = "Screenshot and time played on level up", section = "Other", category = "Leveling", default = false,
    tooltip = "Says how long the level took and takes a screenshot.",
    apply = function()
        if not ns.Get("levelUpShot") then
            watcher:UnregisterAllEvents()
            Unmute()
            return
        end
        watcher:RegisterEvent("PLAYER_LEVEL_UP")
        watcher:RegisterEvent("TIME_PLAYED_MSG")
        SereneDB.levelStart = SereneDB.levelStart or {}
        me = UnitName("player")
        -- Once per character, so the first level after install has a start.
        if not SereneDB.levelStart[me] and UnitLevel("player") < GetMaxPlayerLevel() then
            RequestQuietly()
        end
    end,
})

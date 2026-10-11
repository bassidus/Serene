-------------------------------------------------------------------------------
--  Level Up -- on a new level, says in chat how long the last level took and
--  the total time played, then takes a screenshot with that line in it.
--
--  The time a level began is kept per character. Any /played answer gives
--  it; at the ding it is the new total, so it doesn't matter whether the
--  server has already reset "time this level" when it answers.
-------------------------------------------------------------------------------
local _, ns = ...

local SHOT_DELAY = 1  -- seconds, so the chat line and the level-up banner are in the shot

local me
local dingLevel  -- set while waiting for the /played answer to a ding

local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, event, a, b)
    if event == "PLAYER_LEVEL_UP" then
        dingLevel = a
        RequestTimePlayed()
        return
    end
    -- TIME_PLAYED_MSG: total, time this level
    local starts = SereneDB.levelStart
    if not dingLevel then
        starts[me] = a - b
        return
    end
    local start = starts[me]
    local took = start and SecondsToTime(a - start) .. " this level, " or ""
    ns.Print(("Level %d: %s%s total."):format(dingLevel, took, SecondsToTime(a)))
    starts[me], dingLevel = a, nil
    C_Timer.After(SHOT_DELAY, function() Screenshot() end)
end)

ns.RegisterFeature({
    key = "levelUpShot", label = "Screenshot and time played on level up", section = "General", category = "Leveling",
    tooltip = "Says how long the level took and takes a screenshot.",
    apply = function()
        if not ns.Get("levelUpShot") then
            watcher:UnregisterAllEvents()
            return
        end
        watcher:RegisterEvent("PLAYER_LEVEL_UP")
        watcher:RegisterEvent("TIME_PLAYED_MSG")
        SereneDB.levelStart = SereneDB.levelStart or {}
        me = UnitName("player")
        -- Once per character, so the first level after install has a start.
        if not SereneDB.levelStart[me] and UnitLevel("player") < GetMaxPlayerLevel() then
            RequestTimePlayed()
        end
    end,
})

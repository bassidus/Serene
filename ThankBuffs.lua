-------------------------------------------------------------------------------
--  Thank for Buffs -- emotes at a player outside your group who buffs you.
--
--  The combat log is closed to addons and aura data is secret in combat, so
--  new auras come from UNIT_AURA and the caster is the aura's sourceUnit: a
--  buff in combat, or from a player you have no unit for, goes unthanked.
--  To give nearby players a unit, friendly player nameplates are turned on
--  (outside instances) as name-only, class colored and click-through, which
--  looks like the usual name over their heads. A buff whose aura still names
--  no caster is matched to a recent cast of it seen on such a unit. Buffs put
--  back on after a loading screen are not new and are skipped.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Social"
local COOLDOWN = 90      -- seconds before the same player is thanked again
local SETTLE = 2         -- seconds after a loading screen with no thanks

local issecret = issecretvalue
local Clean = ns.Clean

-------------------------------------------------------------------------------
--  Buffs worth a thank-you, by name so every rank counts. Spells this client
--  does not know are skipped.
-------------------------------------------------------------------------------
local BUFF_IDS = {
    1126,   -- Mark of the Wild
    21849,  -- Gift of the Wild
    467,    -- Thorns
    29166,  -- Innervate
    1459,   -- Arcane Intellect
    23028,  -- Arcane Brilliance
    1243,   -- Power Word: Fortitude
    21562,  -- Prayer of Fortitude
    14752,  -- Divine Spirit
    976,    -- Shadow Protection
    6346,   -- Fear Ward
    10060,  -- Power Infusion
    19740,  -- Blessing of Might
    19742,  -- Blessing of Wisdom
    20217,  -- Blessing of Kings
    1038,   -- Blessing of Salvation
    19977,  -- Blessing of Light
    20911,  -- Blessing of Sanctuary
    25782,  -- Greater Blessing of Might
    25894,  -- Greater Blessing of Wisdom
    25898,  -- Greater Blessing of Kings
    25895,  -- Greater Blessing of Salvation
    5697,   -- Unending Breath
    546,    -- Water Walking
    20707,  -- Soulstone Resurrection
}

-- Spell names can be missing right after login, so ids without a name yet
-- are asked again next time.
local buffs, unnamed = {}, { unpack(BUFF_IDS) }
local function Buffs()
    for i = #unnamed, 1, -1 do
        local name = C_Spell.GetSpellName(unnamed[i])
        if name then
            buffs[name] = true
            table.remove(unnamed, i)
        end
    end
    return buffs
end


-------------------------------------------------------------------------------
--  Emotes
-------------------------------------------------------------------------------
local EMOTES = {
    { value = "THANK",  label = "Thank" },
    { value = "CHEER",  label = "Cheer" },
    { value = "BOW",    label = "Bow" },
    { value = "SALUTE", label = "Salute" },
    { value = "PRAISE", label = "Praise" },
    { value = "HAIL",   label = "Hail" },
    { value = "SMILE",  label = "Smile" },
    { value = "WAVE",   label = "Wave" },
    { value = "APPLAUD", label = "Applaud" },
}

local function PickEmote()
    local choice = ns.Get("thankBuffEmote")
    if choice ~= "random" then return choice end
    return EMOTES[math.random(#EMOTES)].value
end

-------------------------------------------------------------------------------
--  Thanking
-------------------------------------------------------------------------------
local thanked = {}       -- key (GUID or name) -> time it may be thanked again
local settleUntil = 0

-- Secret answers count as "in the group": better a missed thanks than a wrong one.
local function InMyGroup(who)
    local party, raid = UnitInParty(who), UnitInRaid(who)
    if (issecret and (issecret(party) or issecret(raid))) then return true end
    return party or raid
end

-- key identifies the player for the cooldown.
local function Thank(target, key)
    local now = GetTime()
    if now < settleUntil then return end
    for k, t in pairs(thanked) do
        if t <= now then thanked[k] = nil end
    end
    if thanked[key] then return end
    thanked[key] = now + COOLDOWN
    -- A short, varied pause reads less like a macro than an instant reply.
    C_Timer.After(1.5 + math.random() * 1.5, function()
        if ns.Enabled("thankBuffs") then DoEmote(PickEmote(), target) end
    end)
end

-- Who last finished casting each listed buff, from UNIT_SPELLCAST_SUCCEEDED:
-- a buff whose aura names no caster is matched to a cast this recent.
local CAST_MATCH = 1.5  -- seconds
local lastCast = {}     -- [spell name] = { who =, guid =, time = }

local function OnCastSucceeded(unit, spellID)
    if unit == "player" then return end
    spellID = Clean(spellID)
    local spell = spellID and C_Spell.GetSpellName(spellID)
    if not (spell and Buffs()[spell]) then return end
    if not Clean(UnitIsPlayer(unit)) or InMyGroup(unit) then return end
    local who = Clean(GetUnitName(unit, true))
    if not who then return end
    lastCast[spell] = { who = who, guid = Clean(UnitGUID(unit)) or who, time = GetTime() }
end

local function OnAuraAdded(aura)
    if not Clean(aura.isHelpful) then return end
    local name, unit = Clean(aura.name), Clean(aura.sourceUnit)
    if not (name and Buffs()[name]) then return end
    if not unit then
        local cast = lastCast[name]
        if cast and GetTime() - cast.time <= CAST_MATCH then Thank(cast.who, cast.guid) end
        return
    end
    if not Clean(UnitIsPlayer(unit)) or Clean(UnitIsUnit(unit, "player")) ~= false then return end
    if InMyGroup(unit) then return end
    -- By name: the unit token (mouseover, nameplate) may point elsewhere by
    -- the time the emote goes out.
    local who = Clean(GetUnitName(unit, true))
    if who then Thank(who, Clean(UnitGUID(unit)) or who) end
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
local f = CreateFrame("Frame")

local function Listen(on)
    if on then
        f:RegisterUnitEvent("UNIT_AURA", "player")
        f:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    else
        f:UnregisterEvent("UNIT_AURA")
        f:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    end
end

local FRIEND_PLATES = "nameplateShowFriendlyPlayers"
-- Plate settings that go with them, put back when Serene turns them off.
local PLATE_LOOK = {
    nameOnly   = "nameplateShowOnlyNameForFriendlyPlayerUnits",
    classColor = "nameplateUseClassColorForFriendlyPlayerUnitNames",
}

local function ClickThrough(on)
    if C_NamePlate.SetNamePlateFriendlyClickThrough then C_NamePlate.SetNamePlateFriendlyClickThrough(on) end
end

-- Off in instances (friendly plates there may be out of addons' reach, and
-- buffs come from the group anyway). Friendly plates the player turned on
-- are left alone. SereneDB.friendPlatesSet holds the PLATE_LOOK values from
-- before Serene turned the plates on. Nameplate settings cannot change in
-- combat; it waits.
local function SyncFriendPlates()
    if InCombatLockdown() then return f:RegisterEvent("PLAYER_REGEN_ENABLED") end
    local want = ns.Enabled("thankBuffs") and not IsInInstance()
    if want and GetCVar(FRIEND_PLATES) ~= "1" then
        local before = {}
        for k, cvar in pairs(PLATE_LOOK) do before[k] = GetCVar(cvar) == "1" and "1" or "0" end
        SereneDB.friendPlatesSet = before
        SetCVar(FRIEND_PLATES, "1")
    elseif not want and SereneDB.friendPlatesSet then
        SetCVar(FRIEND_PLATES, "0")
        local before = SereneDB.friendPlatesSet
        for k, cvar in pairs(PLATE_LOOK) do SetCVar(cvar, before[k] == "1" and "1" or "0") end
        SereneDB.friendPlatesSet = nil
        ClickThrough(false)
    end
    -- Every time: the client may not keep click-through between sessions.
    if SereneDB.friendPlatesSet then
        for _, cvar in pairs(PLATE_LOOK) do SetCVar(cvar, "1") end
        ClickThrough(true)
    end
end

f:SetScript("OnEvent", function(_, event, ...)
    if event == "UNIT_AURA" then
        local _, info = ...
        info = Clean(info)
        if not info then return end
        -- In combat the update itself is secret (flag and list alike): nothing
        -- can be read, so nothing is thanked.
        local full, added = info.isFullUpdate, Clean(info.addedAuras)
        if not added or (issecret and issecret(full)) or full then return end
        for _, aura in ipairs(added) do
            aura = Clean(aura)
            if aura then OnAuraAdded(aura) end
        end
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unit, _, spellID = ...
        OnCastSucceeded(unit, spellID)
    elseif event == "PLAYER_LEAVING_WORLD" then
        -- Buffs come back on during the loading screen; none of them are new.
        Listen(false)
    elseif event == "PLAYER_ENTERING_WORLD" then
        settleUntil = GetTime() + SETTLE
        Listen(true)
        SyncFriendPlates()
    elseif event == "PLAYER_REGEN_ENABLED" then
        f:UnregisterEvent(event)
        SyncFriendPlates()
    end
end)

ns.RegisterFeature({
    key = "thankBuffs", label = "Thank for Buffs", section = SECTION,
    apply = function()
        local on = ns.Enabled("thankBuffs")
        if on then
            f:RegisterEvent("PLAYER_ENTERING_WORLD")
            f:RegisterEvent("PLAYER_LEAVING_WORLD")
        else
            f:UnregisterAllEvents()
        end
        Listen(on)
        SyncFriendPlates()
    end,
    tooltip = "Thanks players outside your group with an emote when they buff you (Fortitude, Mark of "
        .. "the Wild, Arcane Intellect, Blessings and the like). Each player is thanked at most once "
        .. "every 90 seconds. Buffs given in combat are not thanked.\nTurns on name-only, class colored "
        .. "friendly player nameplates outside instances, so the game can tell who buffed you.",
})
ns.RegisterFeature({
    key = "thankBuffEmote", label = "Thank Emote", section = SECTION, type = "dropdown", default = "random",
    requires = "thankBuffs",
    tooltip = "The emote used to say thanks. Random picks a new one each time.",
    options = function()
        local list = { { value = "random", label = "Random" } }
        for _, e in ipairs(EMOTES) do list[#list + 1] = e end
        return list
    end,
})

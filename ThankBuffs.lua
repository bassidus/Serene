-------------------------------------------------------------------------------
--  Thank for Buffs -- when another player gives you a buff (Fortitude, Mark
--  of the Wild, a Blessing...) you /thank, /cheer, /bow... them back, with a
--  random emote or the one you pick. Each player is thanked at most once
--  every 90 seconds, and your own party or raid is left out (they buff you
--  all the time). Idea from Thanks For The Buff (TFTB) by Runew0lf, written
--  for Serene.
--
--  On the 12.1 engine aura data is secret in combat and the combat log is
--  closed to addons, so new auras come from UNIT_AURA and the caster is the
--  aura's sourceUnit: a buff in combat, or from a player you have no unit
--  for (target, mouseover, nameplate...), goes unthanked. Clients without
--  secret restrictions read the combat log instead, as TFTB does. Buffs
--  already on you after a loading screen are never thanked. Events are only
--  registered while the setting is on.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Social"
local COOLDOWN = 90      -- seconds before the same player is thanked again
local SETTLE = 2         -- seconds after a loading screen with no thanks

local issecret, canaccess = issecretvalue, canaccessvalue
local function Clean(v)
    if issecret and issecret(v) then return nil end
    if canaccess and not canaccess(v) then return nil end
    return v
end

local useCombatLog = CombatLogGetCurrentEventInfo
    and not (C_Secrets and C_Secrets.HasSecretRestrictions and C_Secrets.HasSecretRestrictions())

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

local SpellName = (C_Spell and C_Spell.GetSpellName) or function(id) return (GetSpellInfo(id)) end

local buffs
local function Buffs()
    if buffs then return buffs end
    buffs = {}
    for _, id in ipairs(BUFF_IDS) do
        local name = SpellName(id)
        if name then buffs[name] = true end
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

-- target is the name DoEmote aims at; key identifies the player for the
-- cooldown.
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

-- 12.1 engine: one aura added to the player.
local function OnAuraAdded(aura)
    if not Clean(aura.isHelpful) then return end
    local name, unit = Clean(aura.name), Clean(aura.sourceUnit)
    if not (name and unit and Buffs()[name]) then return end
    if not Clean(UnitIsPlayer(unit)) or Clean(UnitIsUnit(unit, "player")) ~= false then return end
    if InMyGroup(unit) then return end
    -- By name: the unit token (mouseover, nameplate) may point elsewhere by
    -- the time the emote goes out.
    local who = Clean(GetUnitName(unit, true))
    if who then Thank(who, Clean(UnitGUID(unit)) or who) end
end

local playerGUID
-- Older clients: the combat log names the caster even with no unit for them.
local function OnCombatLog()
    local _, subevent, _, sourceGUID, sourceName, _, _, destGUID, _, _, _, _, spellName =
        CombatLogGetCurrentEventInfo()
    if subevent ~= "SPELL_AURA_APPLIED" or destGUID ~= playerGUID then return end
    if not (sourceGUID and sourceName) or sourceGUID == playerGUID then return end
    if not Buffs()[spellName] or not sourceGUID:find("^Player%-") then return end
    if InMyGroup(sourceName) then return end
    Thank(sourceName, sourceGUID)
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
local f = CreateFrame("Frame")
local AURA_EVENT = useCombatLog and "COMBAT_LOG_EVENT_UNFILTERED" or "UNIT_AURA"

local function Listen(on)
    if not on then return f:UnregisterEvent(AURA_EVENT) end
    if useCombatLog then
        f:RegisterEvent(AURA_EVENT)
    else
        f:RegisterUnitEvent(AURA_EVENT, "player")
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
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        OnCombatLog()
    elseif event == "PLAYER_LEAVING_WORLD" then
        -- Buffs come back on during the loading screen; none of them are new.
        Listen(false)
    elseif event == "PLAYER_ENTERING_WORLD" then
        playerGUID = UnitGUID("player")
        settleUntil = GetTime() + SETTLE
        Listen(true)
    end
end)

ns.RegisterFeature({
    key = "thankBuffs", cmd = "thanks", label = "Thank for Buffs", section = SECTION,
    apply = function()
        local on = ns.Enabled("thankBuffs")
        if on then
            f:RegisterEvent("PLAYER_ENTERING_WORLD")
            f:RegisterEvent("PLAYER_LEAVING_WORLD")
            playerGUID = UnitGUID("player")
        else
            f:UnregisterAllEvents()
        end
        Listen(on)
    end,
    tooltip = "Thanks players outside your group with an emote when they buff you (Fortitude, Mark of "
        .. "the Wild, Arcane Intellect, Blessings and the like). Each player is thanked at most once "
        .. "every 90 seconds. Buffs given in combat are not thanked.",
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

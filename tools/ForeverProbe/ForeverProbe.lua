-------------------------------------------------------------------------------
--  Forever Probe -- a dev tool, not part of Serene's release.
--
--  Records per client build, in ForeverProbeDB:
--    api     every global function, C_* function, Enum value and named frame
--    units   which unit API returns are secret, per unit kind and combat state
--    events  the argument types of common events, secret ones marked
--    docs    Blizzard's API documentation (/api): every documented function,
--            event and table with its arguments, returns and secret rules
--
--  Units are sampled on target change, on entering combat, every few seconds
--  in combat and on /fprobe. The API list and the docs are taken once per
--  build (/fprobe api takes them again). tools/probe-report.lua writes the
--  reports.
--
--  Unknown APIs are expected here, so calls go through pcall.
-------------------------------------------------------------------------------
local VERSION, BUILD, BUILD_DATE, TOC = GetBuildInfo()
local KEY = VERSION .. "." .. BUILD

local db  -- this build's table

local function Secret(v)
    return issecretvalue(v) or not canaccessvalue(v)
end

-- "SECRET", or the type with a short clean value.
local function Describe(v)
    if Secret(v) then return "SECRET" end
    local t = type(v)
    if t == "string" then return "string:" .. v:sub(1, 24) end
    if t == "number" or t == "boolean" then return t .. ":" .. tostring(v) end
    return t
end

local function Kind(v)
    if Secret(v) then return "SECRET" end
    return type(v)
end

local function Clean(v)
    if Secret(v) then return nil end
    return v
end

local function InCombat()
    return InCombatLockdown() and "combat" or "nocombat"
end

-------------------------------------------------------------------------------
--  API list
-------------------------------------------------------------------------------
local function DumpApi()
    local list = {}
    for k, v in pairs(_G) do
        if type(k) == "string" then
            local t = type(v)
            if t == "function" then
                list[#list + 1] = k
            elseif t == "table" then
                if k:match("^C_") then
                    for k2, v2 in pairs(v) do
                        if type(v2) == "function" then list[#list + 1] = k .. "." .. tostring(k2) end
                    end
                elseif k == "Enum" then
                    for k2, v2 in pairs(v) do
                        if type(v2) == "table" then
                            for k3, v3 in pairs(v2) do
                                list[#list + 1] = "Enum." .. tostring(k2) .. "." .. tostring(k3) .. " = " .. tostring(v3)
                            end
                        end
                    end
                elseif type(rawget(v, 0)) == "userdata" then
                    list[#list + 1] = "frame " .. k
                end
            end
        end
    end
    table.sort(list)
    db.api = list
    print("|cff28da79Forever Probe|r: " .. #list .. " API names saved for build " .. KEY .. ".")
end

-------------------------------------------------------------------------------
--  Blizzard's API documentation (what /api shows)
-------------------------------------------------------------------------------
-- A plain copy: no functions (mixin methods), and a table met again (the
-- docs point back at their system) becomes its Name.
local function Copy(v, seen, depth)
    if type(v) ~= "table" then return v end
    if seen[v] or depth > 10 then return "<" .. tostring(rawget(v, "Name") or "ref") .. ">" end
    seen[v] = true
    local out = {}
    for k, x in pairs(v) do
        local t = type(x)
        if (type(k) == "string" or type(k) == "number") and t ~= "function" and t ~= "userdata" then
            out[k] = Copy(x, seen, depth + 1)
        end
    end
    seen[v] = nil
    return out
end

local function DumpDocs()
    local ok, err = pcall(APIDocumentation_LoadUI)
    if not ok or type(APIDocumentation) ~= "table" or type(APIDocumentation.systems) ~= "table" then
        db.docs = { error = tostring(err or "APIDocumentation.systems missing") }
        print("|cff28da79Forever Probe|r: API documentation not found: " .. db.docs.error)
        return
    end
    local systems = {}
    for i, system in ipairs(APIDocumentation.systems) do
        systems[i] = Copy(system, {}, 0)
    end
    db.docs = { systems = systems }
    print("|cff28da79Forever Probe|r: " .. #systems .. " documented systems saved for build " .. KEY .. ".")
end

-------------------------------------------------------------------------------
--  Unit values
-------------------------------------------------------------------------------
local AURA_FIELDS = { "name", "spellId", "icon", "applications", "duration", "expirationTime",
    "sourceUnit", "isFromPlayerOrPlayerPet", "dispelName", "isStealable", "auraInstanceID" }

-- CheckInteractDistance is left out: it is protected on Forever
-- (ADDON_ACTION_BLOCKED), at least on some units.
local UNIT_APIS = {
    { "UnitExists",                 function(u) return UnitExists(u) end },
    { "UnitGUID",                   function(u) return UnitGUID(u) end },
    { "UnitName",                   function(u) return UnitName(u) end },
    { "UnitLevel",                  function(u) return UnitLevel(u) end },
    { "UnitEffectiveLevel",         function(u) return UnitEffectiveLevel(u) end },
    { "UnitClass",                  function(u) return UnitClass(u) end },
    { "UnitRace",                   function(u) return UnitRace(u) end },
    { "UnitSex",                    function(u) return UnitSex(u) end },
    { "UnitClassification",         function(u) return UnitClassification(u) end },
    { "UnitCreatureType",           function(u) return UnitCreatureType(u) end },
    { "UnitCreatureFamily",         function(u) return UnitCreatureFamily(u) end },
    { "UnitFactionGroup",           function(u) return UnitFactionGroup(u) end },
    { "UnitIsPlayer",               function(u) return UnitIsPlayer(u) end },
    { "UnitIsUnit(u, target)",      function(u) return UnitIsUnit(u, "target") end },
    { "UnitIsUnit(u, player)",      function(u) return UnitIsUnit(u, "player") end },
    { "UnitReaction(u, player)",    function(u) return UnitReaction(u, "player") end },
    { "UnitCanAttack(player, u)",   function(u) return UnitCanAttack("player", u) end },
    { "UnitCanAssist(player, u)",   function(u) return UnitCanAssist("player", u) end },
    { "UnitIsEnemy(player, u)",     function(u) return UnitIsEnemy("player", u) end },
    { "UnitIsFriend(player, u)",    function(u) return UnitIsFriend("player", u) end },
    { "UnitIsPVP",                  function(u) return UnitIsPVP(u) end },
    { "UnitIsTapDenied",            function(u) return UnitIsTapDenied(u) end },
    { "UnitIsDeadOrGhost",          function(u) return UnitIsDeadOrGhost(u) end },
    { "UnitAffectingCombat",        function(u) return UnitAffectingCombat(u) end },
    { "UnitHealth",                 function(u) return UnitHealth(u) end },
    { "UnitHealthMax",              function(u) return UnitHealthMax(u) end },
    { "UnitHealthPercent",          function(u) return UnitHealthPercent(u) end },
    { "UnitGetIncomingHeals",       function(u) return UnitGetIncomingHeals(u) end },
    { "UnitGetTotalAbsorbs",        function(u) return UnitGetTotalAbsorbs(u) end },
    { "UnitPowerType",              function(u) return UnitPowerType(u) end },
    { "UnitPower",                  function(u) return UnitPower(u) end },
    { "UnitPowerMax",               function(u) return UnitPowerMax(u) end },
    { "UnitPower(u, Mana)",         function(u) return UnitPower(u, Enum.PowerType.Mana) end },
    { "UnitPowerMax(u, Mana)",      function(u) return UnitPowerMax(u, Enum.PowerType.Mana) end },
    { "UnitPowerPercent(u, Mana)",  function(u) return UnitPowerPercent(u, Enum.PowerType.Mana) end },
    { "UnitPower(player, Combo)",   function(u) return UnitPower("player", Enum.PowerType.ComboPoints) end },
    { "UnitThreatSituation(player, u)", function(u) return UnitThreatSituation("player", u) end },
    { "UnitDetailedThreatSituation(player, u)", function(u) return UnitDetailedThreatSituation("player", u) end },
    { "UnitCastingInfo",            function(u) return UnitCastingInfo(u) end },
    { "UnitChannelInfo",            function(u) return UnitChannelInfo(u) end },
    { "UnitCastingDuration",        function(u) return UnitCastingDuration(u) end },
    { "GetRaidTargetIndex",         function(u) return GetRaidTargetIndex(u) end },
    { "UnitInRange",                function(u) return UnitInRange(u) end },
    { "C_NamePlate.GetNamePlateForUnit", function(u) return C_NamePlate.GetNamePlateForUnit(u) end },
    { "GetShapeshiftFormID",        function(u) return GetShapeshiftFormID() end },
}

local function Observe(slot, label, v, err)
    local o = slot.values[label]
    if not o then
        o = { kinds = {} }
        slot.values[label] = o
    end
    local k = err and "error" or Kind(v)
    o.kinds[k] = (o.kinds[k] or 0) + 1
    o.last = err and "error: " .. tostring(err) or Describe(v)
end

local function ObserveAll(slot, label, ok, ...)
    if not ok then
        Observe(slot, label, nil, (...))
        return
    end
    local n = select("#", ...)
    if n <= 1 then
        Observe(slot, label, (...))
    else
        for i = 1, n do Observe(slot, label .. " #" .. i, (select(i, ...))) end
    end
end

local function Relation(unit)
    if Clean(UnitIsUnit(unit, "player")) then return "self" end
    local isPlayer, canAttack = Clean(UnitIsPlayer(unit)), Clean(UnitCanAttack("player", unit))
    local who = isPlayer == nil and "?" or (isPlayer and "pc" or "npc")
    local side
    if canAttack == nil then
        side = "?"
    elseif not canAttack then
        side = "friendly"
    else
        side = Clean(UnitReaction(unit, "player")) == 4 and "neutral" or "hostile"
    end
    return who .. "-" .. side
end

local function Sample(token, unit)
    if not Clean(UnitExists(unit)) then return end
    local ctx = token .. " | " .. Relation(unit) .. " | " .. InCombat()
    local slot = db.units[ctx]
    if not slot then
        slot = { n = 0, names = {}, values = {} }
        db.units[ctx] = slot
    end
    slot.n = slot.n + 1
    -- Mob names say which mobs were seen; other players stay unnamed.
    local name = Clean(UnitName(unit))
    if name and not Clean(UnitIsPlayer(unit)) and #slot.names < 8 and not tContains(slot.names, name) then
        slot.names[#slot.names + 1] = name
    end
    for _, api in ipairs(UNIT_APIS) do
        ObserveAll(slot, api[1], pcall(api[2], unit))
    end
    for _, filter in ipairs({ "HELPFUL", "HARMFUL" }) do
        local ok, aura = pcall(C_UnitAuras.GetAuraDataByIndex, unit, 1, filter)
        local label = "aura " .. filter
        if not ok then
            Observe(slot, label, nil, aura)
        elseif Secret(aura) or type(aura) ~= "table" then
            Observe(slot, label, aura)
        else
            for _, field in ipairs(AURA_FIELDS) do Observe(slot, label .. "." .. field, aura[field]) end
        end
    end
end

-- Plates carry no unit token on Forever; NAME_PLATE_UNIT_ADDED/REMOVED do.
local plateTokens = {}

local function TargetNameplateToken()
    for token in pairs(plateTokens) do
        if Clean(UnitIsUnit(token, "target")) then return token end
    end
end

local function SampleAll()
    Sample("player", "player")
    Sample("target", "target")
    local token = TargetNameplateToken()
    if token then Sample("nameplate", token) end
    Sample("targettarget", "targettarget")
    Sample("pet", "pet")
    Sample("party", "party1")
    Sample("focus", "focus")
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
-- COMBAT_LOG_EVENT_UNFILTERED is left out: registering it is a protected
-- action on Forever (ADDON_ACTION_FORBIDDEN, which pcall does not catch).
local EVENTS = {
    "PLAYER_TARGET_CHANGED", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED",
    "UNIT_POWER_UPDATE", "UNIT_POWER_FREQUENT", "UNIT_MAXPOWER", "UNIT_DISPLAYPOWER",
    "UNIT_HEALTH", "UNIT_MAXHEALTH", "UNIT_AURA", "UNIT_FACTION", "UNIT_LEVEL", "UNIT_NAME_UPDATE",
    "UNIT_THREAT_LIST_UPDATE", "UNIT_THREAT_SITUATION_UPDATE", "UNIT_COMBAT", "UNIT_TARGET",
    "UNIT_SPELLCAST_START", "UNIT_SPELLCAST_STOP", "UNIT_SPELLCAST_SUCCEEDED", "UNIT_SPELLCAST_INTERRUPTED",
    "UNIT_SPELLCAST_CHANNEL_START", "UNIT_SPELLCAST_CHANNEL_STOP",
    "NAME_PLATE_UNIT_ADDED", "NAME_PLATE_UNIT_REMOVED", "UPDATE_MOUSEOVER_UNIT", "RAID_TARGET_UPDATE",
    "UPDATE_SHAPESHIFT_FORM", "ACTION_RANGE_CHECK_UPDATE", "SPELL_UPDATE_COOLDOWN", "SPELL_UPDATE_USABLE",
    "COMBAT_TEXT_UPDATE", "UI_ERROR_MESSAGE", "LOOT_READY",
    "CHAT_MSG_SAY", "CHAT_MSG_WHISPER", "CHAT_MSG_CHANNEL", "CHAT_MSG_SYSTEM", "CHAT_MSG_LOOT",
    "CHAT_MSG_COMBAT_XP_GAIN", "CHAT_MSG_MONSTER_SAY", "CHAT_MSG_MONSTER_YELL",
    "QUEST_LOG_UPDATE", "QUEST_WATCH_UPDATE", "BAG_UPDATE_DELAYED",
}
local MAX_PER_KEY = 300   -- events recorded per event and combat state
local MAX_PATTERNS = 20

-- Unit tokens and power tokens are kept as values; anything else is its type.
local function ArgText(event, i, v)
    if Secret(v) then return "SECRET" end
    if type(v) == "string" and event:match("^UNIT_") and i <= 2 and #v <= 20 then
        return (v:gsub("^nameplate%d+", "nameplateN"):gsub("^party%d", "partyN"))
    end
    if type(v) == "string" and event:match("^NAME_PLATE_UNIT") then
        return (v:gsub("^nameplate%d+", "nameplateN"))
    end
    return type(v)
end

local function Pattern(event, ...)
    local parts = {}
    for i = 1, math.min(select("#", ...), 16) do
        parts[i] = ArgText(event, i, (select(i, ...)))
    end
    return #parts == 0 and "(none)" or table.concat(parts, ", ")
end

local function RecordEvent(event, ...)
    local e = db.events[event]
    if not e then
        e = {}
        db.events[event] = e
    end
    local ctx = InCombat()
    local slot = e[ctx]
    if not slot then
        slot = { n = 0, patterns = {} }
        e[ctx] = slot
    end
    if slot.n >= MAX_PER_KEY then return end
    slot.n = slot.n + 1
    local p = Pattern(event, ...)
    if slot.patterns[p] then
        slot.patterns[p] = slot.patterns[p] + 1
    else
        local count = 0
        for _ in pairs(slot.patterns) do count = count + 1 end
        if count < MAX_PATTERNS then slot.patterns[p] = 1 end
    end
end

-------------------------------------------------------------------------------
--  Wiring
-------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
local combatTicker

local function Later(delay, fn)
    C_Timer.After(delay, fn)
end

frame:SetScript("OnEvent", function(_, event, ...)
    if event == "ADDON_LOADED" then
        if ... ~= "ForeverProbe" then return end
        frame:UnregisterEvent("ADDON_LOADED")
        ForeverProbeDB = ForeverProbeDB or { builds = {} }
        local builds = ForeverProbeDB.builds
        builds[KEY] = builds[KEY] or { units = {}, events = {}, registerFailed = {} }
        db = builds[KEY]
        db.info = { version = VERSION, build = BUILD, date = BUILD_DATE, interface = TOC }
        for _, ev in ipairs(EVENTS) do
            local ok, err = pcall(frame.RegisterEvent, frame, ev)
            if ok then
                db.registerFailed[ev] = nil
            else
                db.registerFailed[ev] = tostring(err)
            end
        end
        return
    end
    if event == "PLAYER_LOGIN" then
        if not db.api then DumpApi() end
        if not db.docs then DumpDocs() end
        Later(2, SampleAll)
        return
    end
    RecordEvent(event, ...)
    if event == "NAME_PLATE_UNIT_ADDED" then
        plateTokens[...] = true
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        plateTokens[...] = nil
    end
    if event == "PLAYER_TARGET_CHANGED" then
        Later(0.3, SampleAll)
    elseif event == "PLAYER_REGEN_DISABLED" then
        Later(1.5, SampleAll)
        combatTicker = C_Timer.NewTicker(5, SampleAll)
    elseif event == "PLAYER_REGEN_ENABLED" then
        if combatTicker then combatTicker:Cancel() end
        combatTicker = nil
        Later(1, SampleAll)
    end
end)
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

SLASH_FOREVERPROBE1 = "/fprobe"
SlashCmdList.FOREVERPROBE = function(msg)
    if msg == "api" then
        DumpApi()
        DumpDocs()
    else
        SampleAll()
        local n = 0
        for _ in pairs(db.units) do n = n + 1 end
        print("|cff28da79Forever Probe|r: sampled. " .. n .. " unit kinds so far for build " .. KEY .. ". /reload to save.")
    end
end

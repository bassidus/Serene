-------------------------------------------------------------------------------
--  Thank you for the buff -- a Blizzard emote aimed at a player outside your
--  group who buffs you ("You thank Bob."), sent after a short pause.
--
--  The caster comes from the aura's caster GUID, which also covers buffs
--  with no source unit. Aura data is secret in combat, so buffs in combat go
--  unthanked, as do buffs whose caster can't be read. Buffs put back on
--  after a loading screen are not new and are skipped.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Social"
local COOLDOWN = 60      -- seconds before anyone is thanked again
local SETTLE = 2         -- seconds after a loading screen with no thanks

local Clean = ns.Clean

-------------------------------------------------------------------------------
--  Buffs worth a thank-you, by name so every rank counts.
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
--  Emotes -- Blizzard's own, so the caster reads "Serene thanks you."
-------------------------------------------------------------------------------
local EMOTES = {
    { value = "THANK",   label = "Thank" },
    { value = "BOW",     label = "Bow" },
    { value = "SALUTE",  label = "Salute" },
    { value = "CHEER",   label = "Cheer" },
    { value = "APPLAUD", label = "Applaud" },
    { value = "WAVE",    label = "Wave" },
    { value = "SMILE",   label = "Smile" },
    { value = "CURTSEY", label = "Curtsey" },
}

local function PickEmote()
    local choice = ns.Get("thankBuffEmote")
    if choice == "random" then return EMOTES[math.random(#EMOTES)].value end
    return choice
end

-------------------------------------------------------------------------------
--  Thanking
-------------------------------------------------------------------------------
local nextThanks = 0
local settleUntil = 0

local function Thank(name)
    local now = GetTime()
    if now < settleUntil or now < nextThanks then return end
    nextThanks = now + COOLDOWN
    -- A short, varied pause reads less like a macro than an instant reply.
    C_Timer.After(1.5 + math.random() * 1.5, function()
        if not ns.Get("thankBuffs") or InCombatLockdown() then return end
        C_ChatInfo.PerformEmote(PickEmote(), name, false)
    end)
end

-- Secret answers count as "in the group" or "not a player": better a missed
-- thanks than a wrong one.
local function OnAuraAdded(aura)
    if not Clean(aura.isHelpful) then return end
    local name = Clean(aura.name)
    if not (name and Buffs()[name]) then return end
    local guid = Clean(C_UnitAuras.GetAuraCasterGUID("player", aura.auraInstanceID))
    if not guid or guid == Clean(UnitGUID("player")) then return end
    if Clean(C_PlayerInfo.GUIDIsPlayer(guid)) ~= true then return end
    if Clean(C_PartyInfo.IsGUIDInGroup(guid)) ~= false then return end
    local caster = Clean(UnitNameFromGUID(guid))
    if caster then Thank(caster) end
end

-------------------------------------------------------------------------------
--  Events
-------------------------------------------------------------------------------
local f = CreateFrame("Frame")

local function Listen(on)
    if on then f:RegisterUnitEvent("UNIT_AURA", "player") else f:UnregisterEvent("UNIT_AURA") end
end

f:SetScript("OnEvent", function(_, event, ...)
    if event == "UNIT_AURA" then
        local _, info = ...
        info = Clean(info)
        if not info then return end
        -- In combat the update itself is secret (flag and list alike): nothing
        -- can be read, so nothing is thanked.
        local full, added = info.isFullUpdate, Clean(info.addedAuras)
        if not added or issecretvalue(full) or full then return end
        for _, aura in ipairs(added) do
            aura = Clean(aura)
            if aura then OnAuraAdded(aura) end
        end
    elseif event == "PLAYER_LEAVING_WORLD" then
        -- Buffs come back on during the loading screen; none of them are new.
        Listen(false)
    elseif event == "PLAYER_ENTERING_WORLD" then
        settleUntil = GetTime() + SETTLE
        Listen(true)
    end
end)

-------------------------------------------------------------------------------
--  Settings
-------------------------------------------------------------------------------
ns.RegisterFeature({
    key = "thankBuffs", label = "Thank players who buff you", section = SECTION, category = "Thanks for buffs",
    apply = function()
        local on = ns.Get("thankBuffs")
        if on then
            f:RegisterEvent("PLAYER_ENTERING_WORLD")
            f:RegisterEvent("PLAYER_LEAVING_WORLD")
        else
            f:UnregisterAllEvents()
        end
        Listen(on)
    end,
})
ns.RegisterFeature({
    key = "thankBuffEmote", label = "Emote", section = SECTION, category = "Thanks for buffs",
    type = "dropdown", default = "THANK", beside = true, hideLabel = true,
    requires = "thankBuffs",
    options = function()
        local list = { { value = "random", label = "Random" } }
        for _, m in ipairs(EMOTES) do list[#list + 1] = m end
        return list
    end,
})

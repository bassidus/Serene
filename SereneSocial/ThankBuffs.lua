-------------------------------------------------------------------------------
--  Thank you for the buff -- a /emote in chat when a player outside your
--  group buffs you.
--
--  The thanks is not aimed at anyone, so the caster need not be known: a
--  new aura from the list that you did not cast, from a unit outside the
--  group or from no unit at all (group members always have one), is enough.
--  Aura data is secret in combat, so buffs in combat go unthanked. Buffs put
--  back on after a loading screen are not new and are skipped.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Social"
local COOLDOWN = 60      -- seconds before anyone is thanked again
local SETTLE = 2         -- seconds after a loading screen with no thanks

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
--  Messages -- the chat puts your name in front: "Basse bows gratefully."
-------------------------------------------------------------------------------
local MESSAGES = {
    { value = "thanks", label = "says thanks for the buff!" },
    { value = "cheers", label = "raises a glass. Cheers for the buff!" },
    { value = "bow",    label = "bows gratefully." },
    { value = "smile",  label = "smiles. Thanks!" },
    { value = "thumbs", label = "gives a thumbs up for the buff." },
}

local function PickMessage()
    local choice = ns.Get("thankBuffMessage")
    for _, m in ipairs(MESSAGES) do
        if m.value == choice then return m.label end
    end
    return MESSAGES[math.random(#MESSAGES)].label
end

-------------------------------------------------------------------------------
--  Thanking
-------------------------------------------------------------------------------
local nextThanks = 0
local settleUntil = 0

-- Secret answers count as "in the group": better a missed thanks than a wrong one.
local function InMyGroup(who)
    local party, raid = UnitInParty(who), UnitInRaid(who)
    if issecretvalue(party) or issecretvalue(raid) then return true end
    return party or raid
end

local function Thank()
    local now = GetTime()
    if now < settleUntil or now < nextThanks then return end
    nextThanks = now + COOLDOWN
    -- A short, varied pause reads less like a macro than an instant reply.
    C_Timer.After(1.5 + math.random() * 1.5, function()
        if not ns.Enabled("thankBuffs") then return end
        C_ChatInfo.SendChatMessage(PickMessage(), "EMOTE")
    end)
end

local function OnAuraAdded(aura)
    if not Clean(aura.isHelpful) then return end
    local name, unit = Clean(aura.name), Clean(aura.sourceUnit)
    if not (name and Buffs()[name]) then return end
    if unit then
        if not Clean(UnitIsPlayer(unit)) or Clean(UnitIsUnit(unit, "player")) ~= false then return end
        if InMyGroup(unit) then return end
    end
    Thank()
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
    tooltip = "An /emote at most once a minute, not for group members or buffs in combat",
    apply = function()
        local on = ns.Enabled("thankBuffs")
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
    key = "thankBuffMessage", label = "Message", section = SECTION, category = "Thanks for buffs",
    type = "dropdown", default = "random", beside = true, hideLabel = true,
    requires = "thankBuffs",
    options = function()
        local list = { { value = "random", label = "Random" } }
        for _, m in ipairs(MESSAGES) do list[#list + 1] = m end
        return list
    end,
})

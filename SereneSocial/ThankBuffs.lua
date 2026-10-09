-------------------------------------------------------------------------------
--  Thank you for the buff -- a /emote in chat when a player outside your
--  group buffs you, sent on your next key press.
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
local WAIT = 30          -- seconds a thanks waits for a key press

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
--  Messages -- the chat puts your name in front: "Serene bows gratefully."
-------------------------------------------------------------------------------
local MESSAGES = {
    { value = "thanks",      label = "says thanks for the buff!" },
    { value = "cheers",      label = "raises a glass. Cheers for the buff!" },
    { value = "bow",         label = "bows gratefully." },
    { value = "smile",       label = "smiles. Thanks!" },
    { value = "thumbs",      label = "gives a thumbs up for the buff." },
    { value = "salute",      label = "salutes. Much obliged!" },
    { value = "hat",         label = "tips an imaginary hat. Thank you kindly!" },
    { value = "curtsy",      label = "curtsies gracefully. Thank you!" },
    { value = "nod",         label = "nods appreciatively." },
    { value = "grin",        label = "grins from ear to ear. Thanks!" },
    { value = "beam",        label = "beams happily. Thanks for the buff!" },
    { value = "glow",        label = "glows with gratitude." },
    { value = "sparkle",     label = "sparkles a little brighter. Thanks!" },
    { value = "wave",        label = "waves. Thanks, stranger!" },
    { value = "applaud",     label = "applauds the kind stranger." },
    { value = "highfive",    label = "high-fives the air. Thanks!" },
    { value = "kiss",        label = "blows a grateful kiss." },
    { value = "knee",        label = "takes a knee in gratitude." },
    { value = "dance",       label = "does a little thank-you dance." },
    { value = "flex",        label = "flexes. Thanks for the buff!" },
    { value = "sigh",        label = "sighs contentedly. Thank you!" },
    { value = "shout",       label = "shouts a hearty thanks!" },
    { value = "humble",      label = "humbly accepts the buff. Thank you!" },
    { value = "honored",     label = "is honored. Thank you!" },
    { value = "touched",     label = "is touched by the kindness. Thank you!" },
    { value = "blessed",     label = "feels truly blessed. Thank you!" },
    { value = "warm",        label = "feels warm and fuzzy. Thanks for the buff!" },
    { value = "stronger",    label = "feels stronger already. Thanks!" },
    { value = "smarter",     label = "feels a little smarter. Thanks!" },
    { value = "tougher",     label = "feels tougher already. Thank you!" },
    { value = "power",       label = "feels the power flowing. Thank you!" },
    { value = "unstoppable", label = "feels unstoppable. Thanks!" },
    { value = "tall",        label = "feels ten feet tall. Thanks!" },
    { value = "kodo",        label = "feels strong as a kodo. Thanks!" },
    { value = "ogre",        label = "could arm-wrestle an ogre now. Thanks!" },
    { value = "dragon",      label = "could take on a dragon now. Thanks for the buff!" },
    { value = "azeroth",     label = "is ready to take on Azeroth. Thanks!" },
    { value = "adventure",   label = "is ready for adventure. Thanks for the buff!" },
    { value = "helm",        label = "shines like a freshly polished helm. Thanks!" },
    { value = "pocket",      label = "tucks the buff away for later. Thanks!" },
    { value = "ask",         label = "didn't even have to ask. Thanks!" },
    { value = "lfg",         label = "can stop asking trade chat for buffs now. Thanks!" },
    { value = "hearth",      label = "likes this more than a hearthstone off cooldown. Thanks!" },
    { value = "repair",      label = "is happier than after a free repair. Thanks!" },
    { value = "copper",      label = "flips a grateful copper. Thanks!" },
    { value = "round",       label = "owes someone the next round. Thanks for the buff!" },
    { value = "ale",         label = "raises a mug of Thunder Ale in thanks." },
    { value = "toast",       label = "raises a toast to random acts of kindness." },
    { value = "forward",     label = "will pay it forward. Thanks for the buff!" },
    { value = "remember",    label = "will remember this kindness." },
    { value = "hero",        label = "thanks the unsung hero." },
    { value = "legend",      label = "salutes a true legend. Thanks!" },
    { value = "passerby",    label = "thanks the generous passerby." },
    { value = "travels",     label = "wishes the kind stranger safe travels." },
    { value = "loot",        label = "wishes the kind stranger good loot. Thanks!" },
    { value = "day",         label = "says thanks, that made the day!" },
    { value = "murloc",      label = "gurgles happily. Mrglglgl, thanks!" },
    { value = "zugzug",      label = "says zug zug. Thanks for the buff!" },
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

-- Addons may only send chat on a key press or a click, so the thanks waits
-- for your next key, which still reaches the game. Unsent after WAIT, it is
-- dropped: a late thanks would land on no one.
local keys = CreateFrame("Frame")
keys:Hide()
local keysReady = false
local waitUntil = 0

keys:SetScript("OnKeyDown", function(self)
    self:Hide()
    if ns.Get("thankBuffs") then C_ChatInfo.SendChatMessage(PickMessage(), "EMOTE") end
end)
keys:SetScript("OnUpdate", function(self)
    if GetTime() > waitUntil then self:Hide() end
end)

local function Thank()
    local now = GetTime()
    if now < settleUntil or now < nextThanks then return end
    -- Both setters are locked in combat; buffs in combat go unthanked anyway.
    if not keysReady then
        if InCombatLockdown() then return end
        keys:EnableKeyboard(true)
        keys:SetPropagateKeyboardInput(true)
        keysReady = true
    end
    nextThanks = now + COOLDOWN
    -- A short, varied pause reads less like a macro than an instant reply.
    C_Timer.After(1.5 + math.random() * 1.5, function()
        waitUntil = GetTime() + WAIT
        keys:Show()
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
    key = "thankBuffMessage", label = "Message", section = SECTION, category = "Thanks for buffs",
    type = "dropdown", default = "random", beside = true, hideLabel = true,
    requires = "thankBuffs",
    options = function()
        local list = { { value = "random", label = "Random" } }
        for _, m in ipairs(MESSAGES) do list[#list + 1] = m end
        return list
    end,
})

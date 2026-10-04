-------------------------------------------------------------------------------
--  Nameplate Debuffs -- a row above the name: icon, swipe, time left, stacks.
--
--  Aura data is secret in combat, so the engine's aura container reads the
--  auras and fills our icon, cooldown and text regions itself. Every region
--  is styled before it is handed over, since the engine writes to them right
--  away. Each pooled plate owns one container, bound to the plate's unit on
--  attach and parked on unit "none" on detach. A container's groups and
--  filters are fixed once declared, so it holds one group per filter (all
--  casters / only yours) and the unused one is parked at 0 icons.
-------------------------------------------------------------------------------
local _, ns = ...
local NP = ns.NP

-- Canonical filter order (polarity first, the rest alphabetical).
local GROUPS = {
    all  = "HARMFUL|INCLUDE_NAME_PLATE_ONLY",
    mine = "HARMFUL|INCLUDE_NAME_PLATE_ONLY|PLAYER",
}
local MAX_ICONS = 6

if C_AddOns and not C_AddOns.IsAddOnLoaded("Blizzard_AuraContainer") then
    pcall(C_AddOns.LoadAddOn, "Blizzard_AuraContainer")
end
local unavailable  -- set when this client has no aura container

local function Enabled()
    return ns.Enabled("nameplateDebuffs")
end

local function IconSize()
    return math.max(14, math.floor(ns.Get("nameplateWidth") / 6.5))
end

-- Every engine button made so far, for resizing (weak: the engine owns them).
local buttons = setmetatable({}, { __mode = "k" })

-- Runs once per engine button (they are made in batches), before any aura.
local function InitButton(button)
    -- The group layout only places buttons; their size is ours to set, and an
    -- unsized button draws nothing.
    local size = IconSize()
    button:SetSize(size, size)
    buttons[button] = size

    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    local cd = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    cd:SetAllPoints()
    cd:SetDrawEdge(false)
    cd:SetReverse(true)
    cd:SetHideCountdownNumbers(true)

    -- Border and texts sit on carriers above the swipe. None take the mouse:
    -- on a plate they would swallow the click that should target the unit.
    local top = CreateFrame("Frame", nil, button)
    top:SetAllPoints()
    top:SetFrameLevel(cd:GetFrameLevel() + 2)
    top:EnableMouse(false)
    NP.Border(top)

    local duration = top:CreateFontString(nil, "OVERLAY")
    NP.SetFont(duration, -1)
    duration:SetPoint("CENTER", button, "CENTER", 0, 0)
    local stack = top:CreateFontString(nil, "OVERLAY")
    NP.SetFont(stack, -1)
    stack:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -1)

    pcall(button.SetMouseClickEnabled, button, false)

    button:SetIcon(icon)
    button:SetDurationCooldown(cd)
    button:SetApplicationCount(stack, {})
    -- Engine-side time text; without it the cooldown shows its own numbers.
    if not pcall(button.SetDurationText, button, duration, {}) then
        cd:SetHideCountdownNumbers(false)
    end
end

local function Create(plate)
    if unavailable then return end
    local made, c = pcall(CreateFrame, "AuraContainer", nil, plate, "CustomAuraContainerTemplate")
    if not made then
        ns.Print("Nameplate debuffs are not available on this client.")
        unavailable = true
        return
    end
    c:SetPoint("BOTTOM", plate.health, "TOP", 0, ns.Get("nameplateFontSize") + 8)
    c:SetSize(1, 1)
    local set = c.SetFlowLayoutAnchorPoint or c.SetAuraLayoutAnchorPoint
    if set then set(c, "BOTTOMLEFT") end
    -- Growth takes AnchorUtil.FlowDirection values, not point names.
    local FD = AnchorUtil and AnchorUtil.FlowDirection
    set = c.SetFlowLayoutGrowthDirection or c.SetAuraLayoutGrowthDirection
    if set and FD then set(c, FD.Right, FD.Up) end

    local size = IconSize()
    local ok, err
    for key, filter in pairs(GROUPS) do
        ok, err = pcall(c.AddAuraGroup, c, key, filter, {
            maxFrameCount = 0,
            sortMethod = AuraContainerSortMethod and AuraContainerSortMethod.Default,
            sortDirection = AuraContainerSortDirection and AuraContainerSortDirection.Normal,
            initializeFrame = InitButton,
            layout = { elementWidth = size, elementHeight = size, elementSpacing = 3, lineSpacing = 3 },
        })
        if not ok then break end
    end
    if not ok then
        -- Said once, so a broken engine call does not just look like "no debuffs".
        if not unavailable then ns.Print("Nameplate debuffs could not start: " .. tostring(err)) end
        unavailable = true
        return
    end
    c.iconSize = size
    plate.debuffs = c
end

-- Shows the group for the current setting and parks the other.
local function SetGroupCounts(c)
    local mine = ns.Enabled("nameplateDebuffsMine")
    pcall(c.SetAuraGroupMaxFrameCount, c, "all", mine and 0 or MAX_ICONS)
    pcall(c.SetAuraGroupMaxFrameCount, c, "mine", mine and MAX_ICONS or 0)
    c.mineOnly = mine
end

local function Unbind(c)
    if c.bound then
        c.bound = nil
        if not pcall(c.SetUnit, c, "none") then pcall(c.SetUnit, c, nil) end
    end
    c:Hide()
end

local function Attach(plate, unit)
    local c = plate.debuffs
    if not c then return end
    if not Enabled() then Unbind(c) return end
    if c.mineOnly ~= (ns.Enabled("nameplateDebuffsMine") and true or false) then SetGroupCounts(c) end
    c:Show()
    c.bound = true
    c:SetUnit(unit)
    c:UpdateAllAuras()
end

-- Icon size follows the plate width.
local function Layout(plate)
    local c = plate.debuffs
    if not c then return end
    c:ClearAllPoints()
    c:SetPoint("BOTTOM", plate.health, "TOP", 0, ns.Get("nameplateFontSize") + 8)
    local size = IconSize()
    if c.iconSize ~= size and c.SetAuraGroupLayout then
        c.iconSize = size
        for key in pairs(GROUPS) do
            pcall(c.SetAuraGroupLayout, c, key,
                { elementWidth = size, elementHeight = size, elementSpacing = 3, lineSpacing = 3 })
        end
    end
    -- Resizing a button is refused while auras are secret (combat); the next
    -- layout pass out of combat catches up.
    for button, applied in pairs(buttons) do
        if applied ~= size and pcall(button.SetSize, button, size, size) then
            buttons[button] = size
        end
    end
end

NP.RegisterModule({
    create = Create,
    layout = Layout,
    attach = Attach,
    detach = function(plate) if plate.debuffs then Unbind(plate.debuffs) end end,
})

ns.RegisterFeature({
    key = "nameplateDebuffs", label = "Debuffs", section = "Nameplates",
    apply = function() if NP.layoutGen then NP.RefreshAll() end end,
})
ns.RegisterFeature({
    key = "nameplateDebuffsMine", label = "Only My Debuffs", section = "Nameplates", default = false,
    requires = "nameplateDebuffs",
    apply = function()
        for _, plate in pairs(NP.plates) do
            local c = plate.debuffs
            if c and c.bound then
                SetGroupCounts(c)
                c:UpdateAllAuras()
            end
        end
    end,
})

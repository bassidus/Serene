-------------------------------------------------------------------------------
--  Range Coloring -- event based: follows Blizzard's own range and usability
--  refreshes instead of polling. Only usable abilities get the range color;
--  out of mana and unusable keep Blizzard's blue and gray. Icons are only
--  recolored, never the buttons (they are secure). While it is on, the
--  keybind text no longer turns red as well (Keybinds.lua).
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

local enabled                     -- current setting, read by Apply
local buttons = {}                -- [action button] = true
local tinted = {}                 -- [button] = we colored its icon

local function Tint(icon)
    icon:SetVertexColor(1, 0.3, 0.1)
    -- Grayed first, so the tint is not muddied by the icon's own colors.
    icon:SetDesaturated(true)
end

-- Blizzard's own look for the button's usable state (ActionButton UpdateUsable).
local function Restore(btn, icon)
    tinted[btn] = nil
    icon:SetDesaturated(false)
    local usable, noMana = C_ActionBar.IsUsableAction(btn.action)
    if Clean(usable) then
        icon:SetVertexColor(1, 1, 1)
    elseif Clean(noMana) then
        icon:SetVertexColor(0.5, 0.5, 1)
    else
        icon:SetVertexColor(0.4, 0.4, 0.4)
    end
end

-- oor: out of range. repainted: Blizzard just set the usable color itself.
local function Color(btn, oor, repainted)
    local icon = btn.icon
    if not btn.action then return end
    if enabled and oor and Clean(C_ActionBar.IsUsableAction(btn.action)) then
        Tint(icon)
        tinted[btn] = true
    elseif tinted[btn] then
        if repainted then
            tinted[btn] = nil
            icon:SetDesaturated(false)
        else
            Restore(btn, icon)
        end
    end
end

local function OutOfRange(btn)
    return Clean(C_ActionBar.IsActionInRange(btn.action)) == false
end

-- After Blizzard's usability repaint (which resets the icon color).
local function OnUsable(btn)
    if not (enabled or tinted[btn]) then return end
    Color(btn, enabled and OutOfRange(btn), true)
end

-- Blizzard's range event: fires per button when it goes in or out of range.
local function OnRange(btn, checksRange, inRange)
    if not buttons[btn] or not (enabled or tinted[btn]) then return end
    checksRange, inRange = Clean(checksRange), Clean(inRange)
    Color(btn, checksRange and inRange == false)
end

local function Register(btn)
    if buttons[btn] or not btn.icon then return end
    buttons[btn] = true
    hooksecurefunc(btn, "UpdateUsable", OnUsable)
end

hooksecurefunc(ActionBarButtonEventsFrame, "RegisterFrame", function(_, btn) Register(btn) end)
hooksecurefunc("ActionButton_UpdateRangeIndicator", OnRange)

-------------------------------------------------------------------------------
--  Pet bar -- Blizzard repaints every pet icon on its own range timer, so the
--  color goes on right after each pass.
-------------------------------------------------------------------------------
local petTinted = {}  -- [index] = true

local function PetUpdate(bar)
    if not enabled and not next(petTinted) then return end
    for index, btn in pairs(bar.actionButtons) do
        local icon = btn.icon
        if icon then
            local _, _, _, _, _, _, _, checksRange, inRange = GetPetActionInfo(index)
            local oor = Clean(checksRange) and Clean(inRange) == false
            local usable = Clean(GetPetActionSlotUsable(index))
            if enabled and oor and usable then
                Tint(icon)
                petTinted[index] = true
            elseif petTinted[index] then
                petTinted[index] = nil
                icon:SetDesaturated(false)
                if usable then icon:SetVertexColor(1, 1, 1) else icon:SetVertexColor(0.4, 0.4, 0.4) end
            end
        end
    end
end

hooksecurefunc(PetActionBar, "Update", PetUpdate)

-------------------------------------------------------------------------------
local function Apply()
    enabled = ns.Get("rangeColors")
    ActionBarButtonEventsFrame:ForEachFrame(Register)
    for btn in pairs(buttons) do
        if enabled or tinted[btn] then Color(btn, enabled and OutOfRange(btn)) end
    end
    if PetHasActionBar() then PetUpdate(PetActionBar) end
    -- The keybind text stops turning red while the icon shows range.
    ns.RefreshKeybinds()
end

local SECTION = "Action Bars"

-- Loads after Keybinds.lua, so this comes last under Settings (Zoom button
-- icons from BarExtras.lua sits beside it).
ns.RegisterFeature({
    key = "rangeColors", label = "Enable out of range color", section = SECTION, category = "Settings", apply = Apply,
})

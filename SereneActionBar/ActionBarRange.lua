-------------------------------------------------------------------------------
--  Range Coloring -- event based: follows Blizzard's own range and usability
--  refreshes instead of polling. Only usable abilities get the range color;
--  out of mana and unusable keep Blizzard's blue and gray. Quest items in the
--  tracker get it too. Icons are only recolored, never the buttons (they are
--  secure). While it is on, the keybind text no longer turns red as well
--  (Keybinds.lua).
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
--  Quest tracker items -- Blizzard checks their range on its own timer and
--  repaints the range dot (HotKey) after each check, so the icon follows that.
-------------------------------------------------------------------------------
local items = {}       -- [item button] = true
local itemTinted = {}  -- [item button] = true

local function ItemColor(btn)
    if not (enabled or itemTinted[btn]) then return end
    local index = btn:GetAttribute("questLogIndex")
    if enabled and Clean(IsQuestLogSpecialItemInRange(index)) == 0 then
        Tint(btn.icon)
        itemTinted[btn] = true
    elseif itemTinted[btn] then
        itemTinted[btn] = nil
        btn.icon:SetDesaturated(false)
        -- Blizzard's own look (UpdateCooldown): gray while the cooldown waits to start.
        local _, duration, enable = GetQuestLogSpecialItemCooldown(index)
        if Clean(duration) and duration > 0 and Clean(enable) == 0 then
            btn.icon:SetVertexColor(0.4, 0.4, 0.4)
        else
            btn.icon:SetVertexColor(1, 1, 1)
        end
    end
end

local function RegisterItem(btn)
    if items[btn] or not btn.HotKey then return end  -- the find group button has no HotKey
    items[btn] = true
    hooksecurefunc(btn.HotKey, "SetVertexColor", function() ItemColor(btn) end)
    hooksecurefunc(btn.HotKey, "Hide", function() ItemColor(btn) end)
    -- It resets the icon color.
    hooksecurefunc(btn, "UpdateCooldown", ItemColor)
end

-- Item buttons come from a pool shared by the tracker, so they are picked up
-- as the quest tracker hands them out.
hooksecurefunc(QuestObjectiveTracker, "GetRightEdgeFrame", function(tracker)
    for _, frame in pairs(tracker.usedRightEdgeFrames) do RegisterItem(frame) end
end)

-------------------------------------------------------------------------------
local function Apply()
    enabled = ns.Get("rangeColors")
    ActionBarButtonEventsFrame:ForEachFrame(Register)
    for btn in pairs(buttons) do
        if enabled or tinted[btn] then Color(btn, enabled and OutOfRange(btn)) end
    end
    if PetHasActionBar() then PetUpdate(PetActionBar) end
    for btn in pairs(items) do
        if btn:IsShown() or itemTinted[btn] then ItemColor(btn) end
    end
    -- The keybind text stops turning red while the icon shows range.
    ns.RefreshKeybinds()
end

-- Its setting is registered with the keybind ones (Keybinds.lua).
ns.ApplyRangeColors = Apply

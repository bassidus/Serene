-------------------------------------------------------------------------------
--  Edit Mode Layout For New Characters -- at login, a character still on one
--  of Blizzard's preset layouts gets the chosen account layout, once. One
--  that picks a preset again later keeps it. Choosing a layout in the
--  options switches the current character every time.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Action Bars"

-- activeLayout counts Blizzard's presets (Modern, Classic, Gamepad) first;
-- C_EditMode.GetLayouts().layouts holds only the saved layouts after them.
local PRESETS = Enum.EditModePresetLayoutsMeta.NumValues

local function AccountLayouts()
    local list = {}
    for i, layout in ipairs(C_EditMode.GetLayouts().layouts) do
        if layout.layoutType == Enum.EditModeLayoutType.Account then
            list[#list + 1] = { index = PRESETS + i, name = layout.layoutName }
        end
    end
    return list
end

-- False when the layout no longer exists.
local function Switch(name)
    for _, layout in ipairs(AccountLayouts()) do
        if layout.name == name then
            if C_EditMode.GetLayouts().activeLayout ~= layout.index then
                C_EditMode.SetActiveLayout(layout.index)
                ns.Print("Edit Mode layout set to " .. name .. ".")
            end
            return true
        end
    end
    return false
end

-- The first run is the login one (the layouts are in by then); every later
-- run is a change in the options. A layout that no longer exists leaves the
-- character for a later login.
local loggedIn = false

local function Apply()
    local atLogin = not loggedIn
    loggedIn = true
    local name = ns.Get("editModeLayout")
    if not name or InCombatLockdown() then return end
    SereneDB.editModeLayoutDone = SereneDB.editModeLayoutDone or {}
    local done, me = SereneDB.editModeLayoutDone, UnitName("player")
    if atLogin and (done[me] or C_EditMode.GetLayouts().activeLayout > PRESETS) then
        done[me] = true
        return
    end
    if Switch(name) then done[me] = true end
end

ns.RegisterFeature({
    key = "editModeLayout", label = "Edit Mode layout", section = SECTION,
    category = "New characters", type = "dropdown", default = false, space = true,
    apply = Apply,
    options = function()
        local list = { { value = false, label = "None" } }
        for _, layout in ipairs(AccountLayouts()) do
            list[#list + 1] = { value = layout.name, label = layout.name }
        end
        return list
    end,
})
ns.SetOutro(SECTION, "The ticked bars are turned on for every character at each login, so new characters start out with them.\n"
    .. "A new character that hasn't chosen an Edit Mode layout yet switches to the one selected above automatically.")

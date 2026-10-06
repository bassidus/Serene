-------------------------------------------------------------------------------
--  Serene -- lightweight quality-of-life tools for WoW Forever.
--  This addon holds the shared helpers, the feature registry,
--  SavedVariables and /serene; the features live in the Serene* addons,
--  which reach it through the global Serene. Each feature file calls
--  ns.RegisterFeature, and the options window lists them in registration
--  order.
-------------------------------------------------------------------------------
local ADDON, ns = ...
Serene = ns

ns.features = {}
ns.featureByKey = {}

-- def fields:
--   key        SereneDB key
--   label      display name
--   section    options page; none for a setting the window places itself
--   category   heading on its page; categories keep their first-seen order
--   tooltip    help text under the category's "?" (on hover without a category)
--   apply      fn run at login and on every change
--   type       "boolean" (default) | "dropdown" | "slider" | "color" | "outline"
--              | "custom"
--   default    initial value
--   options    dropdown: fn returning { { value =, label = }, ... }
--   preview    dropdown: draw entries in their own font
--   hideLabel  dropdown: no label above the button (still named in the help)
--   min, max, step, suffix   slider
--   build      custom: fn(parent) returning a frame of fixed height with a
--              Refresh(), e.g. the Performance page's addon list
--   specials   color: { { value =, label =, tooltip =, swatch = }, ... } before
--              the palette; swatch returns the hex(es) the word stands for
--   blizzard   outline: fn returning Blizzard's own flags, shown on "default"
--   note       text always shown under the control
--   space      an empty row above the control
--   open       on a category's first setting: the category starts open
--   beside     on a category's first setting: that category goes right of the
--              previous one at half width; otherwise: right of the previous setting
--   button     a plain button with this text in place of the field
--   requires   key (or list) of booleans; dimmed and locked while any is off
--              ("!key": while it is on)
--   addon      the Serene* addon that does the work; locked while not loaded
--   group, pos set by RegisterFontSettings / RegisterPositionSettings
function ns.RegisterFeature(def)
    def.type = def.type or "boolean"
    if def.default == nil and def.type == "boolean" then def.default = true end
    ns.features[#ns.features + 1] = def
    ns.featureByKey[def.key] = def
    -- Addons loading after this one register once SereneDB exists.
    if SereneDB and SereneDB[def.key] == nil then SereneDB[def.key] = def.default end
end

-- Registers X and Y offsets ("<prefix>OffsetX", "<prefix>OffsetY", slider
-- settings) as one pair: the options window shows a button that opens a pad
-- with what they count from drawn to scale and a dot to drag around.
-- def = { prefix =, label = the pad's title, section =, category =, apply =,
--         tooltip =, requires = see RegisterFeature,
--         x = { min, max, default }, y = { min, max, default },
--         box = { left, right, bottom, top } what the offsets count from, in
--         their own units, e.g. a button's { -18, 18, -18, 18 } around its middle,
--         button = the button's text (default "Position"),
--         scale = pixels per step on the pad (default 2) }
function ns.RegisterPositionSettings(def)
    local pos = { label = def.label, box = def.box, button = def.button or "Position", scale = def.scale or 2 }
    for _, axis in ipairs({ "x", "y" }) do
        local range = def[axis]
        pos[axis] = {
            key = def.prefix .. "Offset" .. axis:upper(), label = def.label, tooltip = def.tooltip,
            section = def.section, category = def.category, type = "slider",
            min = range[1], max = range[2], step = 1, default = range[3],
            requires = def.requires, apply = def.apply, pos = pos,
        }
        ns.RegisterFeature(pos[axis])
    end
end

-- A short text at the top of a settings page, above its categories.
ns.pageIntros = {}
function ns.SetPageIntro(section, text)
    ns.pageIntros[section] = text
end

function ns.Get(key)
    local v = SereneDB[key]
    if v ~= nil then return v end
    local f = ns.featureByKey[key]
    return f and f.default
end

function ns.Enabled(key)
    return SereneDB[key]
end

-- The one write path: stores the value, applies the feature and refreshes
-- the options window.
function ns.SetValue(key, value)
    SereneDB[key] = value
    local f = ns.featureByKey[key]
    if f and f.apply then f.apply() end
    if ns.RefreshOptions then ns.RefreshOptions() end
end

-- AddShiftSkip("auto loot") joins the "Hold Shift to skip ..." line in the
-- options window's footer.
ns.shiftSkips = {}
function ns.AddShiftSkip(what)
    ns.shiftSkips[#ns.shiftSkips + 1] = what
end

-- Extra state a feature wants cleared by Restore defaults (e.g. a moved
-- frame's spot); fn runs before the features re-apply. section: the
-- options page whose own reset also runs it.
ns.resetHooks = {}
function ns.OnReset(fn, section)
    ns.resetHooks[#ns.resetHooks + 1] = { fn = fn, section = section }
end

-- State that is not an option, which only /serene reset puts back (e.g.
-- the minimap icon's spot); fn runs after the options are reset.
ns.resetAllHooks = {}
function ns.OnResetAll(fn)
    ns.resetAllHooks[#ns.resetAllHooks + 1] = fn
end

-- Puts every option back to its default, or with a section only the
-- options on that page. Window state and the minimap icon's spot are not
-- options and stay (see ns.ResetAll). quiet: no message in chat.
function ns.ResetDefaults(section, quiet)
    local function Included(s) return not section or s == section end
    for _, f in ipairs(ns.features) do
        if Included(f.section) then SereneDB[f.key] = f.default end
    end
    for _, hook in ipairs(ns.resetHooks) do
        if Included(hook.section) then hook.fn() end
    end
    for _, f in ipairs(ns.features) do
        if Included(f.section) and f.apply then f.apply() end
    end
    if ns.RefreshOptions then ns.RefreshOptions() end
    if quiet then return end
    if section then
        ns.Print(section .. " options are back to their defaults.")
    else
        ns.Print("All options are back to their defaults.")
    end
end

-- /serene reset: every option, the options window's spot, size, page and
-- open categories (SereneOptions, which is load on demand, so cleared here)
-- and the ns.OnResetAll state.
function ns.ResetAll()
    ns.ResetDefaults(nil, true)
    SereneDB.optionsWindow, SereneDB.optionsPage, SereneDB.optionsOpen = nil, nil, nil
    for _, fn in ipairs(ns.resetAllHooks) do fn() end
    ns.Print("Everything is back to its defaults, the options window and the minimap icon too.")
end

-- The TOCs name the same file in ## IconTexture (art/logo.svg is the source).
ns.LOGO = "Interface\\AddOns\\Serene\\Media\\Logo"
-- The logo's orange: the options window's accent, the chat prefix and the
-- minimap tooltip's title.
ns.ACCENT = { 1, 0.42, 0.16 }

-------------------------------------------------------------------------------
--  Colors -- a color setting holds a 6-digit hex ("ff4d1a") or one of its
--  feature's special words ("class", "default"...).
-------------------------------------------------------------------------------
ns.PALETTE = {
    { hex = "ffffff", label = "White" },
    { hex = "999999", label = "Gray" },
    { hex = "595959", label = "Dark gray" },
    { hex = "ffd100", label = "Gold" },
    { hex = "ff991a", label = "Orange" },
    { hex = "ff4d1a", label = "Red" },
    { hex = "ff69b4", label = "Pink" },
    { hex = "a335ee", label = "Purple" },
    { hex = "3b8cff", label = "Blue" },
    { hex = "33ddee", label = "Cyan" },
    { hex = "40d940", label = "Green" },
}

-- The hex a color value stands for, or nil for a special word.
function ns.ColorHex(value)
    return type(value) == "string" and value:match("^%x%x%x%x%x%x$") or nil
end

function ns.ColorRGB(value)
    local hex = ns.ColorHex(value)
    if not hex then return nil end
    return tonumber(hex:sub(1, 2), 16) / 255, tonumber(hex:sub(3, 4), 16) / 255, tonumber(hex:sub(5, 6), 16) / 255
end

function ns.RGBToHex(r, g, b)
    return string.format("%02x%02x%02x", math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5),
        math.floor(b * 255 + 0.5))
end

function ns.PlayerClassHex()
    local _, class = UnitClass("player")
    local c = RAID_CLASS_COLORS[class]
    return ns.RGBToHex(c.r, c.g, c.b)
end

-- A value from the game, or nil when it is secret or otherwise unreadable.
function ns.Clean(v)
    if issecretvalue(v) or not canaccessvalue(v) then return nil end
    return v
end

function ns.Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage(CreateColor(unpack(ns.ACCENT)):WrapTextInColorCode("Serene:") .. " " .. msg)
end

-------------------------------------------------------------------------------
--  /serene opens or closes the options window. The window lives in the
--  load-on-demand SereneOptions, which sets ns.ToggleOptionsWindow.
--  /serene reset puts everything back to its defaults (ns.ResetAll).
-------------------------------------------------------------------------------
function ns.ToggleOptions()
    if not ns.ToggleOptionsWindow then
        if InCombatLockdown() then
            ns.Print("Cannot open options during combat.")
            return
        end
        C_AddOns.LoadAddOn("SereneOptions")
        if not ns.ToggleOptionsWindow then
            ns.Print("SereneOptions is not installed or is disabled.")
            return
        end
    end
    ns.ToggleOptionsWindow()
end

SLASH_SERENE1 = "/serene"
SlashCmdList["SERENE"] = function(msg)
    if strtrim(msg):lower() ~= "reset" then
        ns.ToggleOptions()
    elseif InCombatLockdown() then
        ns.Print("Cannot reset during combat.")
    else
        ns.ResetAll()
    end
end

-------------------------------------------------------------------------------
--  Init -- features also register from the addons that load after this one,
--  so defaults are filled in again at login, before anything applies.
-------------------------------------------------------------------------------
local function FillDefaults()
    for _, f in ipairs(ns.features) do
        if SereneDB[f.key] == nil then SereneDB[f.key] = f.default end
    end
end

local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_LOGIN")
init:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        if addonName ~= ADDON then return end
        self:UnregisterEvent("ADDON_LOADED")
        SereneDB = SereneDB or {}
        FillDefaults()
        return
    end
    self:UnregisterEvent("PLAYER_LOGIN")
    FillDefaults()
    for _, f in ipairs(ns.features) do
        if f.apply then f.apply() end
    end
end)

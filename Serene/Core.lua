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
--   sub        a subgroup heading inside the category, a frame of its own
--              that opens and closes; keep a subgroup's settings together
--   apply      fn run at login and on every change
--   type       "boolean" (default) | "dropdown" | "slider" | "color" | "outline"
--              | "button" (no value: `button` is its text, `click` runs on a press)
--   default    initial value
--   options    dropdown: fn returning { { value =, label = }, ... }
--   preview    dropdown: draw entries in their own font
--   hideLabel  dropdown: no label above the button
--   inline     dropdown: the label on the left, the button in the right half
--   min, max, step, suffix   slider
--   specials   color: { { value =, label =, swatch = }, ... } before
--              the palette; swatch returns the hex(es) the word stands for
--   blizzard   outline: fn returning Blizzard's own flags, shown on "default"
--   note       text always shown under the control
--   space      an empty row above the control
--   closed     on a category's (or subgroup's) first setting: it starts closed
--   beside     on a category's first setting: that category goes right of the
--              previous one at half width; otherwise: right of the previous
--              setting
--   button     a plain button with this text in place of the field
--   requires   key (or list) of booleans; dimmed and locked while any is off
--              ("!key": while it is on)
--   addon      the Serene* addon that does the work; locked while not loaded
--   group      set by RegisterFontSettings
function ns.RegisterFeature(def)
    def.type = def.type or "boolean"
    if def.default == nil and def.type == "boolean" then def.default = true end
    ns.features[#ns.features + 1] = def
    ns.featureByKey[def.key] = def
end

-- A setting's value; its default until it is set.
function ns.Get(key)
    local v = SereneDB[key]
    if v ~= nil then return v end
    local f = ns.featureByKey[key]
    return f and f.default
end

-- The one write path: stores the value, applies the feature and refreshes
-- the options window.
function ns.SetValue(key, value)
    local f = ns.featureByKey[key]
    SereneDB[key] = value
    if f and f.apply then f.apply() end
    if ns.RefreshOptions then ns.RefreshOptions() end
end

-- AddShiftSkip("auto loot") joins the "Hold Shift to skip ..." line in the
-- options window's footer.
ns.shiftSkips = {}
function ns.AddShiftSkip(what)
    ns.shiftSkips[#ns.shiftSkips + 1] = what
end

-- Dark mode, the checkbox in the options window's footer: the action bar
-- art and the unit frames go dark. An addon with something to darken
-- passes its redraw here.
local darkModeHooks = {}
function ns.OnDarkMode(fn)
    darkModeHooks[#darkModeHooks + 1] = fn
end

ns.RegisterFeature({
    key = "darkMode", label = "Dark mode",
    apply = function() for _, fn in ipairs(darkModeHooks) do fn() end end,
})

-- Extra state a feature wants cleared by Restore defaults (e.g. a moved
-- frame's spot); fn runs before the features re-apply.
ns.resetHooks = {}
function ns.OnReset(fn)
    ns.resetHooks[#ns.resetHooks + 1] = fn
end

-- State that is not an option, which only /serene reset puts back (e.g.
-- the minimap icon's spot); fn runs after the options are reset.
ns.resetAllHooks = {}
function ns.OnResetAll(fn)
    ns.resetAllHooks[#ns.resetAllHooks + 1] = fn
end

-- Puts every option back to its default. Window state and the minimap
-- icon's spot are not options and stay (see ns.ResetAll). quiet: no
-- message in chat.
function ns.ResetDefaults(quiet)
    for _, f in ipairs(ns.features) do SereneDB[f.key] = f.default end
    for _, fn in ipairs(ns.resetHooks) do fn() end
    for _, f in ipairs(ns.features) do
        if f.apply then f.apply() end
    end
    if ns.RefreshOptions then ns.RefreshOptions() end
    if not quiet then ns.Print("All options are back to their defaults.") end
end

-- /serene reset: every option, the options window's spot and size
-- (SereneOptions, which is load on demand, so cleared here) and the
-- ns.OnResetAll state.
function ns.ResetAll()
    ns.ResetDefaults(true)
    SereneDB.optionsWindow = nil
    for _, fn in ipairs(ns.resetAllHooks) do fn() end
    ns.Print("Everything is back to its defaults, the options window and the minimap icon too.")
end

-- The quest green of the nameplates' quest marks (SereneNameplates), whose
-- settings SereneQuests registers.
ns.QUEST_GREEN = "28da79"

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
    { hex = "ffff00", label = "Yellow" },
    { hex = "ffd100", label = "Gold" },
    { hex = "ff991a", label = "Orange" },
    { hex = "ff4d1a", label = "Red" },
    { hex = "ff0000", label = "Bright red" },
    { hex = "ff69b4", label = "Pink" },
    { hex = "a335ee", label = "Purple" },
    { hex = "3b8cff", label = "Blue" },
    { hex = "0faac8", label = "Teal" },
    { hex = "33ddee", label = "Cyan" },
    { hex = "40d940", label = "Green" },
    { hex = "00ff00", label = "Bright green" },
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

-- Hides a Blizzard region with alpha 0 and keeps it hidden: Blizzard keeps
-- calling Show and SetAlpha on its own art, so every alpha it sets is put
-- back to 0 right after. Off hands the region back at alpha 1.
local hiddenRegions, alphaHooked = {}, {}
local settingAlpha  -- set while we change an alpha, so our own call is not taken for Blizzard's

function ns.SetHidden(region, on)
    if not region then return end
    if on then
        if not alphaHooked[region] then
            alphaHooked[region] = true
            hooksecurefunc(region, "SetAlpha", function(self)
                if hiddenRegions[self] and not settingAlpha then
                    settingAlpha = true
                    self:SetAlpha(0)
                    settingAlpha = nil
                end
            end)
        end
        hiddenRegions[region] = true
        settingAlpha = true
        region:SetAlpha(0)
        settingAlpha = nil
    elseif hiddenRegions[region] then
        hiddenRegions[region] = nil
        settingAlpha = true
        region:SetAlpha(1)
        settingAlpha = nil
    end
end

-- A 1px border inside frame; returns its four edges for ns.SetBorderColor.
function ns.Border(frame, c)
    local edges = {}
    for i = 1, 4 do
        edges[i] = frame:CreateTexture(nil, "BORDER")
        edges[i]:SetColorTexture(c[1], c[2], c[3], c[4] or 1)
    end
    edges[1]:SetPoint("TOPLEFT"); edges[1]:SetPoint("TOPRIGHT"); edges[1]:SetHeight(1)
    edges[2]:SetPoint("BOTTOMLEFT"); edges[2]:SetPoint("BOTTOMRIGHT"); edges[2]:SetHeight(1)
    edges[3]:SetPoint("TOPLEFT"); edges[3]:SetPoint("BOTTOMLEFT"); edges[3]:SetWidth(1)
    edges[4]:SetPoint("TOPRIGHT"); edges[4]:SetPoint("BOTTOMRIGHT"); edges[4]:SetWidth(1)
    return edges
end

function ns.SetBorderColor(edges, c)
    for _, e in ipairs(edges) do e:SetColorTexture(c[1], c[2], c[3], c[4] or 1) end
end

-- text in GameTooltip at the cursor for a second, e.g. a new size while
-- Ctrl + scroll changes it.
local flashTimer
function ns.FlashTip(owner, text)
    GameTooltip:SetOwner(owner, "ANCHOR_CURSOR")
    GameTooltip:SetText(text, 1, 1, 1)
    GameTooltip:Show()
    if flashTimer then flashTimer:Cancel() end
    flashTimer = C_Timer.NewTimer(1, function()
        flashTimer = nil
        if GameTooltip:IsOwned(owner) then GameTooltip:Hide() end
    end)
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
--  Init -- every feature applies at login, once all the addons that register
--  them have loaded. ns.Get stands in a default for a setting never set.
-------------------------------------------------------------------------------
local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_LOGIN")
init:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        if addonName ~= ADDON then return end
        self:UnregisterEvent("ADDON_LOADED")
        SereneDB = SereneDB or {}
        return
    end
    self:UnregisterEvent("PLAYER_LOGIN")
    for _, f in ipairs(ns.features) do
        if f.apply then f.apply() end
    end
end)

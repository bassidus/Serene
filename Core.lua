-------------------------------------------------------------------------------
--  Serene -- lightweight quality-of-life tools for WoW Forever.
--  Core: shared helpers, the feature registry, SavedVariables and /serene.
--  Each feature file calls ns.RegisterFeature; the options window lists
--  them in TOC order.
-------------------------------------------------------------------------------
local ADDON, ns = ...

ns.features = {}
ns.featureByKey = {}

-- def = { key = SereneDB key, label = display name, section = options page,
--         tooltip = help text, apply = optional fn run on login and change,
--         type = "boolean" (default) | "dropdown" | "slider" | "color" | "outline",
--         default = initial value,
--         options = fn returning { { value =, label = }, ... } (dropdown),
--         preview = true to draw dropdown entries in their own font (dropdown),
--         min, max, step (slider),
--         specials = { { value =, label =, tooltip = }, ... } choices shown before the
--         palette, e.g. "Class color" (color; the value is a word, not a hex),
--         blizzard = fn returning Blizzard's own outline as a flag set, shown
--         while the value is "default" (outline),
--         requires = key of a boolean setting, or a list of them; the control
--         is dimmed and locked while any is off }
function ns.RegisterFeature(def)
    def.type = def.type or "boolean"
    if def.default == nil and def.type == "boolean" then def.default = true end
    ns.features[#ns.features + 1] = def
    ns.featureByKey[def.key] = def
end

-- Options pages that are not a list of settings (e.g. Performance). build(page)
-- fills the page frame on first open and may set page.contentHeight; these
-- tabs follow the feature sections in the sidebar.
ns.pages = {}
function ns.RegisterPage(name, build)
    ns.pages[#ns.pages + 1] = { name = name, build = build }
end

function ns.Get(key)
    local v = SereneDB and SereneDB[key]
    if v ~= nil then return v end
    local f = ns.featureByKey[key]
    return f and f.default
end

function ns.Enabled(key)
    return SereneDB and SereneDB[key]
end

-- The one write path: stores the value, applies the feature and refreshes
-- the options window.
function ns.SetValue(key, value)
    SereneDB[key] = value
    local f = ns.featureByKey[key]
    if f and f.apply then f.apply() end
    if ns.RefreshOptions then ns.RefreshOptions() end
end

-- Extra state a feature wants cleared by Reset Defaults (e.g. a moved
-- frame's spot); fn runs before the features re-apply.
ns.resetHooks = {}
function ns.OnReset(fn)
    ns.resetHooks[#ns.resetHooks + 1] = fn
end

-- Puts every option back to its default. Window state, the minimap icon's
-- spot and the Performance sort are not options and stay.
function ns.ResetDefaults()
    for _, f in ipairs(ns.features) do SereneDB[f.key] = f.default end
    for _, fn in ipairs(ns.resetHooks) do fn() end
    for _, f in ipairs(ns.features) do
        if f.apply then f.apply() end
    end
    if ns.RefreshOptions then ns.RefreshOptions() end
    ns.Print("All options are back to their defaults.")
end

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

-- A value from the game, or nil when it is secret or otherwise unreadable.
local issecret, canaccess = issecretvalue, canaccessvalue
function ns.Clean(v)
    if issecret and issecret(v) then return nil end
    if canaccess and not canaccess(v) then return nil end
    return v
end

function ns.Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff7fd1c7Serene:|r " .. msg)
end

function ns.CoinString(amount)
    if C_CurrencyInfo and C_CurrencyInfo.GetCoinTextureString then
        return C_CurrencyInfo.GetCoinTextureString(amount)
    end
    return GetCoinTextureString(amount)
end

-------------------------------------------------------------------------------
--  /serene opens or closes the options window.
-------------------------------------------------------------------------------
SLASH_SERENE1 = "/serene"
SlashCmdList["SERENE"] = function()
    if ns.ToggleOptions then ns.ToggleOptions() end
end

-------------------------------------------------------------------------------
--  Init -- ADDON_LOADED fires after every file of this addon has run, so the
--  registry is complete by then.
-------------------------------------------------------------------------------
local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_LOGIN")
init:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" then
        if addonName ~= ADDON then return end
        self:UnregisterEvent("ADDON_LOADED")
        SereneDB = SereneDB or {}
        for _, f in ipairs(ns.features) do
            if SereneDB[f.key] == nil then SereneDB[f.key] = f.default end
        end
        return
    end
    self:UnregisterEvent("PLAYER_LOGIN")
    for _, f in ipairs(ns.features) do
        if f.apply then f.apply() end
    end
end)

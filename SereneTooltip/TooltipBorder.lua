-------------------------------------------------------------------------------
--  Tooltip Border -- hides the frame around tooltips and sets how see-through
--  their background is. Border and background share one NineSlice, so to
--  hide the border the whole NineSlice is faded out (alpha only, never Hide)
--  and a flat background, tinted like the NineSlice's center, takes its
--  place. Opacity scales only the background; 100% is Blizzard's normal.
--  The "Equipped" tab above comparison tooltips gets the same flat look.
--  Also hides the health bar under unit tooltips.
-------------------------------------------------------------------------------
local _, ns = ...

local TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "EmbeddedItemTooltip", "FriendsTooltip", "GameSmallHeaderTooltip", "QuickKeybindTooltip",
}

local backgrounds = setmetatable({}, { __mode = "k" })
local faded = setmetatable({}, { __mode = "k" })  -- tooltips whose NineSlice we hid
local dimmed = setmetatable({}, { __mode = "k" }) -- tooltips whose center we made see-through

local function Opacity()
    return ns.Get("tooltipBgOpacity") / 100
end

-- The compare tab's framed atlas is its only texture and has no parentKey.
local function TabArt(header)
    for _, region in ipairs({ header:GetRegions() }) do
        if region:IsObjectType("Texture") then return region end
    end
end

local function StyleTab(header, flat, r, g, b, a, opacity)
    local art = TabArt(header)
    if not art then return end
    if flat then
        local bg = backgrounds[header]
        if not bg then
            bg = header:CreateTexture(nil, "BACKGROUND", nil, -8)
            -- Stops at the tooltip's edge so the 1px overlap is not dimmed twice.
            bg:SetPoint("TOPLEFT")
            bg:SetPoint("BOTTOMRIGHT", 0, 1)
            backgrounds[header] = bg
        end
        bg:SetColorTexture(r, g, b, a)
        bg:SetAlpha(opacity)
        bg:Show()
        art:SetAlpha(0)
    else
        art:SetAlpha(1)
        if backgrounds[header] then backgrounds[header]:Hide() end
    end
end

local function Style(tt)
    if not tt or (tt.IsForbidden and tt:IsForbidden()) then return end
    local nine = tt.NineSlice
    if not nine then return end
    local opacity = Opacity()
    if ns.Enabled("tooltipHideBorder") then
        local bg = backgrounds[tt]
        if not bg then
            bg = tt:CreateTexture(nil, "BACKGROUND", nil, -8)
            bg:SetAllPoints()
            backgrounds[tt] = bg
        end
        local r, g, b, a = 0.09, 0.09, 0.19, 0.9
        if nine.Center then r, g, b, a = nine.Center:GetVertexColor() end
        bg:SetColorTexture(r, g, b, a)
        bg:SetAlpha(opacity)
        bg:Show()
        nine:SetAlpha(0)
        faded[tt] = true
        if tt.CompareHeader then StyleTab(tt.CompareHeader, true, r, g, b, a, opacity) end
    elseif faded[tt] then
        -- Off: only tooltips we changed need undoing, once.
        faded[tt] = nil
        nine:SetAlpha(1)
        if backgrounds[tt] then backgrounds[tt]:Hide() end
        if tt.CompareHeader then StyleTab(tt.CompareHeader, false) end
    end
    -- Only touched once it is off 100%, and put back once when it returns.
    if nine.Center and (opacity < 1 or dimmed[tt]) then
        nine.Center:SetAlpha(opacity)
        dimmed[tt] = opacity < 1 or nil
    end
end

for _, name in ipairs(TOOLTIPS) do
    local tt = _G[name]
    if tt and tt.HookScript then tt:HookScript("OnShow", Style) end
end

-- Catches other tooltips and re-styles after Blizzard changes the backdrop.
-- Deferred: this can run inside secure Blizzard code, which must not carry
-- our changes in the same call stack. One timer per frame serves every
-- tooltip restyled in it.
local queued = {}
local function Flush()
    for tt in pairs(queued) do
        queued[tt] = nil
        Style(tt)
    end
end
if SharedTooltip_SetBackdropStyle then
    hooksecurefunc("SharedTooltip_SetBackdropStyle", function(tt)
        if not tt or not (ns.Enabled("tooltipHideBorder") or faded[tt] or dimmed[tt] or Opacity() < 1) then
            return
        end
        if not next(queued) then C_Timer.After(0, Flush) end
        queued[tt] = true
    end)
end

local function Apply()
    for _, name in ipairs(TOOLTIPS) do Style(_G[name]) end
end

-- The health bar is hidden with alpha only (never Hide/Show on the bar),
-- re-asserted each time Blizzard shows it.
local function ApplyHealthBar()
    if GameTooltipStatusBar then
        GameTooltipStatusBar:SetAlpha(ns.Enabled("tooltipHealthBar") and 1 or 0)
    end
end

if GameTooltipStatusBar then
    hooksecurefunc(GameTooltipStatusBar, "Show", function(bar)
        if not ns.Enabled("tooltipHealthBar") then bar:SetAlpha(0) end
    end)
end

ns.RegisterFeature({
    key = "tooltipHealthBar", label = "Show health bar", section = "Tooltip", category = "Appearance",
    default = true, apply = ApplyHealthBar,
    tooltip = "The health bar under the tooltips of players, NPCs and mobs.",
})
ns.RegisterFeature({
    key = "tooltipHideBorder", label = "Hide border", section = "Tooltip", category = "Appearance", apply = Apply,
    tooltip = "Removes the frame around tooltips and leaves a flat background.",
})
ns.RegisterFeature({
    key = "tooltipBgOpacity", label = "Background opacity", section = "Tooltip", category = "Appearance",
    type = "slider", space = true,
    min = 0, max = 100, step = 5, default = 90, apply = Apply,
    tooltip = "0 is see-through, 100 is Blizzard's normal background.",
})

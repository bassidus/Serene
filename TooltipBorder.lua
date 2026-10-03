-------------------------------------------------------------------------------
--  Tooltip Border -- hides the frame around tooltips and sets how see-through
--  their background is. Border and background share one NineSlice, so to
--  hide the border the whole NineSlice is faded out (alpha only, never Hide)
--  and a flat background takes its place, colored from the NineSlice's own
--  center so the tooltip keeps its usual tint. Same approach as
--  EllesmereUIBlizzardSkin's tooltip reskin. Opacity scales the background
--  (the NineSlice's center, or the flat one) and leaves the border as is;
--  100% is Blizzard's normal.
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
    elseif faded[tt] then
        -- Off: only tooltips we changed need undoing, once.
        faded[tt] = nil
        nine:SetAlpha(1)
        if backgrounds[tt] then backgrounds[tt]:Hide() end
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

ns.RegisterFeature({
    key = "tooltipHideBorder", label = "Hide Border", section = "Tooltip", apply = Apply,
    tooltip = "Hides the frame around tooltips and keeps a flat background.",
})
ns.RegisterFeature({
    key = "tooltipBgOpacity", label = "Background Opacity", section = "Tooltip", type = "slider",
    min = 0, max = 100, step = 5, default = 90, apply = Apply,
    tooltip = "How solid the tooltip background is, in percent. 100 is Blizzard's normal, 0 leaves only "
        .. "the text (and the border, unless it is hidden).",
})

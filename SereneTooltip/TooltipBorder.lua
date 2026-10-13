-------------------------------------------------------------------------------
--  Tooltip Border -- hides the frame around tooltips and sets how see-through
--  their background is. Border and background share one NineSlice, so to
--  hide the border the whole NineSlice is faded out (alpha only, never Hide)
--  and a flat background, tinted like the NineSlice's center, takes its
--  place. Opacity scales only the background; 100% is Blizzard's normal.
--  The "Equipped" tab above comparison tooltips gets the same flat look.
-------------------------------------------------------------------------------
local _, ns = ...

local TOOLTIPS = { "FriendsTooltip", unpack(ns.TOOLTIPS) }

local backgrounds = {}
local tabEdges = {}  -- compare tab -> its outline's four lines
local faded = {}   -- tooltips whose NineSlice we hid
local dimmed = {}  -- tooltips whose center we made see-through

local function Opacity()
    return ns.Get("tooltipBgOpacity") / 100
end

-- The compare tab's framed atlas is its only texture and has no parentKey.
local function TabArt(header)
    for _, region in ipairs({ header:GetRegions() }) do
        if region:IsObjectType("Texture") then return region end
    end
end

-- Without the framed art the flat tab would melt into whatever is behind it,
-- so it gets a thin outline. The bottom line sits on the tooltip's top edge.
local TAB_EDGE_COLOR = { 0.5, 0.5, 0.5 }

local function TabEdges(header)
    local edges = tabEdges[header]
    if edges then return edges end
    local function Line()
        local t = header:CreateTexture(nil, "BORDER")
        t:SetColorTexture(unpack(TAB_EDGE_COLOR))
        return t
    end
    local top, bottom, left, right = Line(), Line(), Line(), Line()
    top:SetPoint("TOPLEFT")
    top:SetPoint("TOPRIGHT")
    top:SetHeight(1)
    bottom:SetPoint("BOTTOMLEFT", 0, 1)
    bottom:SetPoint("BOTTOMRIGHT", 0, 1)
    bottom:SetHeight(1)
    left:SetPoint("TOPLEFT")
    left:SetPoint("BOTTOMLEFT", 0, 1)
    left:SetWidth(1)
    right:SetPoint("TOPRIGHT")
    right:SetPoint("BOTTOMRIGHT", 0, 1)
    right:SetWidth(1)
    edges = { top, bottom, left, right }
    tabEdges[header] = edges
    return edges
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
        for _, line in ipairs(TabEdges(header)) do line:Show() end
        art:SetAlpha(0)
    else
        art:SetAlpha(1)
        if backgrounds[header] then backgrounds[header]:Hide() end
        if tabEdges[header] then
            for _, line in ipairs(tabEdges[header]) do line:Hide() end
        end
    end
end

local function Style(tt)
    if tt:IsForbidden() then return end
    local nine = tt.NineSlice
    local opacity = Opacity()
    if not ns.Get("tooltipBorder") then
        local bg = backgrounds[tt]
        if not bg then
            bg = tt:CreateTexture(nil, "BACKGROUND", nil, -8)
            bg:SetAllPoints()
            backgrounds[tt] = bg
        end
        local r, g, b, a = nine.Center:GetVertexColor()
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
    if opacity < 1 or dimmed[tt] then
        nine.Center:SetAlpha(opacity)
        dimmed[tt] = opacity < 1 or nil
    end
end

for _, name in ipairs(TOOLTIPS) do _G[name]:HookScript("OnShow", Style) end

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
hooksecurefunc("SharedTooltip_SetBackdropStyle", function(tt)
    if ns.Get("tooltipBorder") and not (faded[tt] or dimmed[tt] or Opacity() < 1) then return end
    if not next(queued) then C_Timer.After(0, Flush) end
    queued[tt] = true
end)

local function Apply()
    for _, name in ipairs(TOOLTIPS) do Style(_G[name]) end
end

ns.RegisterFeature({
    key = "tooltipBgOpacity", label = "Opacity", section = "Tooltip", category = "Appearance",
    type = "slider", beside = true,
    min = 0, max = 100, step = 5, default = 90, apply = Apply,
})
ns.RegisterFeature({
    key = "tooltipBorder", label = "Show border", section = "Tooltip", category = "Appearance", default = false,
    apply = Apply,
})

-------------------------------------------------------------------------------
--  Bar Extras -- gray or dark bar art instead of Forever's bronze, zoomed button
--  icons (their rough edges cropped), and the bags bar and micro menu shown
--  only while the mouse is over them. Those two are only made invisible, so
--  they still answer the mouse.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION = "Action Bars"

-------------------------------------------------------------------------------
--  Zoomed icons: the button's icon texture keeps its crop through texture
--  changes, so it is set once per button.
-------------------------------------------------------------------------------
local BARS = { "ActionButton", "MultiBarBottomLeftButton", "MultiBarBottomRightButton", "MultiBarRightButton",
               "MultiBarLeftButton", "MultiBar5Button", "MultiBar6Button", "MultiBar7Button", "PetActionButton",
               "StanceButton" }
local CROP = 0.08

local function ApplyZoom()
    local c = ns.Enabled("zoomActionIcons") and CROP or 0
    for _, prefix in ipairs(BARS) do
        for i = 1, 12 do
            local btn = _G[prefix .. i]
            if btn then btn.icon:SetTexCoord(c, 1 - c, c, 1 - c) end
        end
    end
end

-------------------------------------------------------------------------------
--  Bar art: Forever's bar art (frame, wyverns, dividers, button rims) is
--  bronze, drawn from these files; desaturated it is the plain gray of the
--  retail bars, and darkened on top of that it recedes behind the icons.
--  The micro menu's sheet also holds its colored icons, so only the button
--  backgrounds there.
-------------------------------------------------------------------------------
local BRONZE = { [7948326] = true, [8154526] = true, [8119721] = true, [8200846] = "ButtonBG" }

local bronze = {}  -- [texture] = true, every bronze texture found

local DARK = 0.22

local function Paint(tex)
    local art = ns.Get("barArt")
    local v = art == "dark" and DARK or 1
    tex:SetDesaturated(art ~= "bronze")
    tex:SetVertexColor(v, v, v)
end

local function Repaint(tex)
    if ns.Get("barArt") ~= "bronze" then Paint(tex) end
end

local function IsBronze(tex)
    local file = BRONZE[tex:GetTexture()]
    if file == true then return true end
    return file and (tex:GetAtlas() or ""):find(file, 1, true) ~= nil
end

local function Collect(frame)
    for _, r in ipairs({ frame:GetRegions() }) do
        if r:GetObjectType() == "Texture" and not bronze[r] and IsBronze(r) then
            bronze[r] = true
            -- Blizzard swaps the atlas on some (a bar's empty-slot rims).
            hooksecurefunc(r, "SetAtlas", Repaint)
        end
    end
    for _, child in ipairs({ frame:GetChildren() }) do Collect(child) end
end

local function ApplyArt()
    if ns.Get("barArt") ~= "bronze" and not next(bronze) then
        for _, frame in ipairs({ MainActionBar, BagsBar, MicroMenuContainer }) do Collect(frame) end
        for _, prefix in ipairs(BARS) do
            for i = 1, 12 do
                local btn = _G[prefix .. i]
                if btn then Collect(btn) end
            end
        end
    end
    for tex in pairs(bronze) do Paint(tex) end
end

-------------------------------------------------------------------------------
--  Mouseover bars
-------------------------------------------------------------------------------
local FADERS = {
    { key = "bagsBarMouseover",  frame = BagsBar },
    { key = "microMenuMouseover", frame = MicroMenuContainer },
}

local watch = CreateFrame("Frame")
local elapsed = 0

local function Refresh()
    for _, f in ipairs(FADERS) do
        ns.SetHidden(f.frame, ns.Enabled(f.key) and not f.frame:IsMouseOver())
    end
end

watch:SetScript("OnUpdate", function(_, dt)
    elapsed = elapsed + dt
    if elapsed < 0.1 then return end
    elapsed = 0
    Refresh()
end)

local function ApplyFaders()
    local any = false
    for _, f in ipairs(FADERS) do any = any or ns.Enabled(f.key) end
    watch:SetShown(any)
    Refresh()
end

ns.RegisterFeature({
    key = "barArt", label = "Bar art", section = SECTION, category = "Look",
    tooltip = "How the bars look",
    type = "dropdown", inline = true, default = "bronze", apply = ApplyArt,
    options = function()
        return {
            { value = "bronze", label = "Bronze" },
            { value = "gray",   label = "Gray" },
            { value = "dark",   label = "Dark" },
        }
    end,
})
ns.RegisterFeature({
    key = "zoomActionIcons", label = "Zoom button icons", section = SECTION, category = "Look",
    default = false, apply = ApplyZoom,
})
ns.RegisterFeature({
    key = "bagsBarMouseover", label = "Bags bar on mouseover", section = SECTION, category = "Look",
    default = false, apply = ApplyFaders,
})
ns.RegisterFeature({
    key = "microMenuMouseover", label = "Micro menu on mouseover", section = SECTION, category = "Look",
    default = false, apply = ApplyFaders,
})

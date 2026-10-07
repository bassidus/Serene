-------------------------------------------------------------------------------
--  Smooth Bars -- health and mana on the player, target, focus, pet and
--  party frames glide to a new value instead of jumping. Targets of targets
--  update every frame, so their bars would only ever snap; they are left
--  out.
--
--  Blizzard's bar can't be animated itself (it is set straight to each new
--  value), so a bar of ours lies on top and follows it: same texture, color,
--  mask and range, but moving with the client's interpolation. Blizzard's
--  fill is hidden with alpha; everything else on its bar (text, heal
--  prediction) stays. When the unit changes, ours jumps instead of gliding
--  from the previous unit's value.
-------------------------------------------------------------------------------
local _, ns = ...

local KEY = "unitFrameSmoothBars"
local SMOOTH = Enum.StatusBarInterpolation.ExponentialEaseOut

local FRAMES = {}
for _, frame in ipairs(ns.UnitFrames()) do
    if frame ~= TargetFrameToT and frame ~= FocusFrameToT then FRAMES[#FRAMES + 1] = frame end
end

local overlays = {}  -- [Blizzard's bar] = our bar
local masked = {}    -- [our bar] = { [mask] = true }
local enabled = {}   -- [Blizzard's bar] = true while ours lies on top

local function Mirror(stock)
    local ov = overlays[stock]
    local src, dst = stock:GetStatusBarTexture(), ov:GetStatusBarTexture()
    local atlas = src:GetAtlas()
    if atlas then dst:SetAtlas(atlas, false) else dst:SetTexture(src:GetTexture()) end
    dst:SetTexCoord(src:GetTexCoord())
    local layer, sub = src:GetDrawLayer()
    dst:SetDrawLayer(layer, math.min((sub or 0) + 1, 7))
    for i = 1, src:GetNumMaskTextures() do
        local mask = src:GetMaskTexture(i)
        if not masked[ov][mask] then
            dst:AddMaskTexture(mask)
            masked[ov][mask] = true
        end
    end
    ov:SetStatusBarDesaturated(stock:IsStatusBarDesaturated())
    -- Not the alpha: once Blizzard's fill is hidden it reads back as 0.
    local r, g, b = stock:GetStatusBarColor()
    ov:SetStatusBarColor(r, g, b)
    ns.SetHidden(src, enabled[stock])
end

-- Straight to Blizzard's current value, without gliding.
local function Snap(stock)
    local ov = overlays[stock]
    ov:SetMinMaxValues(stock:GetMinMaxValues())
    ov:SetValue(stock:GetValue())
end

local function Setup(stock)
    if overlays[stock] then return end
    local ov = CreateFrame("StatusBar", nil, stock)
    ov:SetAllPoints(stock)
    ov:SetFrameLevel(stock:GetFrameLevel())
    ov:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    overlays[stock], masked[ov] = ov, {}

    hooksecurefunc(stock, "SetValue", function(_, value)
        if enabled[stock] then ov:SetValue(value, SMOOTH) end
    end)
    hooksecurefunc(stock, "SetMinMaxValues", function(_, lo, hi)
        if enabled[stock] then ov:SetMinMaxValues(lo, hi) end
    end)
    hooksecurefunc(stock, "SetStatusBarColor", function(_, r, g, b, a)
        if enabled[stock] then ov:SetStatusBarColor(r, g, b, a) end
    end)
    hooksecurefunc(stock, "SetStatusBarDesaturated", function(_, desat)
        if enabled[stock] then ov:SetStatusBarDesaturated(desat) end
    end)
    -- New art (vehicle, Edit Mode) comes as a new texture.
    hooksecurefunc(stock, "SetStatusBarTexture", function()
        if enabled[stock] then Mirror(stock) end
    end)
end

hooksecurefunc("UnitFrame_Update", function(frame)
    if not enabled[frame.healthbar] then return end
    Snap(frame.healthbar)
    Snap(frame.manabar)
end)

function ns.ApplySmoothBars()
    local on = ns.Get(KEY) or nil
    for _, frame in ipairs(FRAMES) do
        for _, stock in ipairs({ frame.healthbar, frame.manabar }) do
            enabled[stock] = on
            if on then
                Setup(stock)
                Mirror(stock)
                Snap(stock)
            end
            if overlays[stock] then
                overlays[stock]:SetShown(on == true)
                ns.SetHidden(stock:GetStatusBarTexture(), on)
            end
        end
    end
end

-------------------------------------------------------------------------------
--  Hide Tutorial Pop-ups -- yellow HelpTip bubbles, the (i) help-plate
--  buttons and their tooltips, plus the tutorial CVars.
-------------------------------------------------------------------------------
local _, ns = ...

local function On() return ns.Get("hideTutorials") end

-- "i" circles are MainHelpPlateButtons, fingerprinted by a mixin method;
-- Blizzard_HelpPlate is load-on-demand, so resolve lazily and cache.
local fingerprint
local function GetFingerprint()
    if not fingerprint and MainHelpPlateButtonMixin then
        fingerprint = MainHelpPlateButtonMixin.ShowTooltip
    end
    return fingerprint
end

local hiddenByUs = {}
local function HideButton(btn)
    btn:SetAlpha(0)
    btn:EnableMouse(false)
    hiddenByUs[btn] = true
end

local function HideOpenTips()
    for tip in HelpTip.framePool:EnumerateActive() do
        if tip:IsShown() then
            local info = tip.info
            if info and info.cvarBitfield and info.bitfieldFlag then
                SetCVarBitfield(info.cvarBitfield, info.bitfieldFlag, true)
            end
            tip:Hide()
        end
    end
end

-- A forbidden frame refuses insecure code, and this walk runs inside a
-- ShowUIPanel hook, where an error would reach the panel's caller; such a
-- frame is skipped with everything under it. Callers make sure the
-- fingerprint exists.
local function HideButtonsUnder(root)
    if root:IsForbidden() then return end
    if root.ShowTooltip == fingerprint then HideButton(root) end
    for _, child in ipairs({ root:GetChildren() }) do HideButtonsUnder(child) end
end

-- Panels already walked: their (i) buttons are made with the panel, so a
-- second walk on the next open would find the same ones.
local scanned = {}

local function RestoreButtons()
    for btn in pairs(hiddenByUs) do
        btn:SetAlpha(1)
        btn:EnableMouse(true)
        hiddenByUs[btn] = nil
    end
    wipe(scanned)
end

local coreHooked = false
local function InstallCoreHooks()
    if coreHooked then return end
    coreHooked = true
    hooksecurefunc(HelpTip, "Show", function()
        if On() then HideOpenTips() end
    end)
    hooksecurefunc("ShowUIPanel", function(frame)
        if On() and frame then
            -- Not marked before the fingerprint exists (Blizzard_HelpPlate
            -- not loaded yet), so the panel is walked once that loads.
            if not scanned[frame] and GetFingerprint() then
                scanned[frame] = true
                HideButtonsUnder(frame)
            end
            HideOpenTips()
        end
    end)
end

local tooltipHooked = false
local function InstallTooltipHook()
    if tooltipHooked or not HelpPlateTooltip then return end
    tooltipHooked = true
    hooksecurefunc(HelpPlate, "ShowTutorialTooltip", function()
        if On() then HelpPlateTooltip:Hide() end
    end)
    hooksecurefunc(HelpPlateTooltip, "Init", function(self)
        if On() then self:Hide() end
    end)
end

local weSetCVar = false
local function Apply()
    if On() then
        InstallCoreHooks()
        InstallTooltipHook()
        SetCVar("hideHelptips", "1")
        SetCVar("showTutorials", "0")
        weSetCVar = true
        HideOpenTips()
    else
        if weSetCVar then
            SetCVar("hideHelptips", "0")
            SetCVar("showTutorials", "1")
            weSetCVar = false
        end
        RestoreButtons()
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, addonName)
    if addonName == "Blizzard_HelpPlate" and On() then
        InstallTooltipHook()
    end
end)

ns.RegisterFeature({
    key = "hideTutorials", label = "Hide tutorial pop-ups", section = "General", category = "Interface",
    apply = Apply,
})

-------------------------------------------------------------------------------
--  Minimap Icon -- LibDBIcon launcher: left-click opens the options window,
--  right-click shows or hides the CPU meter, Shift-right-click reloads the
--  UI, drag moves it around the minimap. Position lives in SereneDB.minimap.
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
--  Shift-right-click reload. The Forever client blocks ReloadUI() from addon
--  code, so an invisible secure macro button (/reload on Shift-right-click)
--  covers the icon; everything else it receives is passed on to the
--  LibDBIcon button (other clicks, drag, tooltip, highlight). A protected
--  child would lock the icon (LibDBIcon's Show/Hide) in combat, so on
--  entering combat the overlay is detached and every click falls through to
--  the icon, which then only explains the reload. PLAYER_REGEN_DISABLED
--  still runs before the lockdown starts.
-------------------------------------------------------------------------------
local iconButton, overlay

local function Forward(script)
    return function(_, ...)
        local handler = iconButton:GetScript(script)
        if handler then handler(iconButton, ...) end
    end
end

local function AttachOverlay()
    if InCombatLockdown() or not iconButton then return end
    if not overlay then
        overlay = CreateFrame("Button", nil, iconButton, "InsecureActionButtonTemplate")
        overlay:RegisterForClicks("AnyUp")
        overlay:RegisterForDrag("LeftButton")
        overlay:SetAttribute("useOnKeyDown", false)
        overlay:SetAttribute("shift-type2", "macro")
        overlay:SetAttribute("shift-macrotext2", "/reload")
        overlay:HookScript("OnClick", function(_, button)
            if button == "LeftButton" then
                ns.ToggleOptions()
            elseif button == "RightButton" and not IsShiftKeyDown() then
                ns.ToggleCPUMeter()
            end
        end)
        overlay:SetScript("OnDragStart", Forward("OnDragStart"))
        overlay:SetScript("OnDragStop", Forward("OnDragStop"))
        overlay:SetScript("OnMouseDown", Forward("OnMouseDown"))
        overlay:SetScript("OnMouseUp", Forward("OnMouseUp"))
        local onEnter, onLeave = Forward("OnEnter"), Forward("OnLeave")
        overlay:SetScript("OnEnter", function(self, ...)
            iconButton:LockHighlight()
            onEnter(self, ...)
        end)
        overlay:SetScript("OnLeave", function(self, ...)
            iconButton:UnlockHighlight()
            onLeave(self, ...)
        end)
    end
    overlay:SetParent(iconButton)
    overlay:ClearAllPoints()
    overlay:SetAllPoints(iconButton)
    overlay:SetFrameLevel(iconButton:GetFrameLevel() + 5)
    overlay:Show()
end

local function DetachOverlay()
    if not overlay then return end
    overlay:Hide()
    overlay:ClearAllPoints()
    overlay:SetParent(UIParent)
    iconButton:UnlockHighlight()
end

local combatWatcher = CreateFrame("Frame")
combatWatcher:RegisterEvent("PLAYER_REGEN_DISABLED")
combatWatcher:RegisterEvent("PLAYER_REGEN_ENABLED")
combatWatcher:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then DetachOverlay() else AttachOverlay() end
end)

-------------------------------------------------------------------------------
local DBIcon = LibStub("LibDBIcon-1.0")

local function Register()
    local launcher = LibStub("LibDataBroker-1.1"):NewDataObject("Serene", {
        type = "launcher",
        text = "Serene",
        icon = ns.LOGO,
        -- Reached for left-click only while the overlay is attached; in
        -- combat right-click lands here too.
        OnClick = function(_, button)
            if button ~= "RightButton" then
                ns.ToggleOptions()  -- refuses during combat itself
            elseif IsShiftKeyDown() then
                ns.Print("Cannot reload from the icon during combat. Type /reload instead.")
            else
                ns.ToggleCPUMeter()
            end
        end,
        OnTooltipShow = function(tt)
            tt:AddLine("Serene", unpack(ns.ACCENT))
            tt:AddLine("|cffffffffLeft-click|r to open the options.", 0.8, 0.8, 0.8)
            tt:AddLine(("|cffffffffRight-click|r to %s the CPU meter."):format(
                ns.Get("cpuMeter") and "hide" or "show"), 0.8, 0.8, 0.8)
            tt:AddLine("|cffffffffShift-right-click|r to reload the UI.", 0.8, 0.8, 0.8)
            tt:AddLine("|cffffffffDrag|r to move this icon.", 0.8, 0.8, 0.8)
        end,
    })
    DBIcon:Register("Serene", launcher, SereneDB.minimap)
    -- The round logo has its own dark face and fills the border at 20px
    -- (LibDBIcon uses 17); the offset is checked by eye in game. Border and
    -- background are pinned too: from minor 57 LibDBIcon sees Forever as
    -- retail (AddonCompartmentFrame exists) and shrinks the border, and
    -- another addon's newer copy of the library wins over ours.
    DBIcon:SetButtonBorder("Serene", nil, 53, "TOPLEFT", 0, 0)
    DBIcon:SetButtonBackground("Serene", nil, 20, "TOPLEFT", 7, -5)
    DBIcon:SetButtonIcon("Serene", nil, 20, "TOPLEFT", 7, -6)
    iconButton = DBIcon:GetMinimapButton("Serene")
    AttachOverlay()
end

local function Apply()
    SereneDB.minimap = SereneDB.minimap or {}
    SereneDB.minimap.hide = not ns.Get("minimapIcon")
    if not iconButton then Register() end
    if SereneDB.minimap.hide then DBIcon:Hide("Serene") else DBIcon:Show("Serene") end
end

-- /serene reset: the icon goes back to LibDBIcon's default spot.
ns.OnResetAll(function()
    SereneDB.minimap.minimapPos = nil
    DBIcon:Refresh("Serene")
end)

ns.RegisterFeature({ key = "minimapIcon", label = "Show minimap icon", apply = Apply })

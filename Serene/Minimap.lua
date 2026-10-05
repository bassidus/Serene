-------------------------------------------------------------------------------
--  Minimap Icon -- LibDBIcon launcher: left-click opens the options window,
--  right-click reloads the UI, drag moves it around the minimap. Position
--  lives in SereneDB.minimap.
-------------------------------------------------------------------------------
local _, ns = ...

local ICON = "Interface\\Icons\\Spell_Nature_Tranquility"
local registered = false

-------------------------------------------------------------------------------
--  Right-click reload. The Forever client blocks ReloadUI() from addon code,
--  so an invisible secure macro button (/reload on right-click) covers the
--  icon; everything else it receives is passed on to the LibDBIcon button
--  (left-click, drag, tooltip, highlight). A protected child would lock the
--  icon (LibDBIcon's Show/Hide) in combat, so on entering combat the overlay
--  is detached and right-click falls through to the icon, which then only
--  explains. PLAYER_REGEN_DISABLED still runs before the lockdown starts.
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
        overlay:SetAttribute("type2", "macro")
        overlay:SetAttribute("macrotext2", "/reload")
        overlay:HookScript("OnClick", function(_, button)
            if button == "LeftButton" and ns.ToggleOptions then ns.ToggleOptions() end
        end)
        overlay:SetScript("OnDragStart", Forward("OnDragStart"))
        overlay:SetScript("OnDragStop", Forward("OnDragStop"))
        overlay:SetScript("OnMouseDown", Forward("OnMouseDown"))
        overlay:SetScript("OnMouseUp", Forward("OnMouseUp"))
        overlay:SetScript("OnEnter", function(self, ...)
            iconButton:LockHighlight()
            Forward("OnEnter")(self, ...)
        end)
        overlay:SetScript("OnLeave", function(self, ...)
            iconButton:UnlockHighlight()
            Forward("OnLeave")(self, ...)
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
    if iconButton then iconButton:UnlockHighlight() end
end

local combatWatcher = CreateFrame("Frame")
combatWatcher:RegisterEvent("PLAYER_REGEN_DISABLED")
combatWatcher:RegisterEvent("PLAYER_REGEN_ENABLED")
combatWatcher:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then DetachOverlay() else AttachOverlay() end
end)

-------------------------------------------------------------------------------
local function Register(DBIcon)
    local LDB = LibStub("LibDataBroker-1.1", true)
    if not LDB then return false end
    local launcher = LDB:NewDataObject("Serene", {
        type = "launcher",
        text = "Serene",
        icon = ICON,
        -- Reached for left-click only while the overlay is attached; in
        -- combat right-click lands here too.
        OnClick = function(_, button)
            if button == "RightButton" then
                ns.Print("Cannot reload from the icon during combat. Type /reload instead.")
            elseif ns.ToggleOptions then
                ns.ToggleOptions()  -- refuses during combat itself
            end
        end,
        OnTooltipShow = function(tt)
            tt:AddLine("Serene", 0.5, 0.82, 0.78)
            tt:AddLine("|cffffffffLeft-click|r to open the options.", 0.8, 0.8, 0.8)
            tt:AddLine("|cffffffffRight-click|r to reload the UI.", 0.8, 0.8, 0.8)
            tt:AddLine("|cffffffffDrag|r to move this icon.", 0.8, 0.8, 0.8)
        end,
    })
    if not launcher then return false end
    DBIcon:Register("Serene", launcher, SereneDB.minimap)
    iconButton = DBIcon:GetMinimapButton("Serene")
    AttachOverlay()
    return true
end

local function Apply()
    local DBIcon = LibStub and LibStub("LibDBIcon-1.0", true)
    if not DBIcon then return end
    SereneDB.minimap = SereneDB.minimap or {}
    SereneDB.minimap.hide = not ns.Enabled("minimapIcon")
    if not registered then
        registered = Register(DBIcon)
        if not registered then return end
    end
    if SereneDB.minimap.hide then DBIcon:Hide("Serene") else DBIcon:Show("Serene") end
end

ns.RegisterFeature({
    key = "minimapIcon", label = "Show minimap icon", apply = Apply,
    tooltip = "Left-click the icon to open these options, right-click it to reload the UI. Drag it to move it.",
})

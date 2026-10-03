-------------------------------------------------------------------------------
--  Faster Movie Skip -- Escape, Space or Enter ends a cinematic or movie
--  right away instead of first asking "Are you sure?". Ported from
--  EllesmereUIQoL. The key hooks are installed once; their body gates on
--  the setting.
-------------------------------------------------------------------------------
local _, ns = ...

local SKIP_KEYS = { ESCAPE = true, SPACE = true, ENTER = true }
local hooked = false

local function On() return ns.Enabled("fasterMovieSkip") end

local function Hook()
    if hooked or not (CinematicFrame and CinematicFrame.HookScript) then return end
    hooked = true

    -- Escape opens the confirmation on key down; it is closed straight away...
    CinematicFrame:HookScript("OnKeyDown", function(self, key)
        if key == "ESCAPE" and On() and self:IsShown() and self.closeDialog then
            self.closeDialog:Hide()
        end
    end)
    -- ...and the skip is confirmed on key up.
    CinematicFrame:HookScript("OnKeyUp", function(self, key)
        if not (SKIP_KEYS[key] and On() and self:IsShown() and self.closeDialog) then return end
        local confirm = self.closeDialog.confirmButton or _G.CinematicFrameCloseDialogConfirmButton
        if confirm then confirm:Click() end
    end)

    if MovieFrame and MovieFrame.HookScript then
        MovieFrame:HookScript("OnKeyUp", function(self, key)
            if not (SKIP_KEYS[key] and On() and self:IsShown()) then return end
            local dialog = self.CloseDialog
            if dialog and dialog.ConfirmButton then dialog.ConfirmButton:Click() end
        end)
    end
end

ns.RegisterFeature({
    key = "fasterMovieSkip", label = "Faster Movie Skip", section = "General",
    apply = function() if On() then Hook() end end,
    tooltip = "Escape, Space or Enter skips a cinematic or movie right away, without the \"Are you sure?\" question.",
})

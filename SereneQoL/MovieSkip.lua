-------------------------------------------------------------------------------
--  Skip Cinematics Without Asking -- Escape, Space or Enter ends a cinematic or movie
--  without the "Are you sure?" question.
-------------------------------------------------------------------------------
local _, ns = ...

local SKIP_KEYS = { ESCAPE = true, SPACE = true, ENTER = true }
local hooked = false

local function On() return ns.Enabled("fasterMovieSkip") end

local function Hook()
    if hooked or not (CinematicFrame and CinematicFrame.HookScript) then return end
    hooked = true

    -- Escape opens the confirmation on key down: close it at once and
    -- confirm the skip on key up.
    CinematicFrame:HookScript("OnKeyDown", function(self, key)
        if key == "ESCAPE" and On() and self:IsShown() and self.closeDialog then
            self.closeDialog:Hide()
        end
    end)
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
    key = "fasterMovieSkip", label = "Skip cinematics without asking",
    section = "General", category = "Camera & cinematics",
    beside = true,  -- to the right of Interface
    apply = function() if On() then Hook() end end,
    tooltip = "Escape, Space or Enter ends a cinematic or movie at once, without the \"Are you sure?\" question.",
})

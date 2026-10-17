-------------------------------------------------------------------------------
--  Skip Cinematics Without Asking -- Escape, Space or Enter ends a cinematic
--  without the "Are you sure?" question.
-------------------------------------------------------------------------------
local _, ns = ...

local SKIP_KEYS = { ESCAPE = true, SPACE = true, ENTER = true }
local hooked = false

local function On() return ns.Get("fasterMovieSkip") end

local function Hook()
    if hooked then return end
    hooked = true

    -- Escape opens the confirmation on key down: close it at once and
    -- confirm the skip on key up.
    CinematicFrame:HookScript("OnKeyDown", function(self, key)
        if key == "ESCAPE" and On() then
            self.closeDialog:Hide()
        end
    end)
    CinematicFrame:HookScript("OnKeyUp", function(self, key)
        if not (SKIP_KEYS[key] and On()) then return end
        CinematicFrameCloseDialogConfirmButton:Click()
    end)
end

ns.RegisterFeature({
    key = "fasterMovieSkip", label = "Skip cinematics without asking",
    section = "Quality of Life", category = "Camera & cinematics",
    apply = function() if On() then Hook() end end,
})

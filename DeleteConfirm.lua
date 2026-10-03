-------------------------------------------------------------------------------
--  Auto-Fill Delete Confirmation -- types DELETE into the "delete this good
--  item?" popup. Hooks install once; the hook body gates on the toggle.
-------------------------------------------------------------------------------
local _, ns = ...

local hooked = false

local function Apply()
    if hooked then return end
    hooked = true
    for i = 1, 4 do
        local popup = _G["StaticPopup" .. i]
        if popup then
            hooksecurefunc(popup, "Show", function(self)
                if not self then return end
                if self.which ~= "DELETE_GOOD_ITEM" and self.which ~= "DELETE_GOOD_QUEST_ITEM" then return end
                if not ns.Enabled("autoFillDelete") then return end
                local editBox = self.editBox or (self.GetEditBox and self:GetEditBox())
                if not editBox then return end
                editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
                editBox:SetFocus()
            end)
        end
    end
end

ns.RegisterFeature({
    key = "autoFillDelete", label = "Auto-Fill Delete", section = "General", apply = Apply,
    tooltip = "Types DELETE for you in the confirmation popup when destroying a valuable item.",
})

-------------------------------------------------------------------------------
--  Type DELETE for You -- types DELETE into the "delete this good item?" popup.
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
    key = "autoFillDelete", label = "Type DELETE for you", section = "Quality of life", category = "Loot & items",
    apply = Apply,
    tooltip = "Fills in DELETE when the game asks you to type it to destroy a valuable item. You still click Yes yourself.",
})

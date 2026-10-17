-------------------------------------------------------------------------------
--  Easier Delete -- types DELETE into the "delete this good item?" popup.
-------------------------------------------------------------------------------
local _, ns = ...

for i = 1, 4 do
    hooksecurefunc(_G["StaticPopup" .. i], "Show", function(self)
        if self.which ~= "DELETE_GOOD_ITEM" and self.which ~= "DELETE_GOOD_QUEST_ITEM" then return end
        if not ns.Get("autoFillDelete") then return end
        local editBox = self:GetEditBox()
        editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
        editBox:SetFocus()
    end)
end

ns.RegisterFeature({
    key = "autoFillDelete", label = "Easier delete", section = "Quality of Life", category = "General",
    tooltip = "Types DELETE for you when deleting a good item.",
    default = false,
})

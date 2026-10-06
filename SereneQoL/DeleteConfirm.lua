-------------------------------------------------------------------------------
--  Type DELETE for You -- types DELETE into the "delete this good item?" popup.
-------------------------------------------------------------------------------
local _, ns = ...

local hooked = false

local function Apply()
    if hooked then return end
    hooked = true
    for i = 1, 4 do
        hooksecurefunc(_G["StaticPopup" .. i], "Show", function(self)
            if self.which ~= "DELETE_GOOD_ITEM" and self.which ~= "DELETE_GOOD_QUEST_ITEM" then return end
            if not ns.Enabled("autoFillDelete") then return end
            local editBox = self:GetEditBox()
            editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
            editBox:SetFocus()
        end)
    end
end

ns.RegisterFeature({
    key = "autoFillDelete", label = "Type DELETE for you", section = "General", category = "Loot & items",
    apply = Apply,
})

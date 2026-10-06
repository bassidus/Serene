-------------------------------------------------------------------------------
--  Friend Colors -- online characters in the friends list take their class
--  color: the whole line for a character friend, the character name in
--  brackets for a Battle.net friend. Blizzard sets the text and its color
--  again on every update, so a change shows the next time the list redraws.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

-- Localized class name -> class color; the friends APIs give names only.
local byName = {}
for _, names in ipairs({ LOCALIZED_CLASS_NAMES_MALE, LOCALIZED_CLASS_NAMES_FEMALE }) do
    for classFile, name in pairs(names) do byName[name] = RAID_CLASS_COLORS[classFile] end
end

local function WowGame(index)
    for i = 1, C_BattleNet.GetFriendNumGameAccounts(index) do
        local game = C_BattleNet.GetFriendGameAccountInfo(index, i)
        if game and game.isOnline and game.clientProgram == BNET_CLIENT_WOW then return game end
    end
end

hooksecurefunc("FriendsFrame_UpdateFriendButton", function(button)
    if not ns.Get("friendClassColors") or not button.id then return end
    local fs = button.name
    if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then
        local info = C_FriendList.GetFriendInfoByIndex(button.id)
        local c = info and info.connected and byName[info.className]
        if c then fs:SetTextColor(c.r, c.g, c.b) end
    elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then
        local game = WowGame(button.id)
        local c = game and byName[game.className]
        local text = c and Clean(fs:GetText())
        if text then
            text = text:gsub("|c%x%x%x%x%x%x%x%x(%b())|r", "%1")
            fs:SetText((text:gsub("(%b())", c:WrapTextInColorCode("%1"), 1)))
        end
    end
end)

ns.RegisterFeature({
    key = "friendClassColors", label = "Class colors in friends list", section = "Social", category = "Friends list",
})

-------------------------------------------------------------------------------
--  Announce Instance Resets -- when you reset instances in a group, the
--  game's "X has been reset." (or "Cannot reset X ...") goes to party or
--  raid chat too, so the others know they can go back in.
-------------------------------------------------------------------------------
local _, ns = ...

local Clean = ns.Clean

-- A global string like "%s has been reset." as a pattern for the whole line.
local function Pattern(fmt)
    return "^" .. fmt:gsub("[%(%)%.%+%-%*%?%[%]%^%$]", "%%%0"):gsub("%%s", ".+") .. "$"
end
local PATTERNS = { Pattern(INSTANCE_RESET_SUCCESS), Pattern(INSTANCE_RESET_FAILED) }

local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function(_, _, msg)
    msg = Clean(msg)
    if not msg or not IsInGroup() then return end
    for _, pattern in ipairs(PATTERNS) do
        if msg:find(pattern) then
            C_ChatInfo.SendChatMessage("<Serene> " .. msg, IsInRaid() and "RAID" or "PARTY")
            return
        end
    end
end)

ns.RegisterFeature({
    key = "resetAnnounce", label = "Announce instance resets", section = "Social", category = "Automation",
    tooltip = "Tells your group in chat when you reset instances.",
    default = false,
    apply = function()
        if ns.Get("resetAnnounce") then
            watcher:RegisterEvent("CHAT_MSG_SYSTEM")
        else
            watcher:UnregisterAllEvents()
        end
    end,
})

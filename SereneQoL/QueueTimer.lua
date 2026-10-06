-------------------------------------------------------------------------------
--  Queue Timer -- when a battleground pops, the time left to enter is
--  counted down under Blizzard's dialog, turning yellow and then red, with
--  a warning sound once a few seconds are left.
-------------------------------------------------------------------------------
local _, ns = ...

local WARN_AT = 6  -- seconds left for the warning sound

local timer = CreateFrame("Frame", nil, PVPReadyDialog)
timer:SetPoint("TOP", PVPReadyDialog, "BOTTOM", 0, -6)
timer:SetSize(1, 1)
local text = timer:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
text:SetPoint("TOP")
text:SetShadowOffset(1, -1)
timer:Hide()

local index    -- the battlefield waiting for us
local warned
local elapsed = 0

local function Confirming()
    for i = 1, GetMaxBattlefieldID() do
        if GetBattlefieldStatus(i) == "confirm" then return i end
    end
end

timer:SetScript("OnUpdate", function(self, dt)
    elapsed = elapsed + dt
    if elapsed < 0.2 then return end
    elapsed = 0
    local left = GetBattlefieldPortExpiration(index)
    if not left or left <= 0 or GetBattlefieldStatus(index) ~= "confirm" then
        self:Hide()
        return
    end
    local color = left > 20 and "40d940" or left > 10 and "ffd100" or "ff4d1a"
    text:SetText(("|cff%s%d:%02d|r"):format(color, left / 60, left % 60))
    if left <= WARN_AT and not warned then
        warned = true
        PlaySound(SOUNDKIT.RAID_WARNING, "Master")
    end
end)

local watcher = CreateFrame("Frame")
watcher:SetScript("OnEvent", function()
    local i = Confirming()
    if i and i ~= index then warned = false end
    index = i
    timer:SetShown(i ~= nil)
end)

local function Apply()
    if ns.Enabled("queueTimer") then
        watcher:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
        watcher:GetScript("OnEvent")()
    else
        watcher:UnregisterAllEvents()
        index = nil
        timer:Hide()
    end
end

ns.RegisterFeature({
    key = "queueTimer", label = "Battleground queue timer", section = "General", category = "Interface",
    apply = Apply,
})

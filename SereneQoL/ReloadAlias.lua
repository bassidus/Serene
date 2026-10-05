-------------------------------------------------------------------------------
--  /rl -> /reload. The Forever client blocks ReloadUI() from addon code, so a
--  slash handler cannot reload. Instead "/rl" typed in a chat box is rewritten
--  to "/reload" as it is typed, and Blizzard's own chat code runs it on Enter.
--  Always on; no toggle.
-------------------------------------------------------------------------------
local hooked = {}

local function OnTextChanged(editBox, userInput)
    if userInput and editBox:GetText():lower() == "/rl" then editBox:SetText("/reload") end
end

local function HookEditBox(editBox)
    if hooked[editBox] then return end
    hooked[editBox] = true
    editBox:HookScript("OnTextChanged", OnTextChanged)
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    self:UnregisterAllEvents()
    for i = 1, NUM_CHAT_WINDOWS do HookEditBox(_G["ChatFrame" .. i .. "EditBox"]) end
    -- Whisper/temporary chat windows bring their own edit box.
    hooksecurefunc("FCF_OpenTemporaryWindow", function()
        for _, name in ipairs(CHAT_FRAMES) do HookEditBox(_G[name .. "EditBox"]) end
    end)
end)

-------------------------------------------------------------------------------
--  /rl -> /reload. The Forever client blocks ReloadUI() from addon code, so a
--  slash handler cannot reload. Instead "/rl" typed in a chat box is rewritten
--  to "/reload" as it is typed, and Blizzard's own chat code runs it on Enter.
--  Always on; no toggle.
-------------------------------------------------------------------------------
local hooked = setmetatable({}, { __mode = "k" })

local function OnTextChanged(editBox, userInput)
    if not userInput then return end
    local text = editBox:GetText()
    if text == "/rl" or text == "/RL" then
        editBox:SetText("/reload")
    end
end

local function HookEditBox(editBox)
    if not editBox or hooked[editBox] then return end
    hooked[editBox] = true
    editBox:HookScript("OnTextChanged", OnTextChanged)
end

local function HookAll()
    for i = 1, (NUM_CHAT_WINDOWS or 10) do
        HookEditBox(_G["ChatFrame" .. i .. "EditBox"])
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    self:UnregisterAllEvents()
    HookAll()
    -- Whisper/temporary chat windows bring their own edit box.
    if FCF_OpenTemporaryWindow then
        hooksecurefunc("FCF_OpenTemporaryWindow", function(...)
            local frame = ...
            HookAll()
            if frame and frame.editBox then HookEditBox(frame.editBox) end
        end)
    end
end)

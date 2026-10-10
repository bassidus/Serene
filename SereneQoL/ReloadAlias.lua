-------------------------------------------------------------------------------
--  /rl -> /reload. The Forever client blocks ReloadUI() from addon code, so a
--  slash handler cannot reload. Instead "/rl" typed in a chat box is rewritten
--  to "/reload" as it is typed, and Blizzard's own chat code runs it on Enter.
--  Always on; no toggle.
-------------------------------------------------------------------------------
local _, ns = ...

local function OnTextChanged(editBox, userInput)
    if userInput and editBox:GetText():lower() == "/rl" then editBox:SetText("/reload") end
end

ns.EachChatWindow(function(frame)
    _G[frame:GetName() .. "EditBox"]:HookScript("OnTextChanged", OnTextChanged)
end)

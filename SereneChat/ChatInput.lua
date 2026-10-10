-------------------------------------------------------------------------------
--  Chat Input -- the arrow keys step through sent lines without Alt, in
--  every chat box (whisper windows have their own). Always on; no toggle.
--
--  Out of Alt arrow mode the edit box hands plain arrows to OnArrowPressed
--  instead of its history, so the stepping is done here from one list that
--  every box adds its sent lines to. Alt + arrows stay Blizzard's own.
--  Secure commands (/cast...) are left out: they only run from text the
--  player typed, not from text an addon put in the box.
-------------------------------------------------------------------------------
local _, ns = ...

local MAX_LINES = 32  -- the edit box's own history length

local lines = {}  -- sent lines, oldest first
local step = {}   -- chat box -> { index =, draft = } while stepping

local function Remember(box, text)
    step[box] = nil
    text = ns.Clean(text)
    if not text or lines[#lines] == text then return end
    local command = text:match("^(/%S+)")
    if command and IsSecureCmd(command) then return end
    lines[#lines + 1] = text
    if #lines > MAX_LINES then table.remove(lines, 1) end
end

local function OnArrow(box, key)
    if #lines == 0 then return end
    -- The name suggestions under "/w Na" step with the arrows too.
    if AutoCompleteBox:IsShown() and AutoCompleteBox.parent == box then return end
    local s = step[box]
    if not s then
        s = { index = #lines + 1, draft = box:GetText() }
        step[box] = s
    end
    if key == "UP" and s.index > 1 then
        s.index = s.index - 1
        box:SetText(lines[s.index])
    elseif key == "DOWN" and s.index <= #lines then
        s.index = s.index + 1
        box:SetText(lines[s.index] or s.draft)
    end
end

ns.EachChatWindow(function(frame)
    local box = _G[frame:GetName() .. "EditBox"]
    hooksecurefunc(box, "AddHistoryLine", Remember)
    box:HookScript("OnArrowPressed", OnArrow)
    box:HookScript("OnEditFocusLost", function(self) step[self] = nil end)
end)

-- Every time the windows are set up, Alt arrow mode comes back: at login,
-- when a new character's chat settings arrive after it, and for a whisper
-- window.
local function NoAltArrows()
    for _, name in ipairs(CHAT_FRAMES) do _G[name .. "EditBox"]:SetAltArrowKeyMode(false) end
end
local login = CreateFrame("Frame")
login:RegisterEvent("PLAYER_LOGIN")
login:RegisterEvent("UPDATE_CHAT_WINDOWS")
login:SetScript("OnEvent", NoAltArrows)
hooksecurefunc("FCF_OpenTemporaryWindow", NoAltArrows)

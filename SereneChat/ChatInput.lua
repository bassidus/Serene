-------------------------------------------------------------------------------
--  Chat Input -- the arrow keys step through sent lines without Alt, in
--  every chat box (whisper windows have their own) and across /reload.
--
--  Out of Alt arrow mode the edit box hands plain arrows to OnArrowPressed
--  instead of its history, so the stepping is done here from one list that
--  every box adds its sent lines to. Alt + arrows stay Blizzard's own.
--  Secure commands (/cast...) are left out: they only run from text the
--  player typed, not from text an addon put in the box.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION, CATEGORY = "Chat", "Edit box"
local MAX_LINES = 32  -- the edit box's own history length

local lines = {}   -- sent lines, oldest first; SereneDB.chatHistory while kept
local hooked = {}  -- chat box -> true
local step = {}    -- chat box -> { index =, draft = } while stepping
local loaded       -- the kept lines are read on the first Setup, at login before chatKeepHistory applies

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
    if not ns.Get("chatArrowKeys") or #lines == 0 then return end
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

local function Setup()
    if not loaded then
        loaded = true
        if ns.Get("chatKeepHistory") and SereneDB.chatHistory then lines = SereneDB.chatHistory end
    end
    local alt = not ns.Get("chatArrowKeys")
    for _, name in ipairs(CHAT_FRAMES) do
        local box = _G[name .. "EditBox"]
        box:SetAltArrowKeyMode(alt)
        if not hooked[box] then
            hooked[box] = true
            hooksecurefunc(box, "AddHistoryLine", Remember)
            box:HookScript("OnArrowPressed", OnArrow)
            box:HookScript("OnEditFocusLost", function(self) step[self] = nil end)
        end
    end
end

hooksecurefunc("FCF_OpenTemporaryWindow", Setup)

ns.RegisterFeature({
    key = "chatArrowKeys", label = "Arrow keys browse sent lines", section = SECTION, category = CATEGORY,
    apply = Setup,
})
ns.RegisterFeature({
    key = "chatKeepHistory", label = "Keep sent lines after /reload", section = SECTION, category = CATEGORY,
    beside = true,
    apply = function()
        SereneDB.chatHistory = ns.Get("chatKeepHistory") and lines or nil
    end,
})

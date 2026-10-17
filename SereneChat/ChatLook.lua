-------------------------------------------------------------------------------
--  Chat Look -- the chat windows' font, the space between messages, wrapped
--  lines indented, and how long a line stays before it fades. While the font
--  settings match Blizzard's own (its typeface and outline at size 14) each
--  window keeps the size picked in its tab menu.
--  The edit boxes always go without their frame, in their window's font and
--  on a background like the window's.
--  The buttons beside the windows can be hidden, and the edit boxes moved
--  above the tabs.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION, CATEGORY = "Chat", "Look"
local BLIZZARD_SIZE = 14  -- CHAT_FRAME_DEFAULT_FONT_SIZE

local original = {}  -- chat frame -> ns.FontState before the first change

-- The edit boxes lose their frame and get a background like their
-- window's. Blizzard shows and hides the frame's focus half, never changes
-- the alpha.
local BORDER = { "Left", "Mid", "Right", "FocusLeft", "FocusMid", "FocusRight" }

local boxBackground = {}  -- edit box -> its background

-- At the bottom the box sits 4 px above the window background's bottom
-- edge; on top it sits on the tabs, which are 32 px tall on the window
-- background. Its background is as wide as the window's and 5 px shorter
-- than the box at top and bottom.
local function PlaceEditBox(frame)
    local box, window = frame.editBox, _G[frame:GetName() .. "Background"]
    local tex = boxBackground[box]
    box:ClearAllPoints()
    tex:ClearAllPoints()
    if ns.Get("chatEditBoxTop") then
        box:SetPoint("BOTTOMLEFT", window, "TOPLEFT", -3, 32)
        tex:SetPoint("BOTTOMLEFT", window, "TOPLEFT", 0, 37)
        tex:SetPoint("TOPRIGHT", window, "TOPRIGHT", 0, 59)
    else
        box:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", -5, -2)  -- Blizzard's
        tex:SetPoint("TOPLEFT", window, "BOTTOMLEFT", 0, -1)
        tex:SetPoint("BOTTOMRIGHT", window, "BOTTOMRIGHT", 0, -23)
    end
    box:SetPoint("RIGHT", frame.ScrollBar, "RIGHT", 8, 0)
end

ns.EachChatWindow(function(frame)
    local name = frame:GetName()
    for _, part in ipairs(BORDER) do _G[name .. "EditBox" .. part]:SetAlpha(0) end
    local window = _G[name .. "Background"]
    local tex = _G[name .. "EditBox"]:CreateTexture(nil, "BACKGROUND", nil, -8)
    tex:SetColorTexture(1, 1, 1)
    boxBackground[frame.editBox] = tex
    PlaceEditBox(frame)
    -- The window's background fades in under the mouse and takes the color
    -- picked in its tab menu; the box follows each change.
    local function Copy()
        tex:SetVertexColor(window:GetVertexColor())
        tex:SetAlpha(window:GetAlpha())
    end
    hooksecurefunc(window, "SetAlpha", Copy)
    hooksecurefunc(window, "SetVertexColor", Copy)
    Copy()
end)

-- The edit boxes' text in their window's font, whether set here or in its
-- tab menu.
local function EditBoxFont()
    for _, name in ipairs(CHAT_FRAMES) do
        local frame, box = _G[name], _G[name .. "EditBox"]
        for _, fs in ipairs({ box, box.header, box.headerSuffix, box.languageHeader, box.NewcomerHint, box.prompt }) do
            fs:SetFont(frame:GetFont())
            fs:SetShadowColor(frame:GetShadowColor())
            fs:SetShadowOffset(frame:GetShadowOffset())
        end
    end
end

hooksecurefunc("FCF_SetChatWindowFontSize", EditBoxFont)

local function ApplyFont()
    local font, size, outline = ns.Get("chatFont"), ns.Get("chatFontSize"), ns.Get("chatOutline")
    local blizzard = font == "default" and size == BLIZZARD_SIZE and outline == "default"
    ChatFrameUtil.ForEachChatFrame(function(frame)
        if not original[frame] then
            if blizzard then return end
            original[frame] = ns.FontState(frame)
        end
        if blizzard then
            local _, own = frame:GetFont()
            ns.ApplyFont(frame, original[frame], font, own, outline)
        else
            ns.ApplyFont(frame, original[frame], font, size, outline)
        end
    end)
    EditBoxFont()
end

local function ApplyFade()
    local fade, seconds = ns.Get("chatFade"), ns.Get("chatFadeTime")
    ChatFrameUtil.ForEachChatFrame(function(frame)
        frame:SetFading(fade)
        frame:SetTimeVisible(seconds)
    end)
end

local spaced = {}  -- chat frame -> true once its layout is hooked

-- Blizzard sets the newest line on the window's bottom edge, where the
-- window cuts off the letters that reach below the line.
local BOTTOM_PAD = 4

-- Blizzard puts the font's spacing both between a message's wrapped lines
-- and between messages. The font keeps none, so a message stays together,
-- and the messages are moved apart after each layout.
local function SpaceMessages(frame)
    local gap, lines = ns.Get("chatMessageSpacing"), frame.visibleLines
    local first = lines[1]
    for i = 1, first:GetNumPoints() do
        local point, relative, relativePoint, x = first:GetPoint(i)
        first:SetPoint(point, relative, relativePoint, x, BOTTOM_PAD)
    end
    for i = 2, #lines do
        lines[i]:SetPoint("BOTTOMLEFT", lines[i - 1], "TOPLEFT", 0, gap)
    end
end

local function ApplySpacing()
    local indent = ns.Get("chatIndent")
    ChatFrameUtil.ForEachChatFrame(function(frame)
        if not spaced[frame] then
            spaced[frame] = true
            hooksecurefunc(frame, "RefreshLayout", SpaceMessages)
        end
        frame:SetIndentedWordWrap(indent)
        frame:SetSpacing(0)  -- also lays the window out again, with the new gap
    end)
end

-- Each window's button frame holds the chat menu, channel and minimize
-- buttons; the text to speech button sits in ChatAlertFrame above it.
-- Blizzard shows the button frames again with every fade in.
-- Edit Mode keeps the main window as far from the screen's edge as its
-- selection box reaches past it, 32 px on the left for the buttons; without
-- them the box ends at the window.
local SELECTION_LEFT, SELECTION_TOP = -32, 60  -- EditModeChatFrameSystemTemplate

local function ApplyButtons()
    local hide = ns.Get("chatHideButtons")
    for _, name in ipairs(CHAT_FRAMES) do _G[name].buttonFrame:SetShown(not hide) end
    ChatAlertFrame:SetShown(not hide)
    ChatFrame1.Selection:SetPoint("TOPLEFT", hide and 0 or SELECTION_LEFT, SELECTION_TOP)
    ChatFrame1:UpdateClampOffsets()
end

local function ApplyEditBoxes()
    for _, name in ipairs(CHAT_FRAMES) do PlaceEditBox(_G[name]) end
end

ns.EachChatWindow(function(frame)
    hooksecurefunc(frame.buttonFrame, "Show", function(self)
        if ns.Get("chatHideButtons") then self:Hide() end
    end)
    if ns.Get("chatHideButtons") then frame.buttonFrame:Hide() end
end)

local function ApplyAll()
    ApplyFont()
    ApplyFade()
    ApplySpacing()
end

-- A whisper window takes its font from the window it opens from.
hooksecurefunc("FCF_OpenTemporaryWindow", ApplyAll)

-- A new character's chat settings arrive after login and set up the
-- windows again.
local windows = CreateFrame("Frame")
windows:RegisterEvent("UPDATE_CHAT_WINDOWS")
windows:SetScript("OnEvent", ApplyAll)

ns.RegisterFeature({
    key = "chatFade", label = "Fade old lines", section = SECTION, category = CATEGORY,
    apply = ApplyFade,
})
ns.RegisterFeature({
    key = "chatMessageSpacingLabel", label = "Message spacing", section = SECTION, category = CATEGORY, type = "text",
    beside = true,
})
ns.RegisterFeature({
    key = "chatFadeTime", label = "Fade after", section = SECTION, category = CATEGORY, type = "slider",
    min = 10, max = 600, step = 10, default = 120, suffix = " s", requires = "chatFade", hideLabel = true,
    apply = ApplyFade,
})
ns.RegisterFeature({
    key = "chatMessageSpacing", label = "Message spacing", section = SECTION, category = CATEGORY, type = "slider",
    min = 0, max = 20, step = 1, default = 6, suffix = " px", hideLabel = true,
    beside = true, apply = ApplySpacing,
})
ns.RegisterFeature({
    key = "chatIndent", label = "Indent wrapped lines", section = SECTION, category = CATEGORY,
    space = true, apply = ApplySpacing,
})
ns.RegisterFontSettings({
    prefix = "chat", label = "Font", section = SECTION, category = CATEGORY, apply = ApplyFont,
    beside = true,
    size = { 10, 24, BLIZZARD_SIZE }, outline = "default", button = "Font",
    blizzard = function()
        local o = original[ChatFrame1] or ns.FontState(ChatFrame1)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "chatHideButtons", label = "Hide chat buttons", section = SECTION, category = CATEGORY,
    tooltip = "Hide the buttons beside the chat windows.",
    apply = ApplyButtons,
})
ns.RegisterFeature({
    key = "chatEditBoxTop", label = "Chat message on top", section = SECTION, category = CATEGORY,
    tooltip = "Type chat messages above the chat tabs.",
    beside = true, apply = ApplyEditBoxes,
})

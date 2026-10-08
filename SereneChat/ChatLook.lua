-------------------------------------------------------------------------------
--  Chat Look -- the chat windows' font and line spacing, and how long a line
--  stays before it fades. While the font settings match Blizzard's own (its
--  typeface and outline at size 14) each window keeps the size picked in its
--  tab menu.
--  The edit boxes always go without their frame, in their window's font and
--  on a background like the window's.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION, CATEGORY = "Chat", "Look"
local BLIZZARD_SIZE = 14  -- CHAT_FRAME_DEFAULT_FONT_SIZE

local original = {}  -- chat frame -> ns.FontState before the first change

-- The edit boxes lose their frame and get a background like their
-- window's. Blizzard shows and hides the frame's focus half, never changes
-- the alpha.
local BORDER = { "Left", "Mid", "Right", "FocusLeft", "FocusMid", "FocusRight" }

local background = {}  -- edit box -> { its background, its window's Background }

-- The window's background fades in under the mouse, so the box copies it
-- while shown rather than once.
local function CopyBackground(box)
    local b = background[box]
    b[1]:SetVertexColor(b[2]:GetVertexColor())
    b[1]:SetAlpha(b[2]:GetAlpha())
end

local function DressEditBoxes()
    for _, name in ipairs(CHAT_FRAMES) do
        local box = _G[name .. "EditBox"]
        if not background[box] then
            for _, part in ipairs(BORDER) do _G[name .. "EditBox" .. part]:SetAlpha(0) end
            local window = _G[name .. "Background"]
            local tex = box:CreateTexture(nil, "BACKGROUND", nil, -8)
            tex:SetColorTexture(1, 1, 1)
            -- As wide as the window's; the box's 32 px less 5 at top and bottom.
            -- The box sits 4 px above the window background's bottom edge.
            tex:SetPoint("TOPLEFT", window, "BOTTOMLEFT", 0, -1)
            tex:SetPoint("BOTTOMRIGHT", window, "BOTTOMRIGHT", 0, -23)
            background[box] = { tex, window }
            box:HookScript("OnUpdate", CopyBackground)
        end
    end
end

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

local function ApplySpacing()
    local spacing = ns.Get("chatLineSpacing")
    ChatFrameUtil.ForEachChatFrame(function(frame) frame:SetSpacing(spacing) end)
end

-- A whisper window takes its font from the window it opens from.
hooksecurefunc("FCF_OpenTemporaryWindow", function()
    ApplyFont()
    ApplyFade()
    ApplySpacing()
    DressEditBoxes()
end)

local login = CreateFrame("Frame")
login:RegisterEvent("PLAYER_LOGIN")
login:SetScript("OnEvent", function(self)
    self:UnregisterAllEvents()
    DressEditBoxes()
end)

ns.RegisterFontSettings({
    prefix = "chat", label = "Font", section = SECTION, category = CATEGORY, apply = ApplyFont,
    size = { 10, 24, BLIZZARD_SIZE }, outline = "default", button = "Font settings",
    blizzard = function()
        local o = original[ChatFrame1] or ns.FontState(ChatFrame1)
        return ns.OutlineOf(o.flags, o.sx, o.sy)
    end,
})
ns.RegisterFeature({
    key = "chatFade", label = "Fade old lines", section = SECTION, category = CATEGORY,
    beside = true, apply = ApplyFade,
})
ns.RegisterFeature({
    key = "chatFadeTime", label = "Fade after", section = SECTION, category = CATEGORY, type = "slider",
    min = 10, max = 600, step = 10, default = 120, suffix = " s", requires = "chatFade",
    apply = ApplyFade,
})
ns.RegisterFeature({
    key = "chatLineSpacing", label = "Line spacing", section = SECTION, category = CATEGORY, type = "slider",
    min = 0, max = 10, step = 1, default = 3, suffix = " px", apply = ApplySpacing,
})

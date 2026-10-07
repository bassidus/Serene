-------------------------------------------------------------------------------
--  Chat Look -- the chat windows' font, and how long a line stays before it
--  fades. While the font settings match Blizzard's own (its typeface and
--  outline at size 14) each window keeps the size picked in its tab menu.
--  The edit boxes can drop their frame, take their window's font and get a
--  background like the window's.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION, CATEGORY = "Chat", "Look"
local BLIZZARD_SIZE = 14  -- CHAT_FRAME_DEFAULT_FONT_SIZE

local original = {}  -- chat frame -> ns.FontState before the first change

-- The edit box's frame: Blizzard shows and hides the focus half, never
-- changes their alpha.
local BORDER = { "Left", "Mid", "Right", "FocusLeft", "FocusMid", "FocusRight" }

local function ApplyBorder()
    local alpha = ns.Get("chatEditNoFrame") and 0 or 1
    for _, name in ipairs(CHAT_FRAMES) do
        for _, part in ipairs(BORDER) do _G[name .. "EditBox" .. part]:SetAlpha(alpha) end
    end
end

local background = {}  -- edit box -> { its background, its window's Background }

-- The window's background fades in under the mouse, so the box copies it
-- while shown rather than once.
local function CopyBackground(box)
    local b = background[box]
    b[1]:SetVertexColor(b[2]:GetVertexColor())
    b[1]:SetAlpha(b[2]:GetAlpha())
end

local function ApplyBackground()
    local on = ns.Get("chatEditBackground")
    for _, name in ipairs(CHAT_FRAMES) do
        local box = _G[name .. "EditBox"]
        if on and not background[box] then
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
        if background[box] then background[box][1]:SetShown(on) end
    end
end

local editOriginal = {}  -- edit box or one of its texts -> ns.FontState before the first change

-- Follows the window's own font, whether set here or in its tab menu.
local function ApplyEditFont()
    local follow = ns.Get("chatEditFont")
    for _, name in ipairs(CHAT_FRAMES) do
        local frame, box = _G[name], _G[name .. "EditBox"]
        for _, fs in ipairs({ box, box.header, box.headerSuffix, box.languageHeader, box.NewcomerHint, box.prompt }) do
            if follow then
                editOriginal[fs] = editOriginal[fs] or ns.FontState(fs)
                fs:SetFont(frame:GetFont())
                fs:SetShadowColor(frame:GetShadowColor())
                fs:SetShadowOffset(frame:GetShadowOffset())
            elseif editOriginal[fs] then
                ns.RestoreFont(fs, editOriginal[fs])
            end
        end
    end
end

hooksecurefunc("FCF_SetChatWindowFontSize", ApplyEditFont)

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
    ApplyEditFont()
end

local function ApplyFade()
    local fade, seconds = ns.Get("chatFade"), ns.Get("chatFadeTime")
    ChatFrameUtil.ForEachChatFrame(function(frame)
        frame:SetFading(fade)
        frame:SetTimeVisible(seconds)
    end)
end

-- A whisper window takes its font from the window it opens from.
hooksecurefunc("FCF_OpenTemporaryWindow", function()
    ApplyFont()
    ApplyFade()
    ApplyBorder()
    ApplyBackground()
end)

ns.RegisterFeature({
    key = "chatEditNoFrame", label = "No frame around the edit box", section = SECTION, category = "Edit box",
    apply = ApplyBorder,
})
ns.RegisterFeature({
    key = "chatEditFont", label = "Edit box in the chat font", section = SECTION, category = "Edit box",
    beside = true, apply = ApplyEditFont,
})
ns.RegisterFeature({
    key = "chatEditBackground", label = "Edit box background like the chat", section = SECTION,
    category = "Edit box", apply = ApplyBackground,
})

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

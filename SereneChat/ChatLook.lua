-------------------------------------------------------------------------------
--  Chat Look -- the chat windows' font, and how long a line stays before it
--  fades. While the font settings match Blizzard's own (its typeface and
--  outline at size 14) each window keeps the size picked in its tab menu.
-------------------------------------------------------------------------------
local _, ns = ...

local SECTION, CATEGORY = "Chat", "Look"
local BLIZZARD_SIZE = 14  -- CHAT_FRAME_DEFAULT_FONT_SIZE

local original = {}  -- chat frame -> ns.FontState before the first change

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

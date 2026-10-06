-------------------------------------------------------------------------------
--  Tooltip Hints -- removes two lines Blizzard adds at the end of tooltips,
--  with the blank line above each: "Press F6 to submit an issue ..." from the
--  beta's feedback addon, and "<Right click for Frame Settings>" on unit
--  frames. The tooltip is shown again to shrink. Hooked on Show (a visible
--  tooltip refreshed) and OnShow (SetShown(true) bypasses Show).
-------------------------------------------------------------------------------
local _, ns = ...

local LAST = 3  -- how many of the last lines are searched

local function IsHint(txt)
    return txt == UNIT_POPUP_RIGHT_CLICK or txt:find("to submit an issue", 1, true)
end

local function Blank(fs)
    fs:SetText("")
    fs:Hide()
end

local function Strip(tt, name)
    if tt:IsForbidden() then return end
    local n = tt:NumLines()
    for i = n, math.max(2, n - LAST + 1), -1 do
        local left = _G[name .. "TextLeft" .. i]
        local txt = ns.Clean(left:GetText())
        if txt and IsHint(txt) then
            Blank(left)
            Blank(_G[name .. "TextRight" .. i])
            local prev = _G[name .. "TextLeft" .. (i - 1)]
            local prevText = ns.Clean(prev:GetText())
            if prevText and strtrim(prevText) == "" then Blank(prev) end
            -- Re-layout without the blanked lines; the hint is gone now, so the
            -- Show hook this triggers finds nothing and stops.
            tt:Show()
            return
        end
    end
end

for _, name in ipairs(ns.TOOLTIPS) do
    local function OnShow(self) Strip(self, name) end
    hooksecurefunc(_G[name], "Show", OnShow)
    _G[name]:HookScript("OnShow", OnShow)
end

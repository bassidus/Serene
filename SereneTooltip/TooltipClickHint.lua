-------------------------------------------------------------------------------
--  Hide Right Click Hint -- removes the "<Right click for Frame Settings>"
--  line (and the blank line above it) that unit frames add as the last line
--  of the unit tooltip. Blizzard adds both and then shows the tooltip, so a
--  Show hook sees them; they are blanked and the tooltip re-shown to shrink.
-------------------------------------------------------------------------------
local _, ns = ...

local function Blank(fs)
    fs:SetText("")
    fs:Hide()
end

local function Strip(tt)
    if tt:IsForbidden() then return end
    local n = tt:NumLines()
    if n < 2 then return end
    local last = _G["GameTooltipTextLeft" .. n]
    if ns.Clean(last:GetText()) ~= UNIT_POPUP_RIGHT_CLICK then return end
    Blank(last)
    local prev = _G["GameTooltipTextLeft" .. (n - 1)]
    local prevText = ns.Clean(prev:GetText())
    if prevText and strtrim(prevText) == "" then Blank(prev) end
    -- Re-layout without the blanked lines; the hint is gone now, so the Show
    -- hook this triggers finds nothing and stops.
    pcall(tt.Show, tt)
end

hooksecurefunc(GameTooltip, "Show", Strip)

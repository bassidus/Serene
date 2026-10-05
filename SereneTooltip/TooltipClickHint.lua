-------------------------------------------------------------------------------
--  Hide Right Click Hint -- removes the "<Right click for Frame Settings>"
--  line (and the blank line above it) that unit frames add to the unit
--  tooltip. Blizzard adds both and then shows the tooltip, so a Show hook
--  sees them; they are blanked and the tooltip re-shown to shrink.
-------------------------------------------------------------------------------
local _, ns = ...

local HINT = UNIT_POPUP_RIGHT_CLICK or "<Right click for Frame Settings>"
local SEARCH = 4  -- the hint is last, unless another addon appended after it

local issecret = issecretvalue
local function ReadText(fs)
    local txt = fs and fs:GetText()
    if not txt or (issecret and issecret(txt)) then return nil end
    return txt
end

local function Blank(fs)
    if fs then
        fs:SetText("")
        fs:Hide()
    end
end

local function Strip(tt)
    if not ns.Enabled("tooltipHideClickHint") or tt:IsForbidden() then return end
    local n = tt:NumLines()
    for i = n, math.max(2, n - SEARCH + 1), -1 do
        local left = _G["GameTooltipTextLeft" .. i]
        if ReadText(left) == HINT then
            Blank(left)
            local prev = _G["GameTooltipTextLeft" .. (i - 1)]
            local prevText = ReadText(prev)
            if prevText and strtrim(prevText) == "" then Blank(prev) end
            -- Re-layout without the blanked lines; the hint is gone now, so the
            -- Show hook this triggers finds nothing and stops.
            pcall(tt.Show, tt)
            return
        end
    end
end

hooksecurefunc(GameTooltip, "Show", Strip)

ns.RegisterFeature({
    key = "tooltipHideClickHint", label = "Hide Right Click Hint", section = "Tooltip",
    tooltip = "Removes the \"<Right click for Frame Settings>\" line from unit frame tooltips.",
})

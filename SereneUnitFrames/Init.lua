local _, ns = ...
setmetatable(ns, { __index = Serene })

-------------------------------------------------------------------------------
--  Pages -- each frame has settings of its own, a view of the Unit frames
--  page picked in its dropdown; the target's and focus's targets share one.
--  The first view, All, holds what several frames share (UnitFrameAll.lua).
--  A page's keys start with its prefix: page.key.HideName is
--  "playerFrameHideName".
--  They are built once, since target of target styles itself every frame.
-------------------------------------------------------------------------------
local SECTION = "Unit frames"

local PAGES = {
    { id = "player", view = "Player", frames = { PlayerFrame } },
    { id = "target", view = "Target", frames = { TargetFrame } },
    { id = "tot",    view = "Target of target", frames = { TargetFrameToT, FocusFrameToT } },
    { id = "focus",  view = "Focus",  frames = { FocusFrame } },
    { id = "pet",    view = "Pet",    frames = { PetFrame } },
    { id = "party",  view = "Party",  frames = { PartyFrame.MemberFrame1, PartyFrame.MemberFrame2,
                                                 PartyFrame.MemberFrame3, PartyFrame.MemberFrame4 } },
}

ns.ALL_VIEW = "All"

local byId, byFrame, all, views = {}, {}, {}, { ns.ALL_VIEW }
for _, page in ipairs(PAGES) do
    page.section = SECTION
    views[#views + 1] = page.view
    local prefix = page.id .. "Frame"
    page.prefix = prefix
    page.key = setmetatable({}, { __index = function(keys, name)
        keys[name] = prefix .. name
        return keys[name]
    end })
    byId[page.id] = page
    for _, frame in ipairs(page.frames) do
        byFrame[frame] = page
        all[#all + 1] = frame
    end
end

-- The pages with these ids, for a setting only some frames have; every
-- page without ids.
function ns.FramePages(...)
    if select("#", ...) == 0 then return PAGES end
    local list = {}
    for i = 1, select("#", ...) do list[i] = byId[select(i, ...)] end
    return list
end

-- The page a frame follows; nil for the frames we leave alone (boss, arena),
-- which go through the same Blizzard updates.
function ns.FramePage(frame) return byFrame[frame] end

function ns.UnitFrames() return all end

ns.SetPageViews(SECTION, views)
-- The same places in every view; a view leaves out what its frame lacks.
ns.SetCategoryOrder(SECTION, { "Appearance", "Name", "Health & mana", "Hide", "Level" })

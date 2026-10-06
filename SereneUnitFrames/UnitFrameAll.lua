-------------------------------------------------------------------------------
--  All -- the first view of the Unit frames page: each setting that more
--  than one frame has, once, and a change goes to every frame that has it
--  (links, see ns.RegisterFeature). Made last, from the frames' own
--  settings, so it follows whatever they have.
-------------------------------------------------------------------------------
local _, ns = ...

local pageOf = {}  -- [view] = page
for _, page in ipairs(ns.FramePages()) do pageOf[page.view] = page end

-- A setting's name is its key without the page's prefix ("Dark").
local names, links, first = {}, {}, {}
for _, f in ipairs(ns.features) do
    local page = type(f.view) == "string" and pageOf[f.view]
    if page and f.section == page.section then
        local name = f.key:sub(#page.prefix + 1)
        if not links[name] then
            links[name], first[name] = {}, f
            names[#names + 1] = name
        end
        table.insert(links[name], f.key)
    end
end

-- Each copy looks like the first frame's setting.
local copies = {}  -- [the first frame's setting] = ours
for _, name in ipairs(names) do
    if #links[name] > 1 then
        local c = {}
        for k, v in pairs(first[name]) do c[k] = v end
        c.key, c.view, c.links, c.apply = "allFrames" .. name, ns.ALL_VIEW, links[name], nil
        copies[first[name]] = c
    end
end

-- A font group's settings and color point to each other, so ours get a
-- group of their own.
local groups = {}
for f, c in pairs(copies) do
    local g = f.group
    if g then
        if not groups[g] then
            local color = g.color and copies[ns.featureByKey[g.color]]
            groups[g] = { label = g.label, button = g.button, color = color and color.key }
        end
        c.group = groups[g]
        for _, part in ipairs({ "font", "size", "outline" }) do
            if g[part] == f then c.group[part] = c end
        end
    end
end

for _, name in ipairs(names) do
    local c = copies[first[name]]
    if c then ns.RegisterFeature(c) end
end

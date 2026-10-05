-- Settings, fonts and helpers come from Serene; this addon's own values
-- stay in its own namespace.
local _, ns = ...
setmetatable(ns, { __index = Serene })

ns.AddHint("Hold Shift to skip auto loot and auto quests.")
ns.AddHint("/rl reloads the UI.")

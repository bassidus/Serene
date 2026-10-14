-- Lists the top-level SereneDB keys that no code reads any more: settings
-- that were removed or renamed, and the keys of probe files that are gone.
-- With --apply it removes them: the game must be closed, the file is backed
-- up next to itself first, and every other value is checked to come back
-- unchanged before the file is replaced.
--
-- A key counts as read when the code has it as a string literal, as
-- SereneDB.<key>, as a literal followed by .. (keys built in a loop, like
-- "showBar" .. bar) or as a font group's prefix plus Font, FontSize or Outline.
--
-- Usage: lua tools/sv-clean.lua [--apply] [path to Serene.lua SavedVariables]
local apply = arg[1] == "--apply"
local SV = arg[apply and 2 or 1]
    or "/mnt/wd1000/Battle.net/World of Warcraft/_classic_beta_/WTF/Account/817318#2/SavedVariables/Serene.lua"
local ROOT = (arg[0]:match("^(.*)/[^/]*$") or ".") .. "/.."

local function Read(path)
    local f = assert(io.open(path, "rb"))
    local text = f:read("a")
    f:close()
    return text
end

local function LoadDB(path)
    local env = {}
    local chunk = assert(loadfile(path, "t", env))
    chunk()
    return assert(env.SereneDB, "no SereneDB in " .. path)
end

-------------------------------------------------------------------------------
--  What the code reads
-------------------------------------------------------------------------------
local literals, prefixes, fields = {}, {}, {}
local files = io.popen('ls "' .. ROOT .. '"/Serene*/*.lua')
for path in files:lines() do
    local code = Read(path)
    for s, rest in code:gmatch('"([%w_]+)"(%s*%.?%.?)') do
        literals[s] = true
        if rest:find("..", 1, true) then prefixes[s] = true end
    end
    for name in code:gmatch("SereneDB%.([%w_]+)") do fields[name] = true end
end
files:close()

local function IsRead(key)
    if literals[key] or fields[key] then return true end
    local base = key:match("^(.-)FontSize$") or key:match("^(.-)Font$") or key:match("^(.-)Outline$")
    if base and literals[base] then return true end
    for p in pairs(prefixes) do
        if #p >= 4 and key:sub(1, #p) == p then return true end
    end
    return false
end

local db = LoadDB(SV)
local stale = {}
for key in pairs(db) do
    if not IsRead(key) then stale[#stale + 1] = key end
end
table.sort(stale)

if #stale == 0 then
    print("SereneDB: no stale keys")
    os.exit(0)
end
print("SereneDB: keys no code reads:")
for _, key in ipairs(stale) do print("  " .. key) end
if not apply then
    print("Run with --apply (game closed) to remove them.")
    os.exit(1)
end

-------------------------------------------------------------------------------
--  --apply
-------------------------------------------------------------------------------
-- The client (WowB.exe for the beta) writes the file back as it closes. The
-- pattern can't match its own command line: "[" follows "Wow" there.
local running = SV:find("World of Warcraft", 1, true)
    and io.popen([[pgrep -fi 'Wow[A-Z]?\.exe']]):read("a") or ""
if running ~= "" then
    print("The game is running; it would write the old keys back. Close it first.")
    os.exit(1)
end

local function Key(k)
    if type(k) == "string" then return ("[%q]"):format(k) end
    return "[" .. ("%.17g"):format(k) .. "]"
end
local function Value(v)
    local t = type(v)
    if t == "string" then return ("%q"):format(v) end
    if t == "number" then return ("%.17g"):format(v) end
    if t == "boolean" then return tostring(v) end
    assert(t == "table", "can't write a " .. t)
    local keys, parts = {}, { "{" }
    for k in pairs(v) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b)
        if type(a) == type(b) then return a < b end
        return type(a) == "number"
    end)
    for _, k in ipairs(keys) do parts[#parts + 1] = Key(k) .. " = " .. Value(v[k]) .. "," end
    parts[#parts + 1] = "}"
    return table.concat(parts, "\n")
end

local function Equal(a, b)
    if type(a) ~= type(b) then return false end
    if type(a) ~= "table" then return a == b end
    for k, v in pairs(a) do if not Equal(v, b[k]) then return false end end
    for k in pairs(b) do if a[k] == nil then return false end end
    return true
end

for _, key in ipairs(stale) do db[key] = nil end
local tmp = SV .. ".new"
local f = assert(io.open(tmp, "w"))
f:write("\nSereneDB = ", Value(db), "\n")
f:close()
assert(Equal(LoadDB(tmp), db), "the rewritten file does not read back the same; nothing replaced")

local backup = SV .. ".bak-" .. os.date("%Y%m%d-%H%M%S")
assert(os.rename(SV, backup))
assert(os.rename(tmp, SV))
print(("Removed %d key(s). Backup: %s"):format(#stale, backup))

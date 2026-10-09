-- Writes Forever Probe's SavedVariables as reports, one folder per client
-- build under tools/ForeverProbe/reports/:
--   api.txt          every global function, C_* function, Enum value and named frame
--   api-changes.md   what came and went in api.txt and signatures.txt since
--                    the previous build with a report
--   units.md         which unit API returns are secret, per unit kind and combat state
--   events.md        event argument types, secret ones marked
--   docs/            Blizzard's API documentation, one file per system
--   docs-secret.md   every documented function, event or field that mentions secrets
--   signatures.txt   one line per documented function, event and table
--
-- Usage: lua tools/probe-report.lua [path to ForeverProbe.lua SavedVariables]
local SV = arg[1] or "/mnt/wd1000/Battle.net/World of Warcraft/_classic_beta_/WTF/Account/817318#2/SavedVariables/ForeverProbe.lua"
local OUT = (arg[0]:match("^(.*)/[^/]*$") or ".") .. "/ForeverProbe/reports"

dofile(SV)
local builds = assert(ForeverProbeDB and ForeverProbeDB.builds, "no ForeverProbeDB.builds in " .. SV)

local function Write(path, text)
    local f = assert(io.open(path, "w"))
    f:write(text)
    f:close()
end

local function Read(path)
    local f = io.open(path)
    if not f then return nil end
    local text = f:read("a")
    f:close()
    return text
end

local function SortedKeys(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys)
    return keys
end

-- "1.60.1.70291" < "1.60.1.70300", compared number by number.
local function VersionLess(a, b)
    local na, nb = {}, {}
    for n in a:gmatch("%d+") do na[#na + 1] = tonumber(n) end
    for n in b:gmatch("%d+") do nb[#nb + 1] = tonumber(n) end
    for i = 1, math.max(#na, #nb) do
        local x, y = na[i] or 0, nb[i] or 0
        if x ~= y then return x < y end
    end
    return false
end

local function ReportDirs()
    local dirs = {}
    local p = io.popen('ls -1 "' .. OUT .. '" 2>/dev/null')
    for line in p:lines() do dirs[#dirs + 1] = line end
    p:close()
    table.sort(dirs, VersionLess)
    return dirs
end

local function Header(key, db, title)
    local i = db.info or {}
    return ("# %s, build %s\n\nClient %s (build %s, %s), Interface %s.\n\n")
        :format(title, key, tostring(i.version), tostring(i.build), tostring(i.date), tostring(i.interface))
end

-- A cell: S always secret, ok never secret, S/ok both seen, err on an error.
local function Cell(o)
    if not o then return "" end
    local secret, clean, err = 0, 0, 0
    for kind, n in pairs(o.kinds) do
        if kind == "SECRET" then
            secret = secret + n
        elseif kind == "error" then
            err = err + n
        else
            clean = clean + n
        end
    end
    if err > 0 and secret == 0 and clean == 0 then return "err" end
    if secret > 0 and clean > 0 then return "**S**/ok" end
    if secret > 0 then return "**S**" end
    return "ok"
end

local function Units(key, db)
    local ctxs = SortedKeys(db.units or {})
    local labels, seen = {}, {}
    for _, ctx in ipairs(ctxs) do
        for label in pairs(db.units[ctx].values) do
            if not seen[label] then
                seen[label] = true
                labels[#labels + 1] = label
            end
        end
    end
    table.sort(labels)

    local out = { Header(key, db, "Unit values") }
    out[#out + 1] = "**S** secret every time, ok never secret, **S**/ok both seen, err the call failed (missing API or bad arguments). "
        .. "A blank cell was not returned there.\n\n"
    out[#out + 1] = "## Unit kinds\n\n| # | Unit | Relation | State | Samples | Mobs seen |\n|---|---|---|---|---|---|\n"
    for i, ctx in ipairs(ctxs) do
        local token, rel, state = ctx:match("^(.-) | (.-) | (.-)$")
        local slot = db.units[ctx]
        out[#out + 1] = ("| %d | %s | %s | %s | %d | %s |\n"):format(i, token, rel, state, slot.n, table.concat(slot.names, ", "))
    end

    out[#out + 1] = "\n## Secret or not\n\nColumns are the unit kinds above.\n\n| API |"
    for i in ipairs(ctxs) do out[#out + 1] = " " .. i .. " |" end
    out[#out + 1] = "\n|---|"
    for _ in ipairs(ctxs) do out[#out + 1] = "---|" end
    out[#out + 1] = "\n"
    for _, label in ipairs(labels) do
        out[#out + 1] = "| `" .. label .. "` |"
        for _, ctx in ipairs(ctxs) do out[#out + 1] = " " .. Cell(db.units[ctx].values[label]) .. " |" end
        out[#out + 1] = "\n"
    end

    out[#out + 1] = "\n## Last clean values\n\nWhat each call returned last time it was not secret, per unit kind.\n"
    for i, ctx in ipairs(ctxs) do
        out[#out + 1] = ("\n### %d. %s\n\n"):format(i, ctx)
        local values = db.units[ctx].values
        for _, label in ipairs(SortedKeys(values)) do
            local o = values[label]
            if o.last ~= "SECRET" then out[#out + 1] = "- `" .. label .. "`: " .. tostring(o.last) .. "\n" end
        end
    end
    return table.concat(out)
end

local function Events(key, db)
    local out = { Header(key, db, "Event arguments") }
    out[#out + 1] = "Each line is one argument pattern and how often it came. Unit and power tokens are shown as values, "
        .. "everything else as its type. SECRET marks a secret argument.\n"
    local failed = SortedKeys(db.registerFailed or {})
    if #failed > 0 then
        out[#out + 1] = "\n## Could not register\n\n"
        for _, ev in ipairs(failed) do out[#out + 1] = "- `" .. ev .. "`: " .. db.registerFailed[ev] .. "\n" end
    end
    for _, ev in ipairs(SortedKeys(db.events or {})) do
        out[#out + 1] = "\n## " .. ev .. "\n"
        for _, ctx in ipairs(SortedKeys(db.events[ev])) do
            local slot = db.events[ev][ctx]
            out[#out + 1] = ("\n%s, %d recorded:\n\n"):format(ctx, slot.n)
            for _, p in ipairs(SortedKeys(slot.patterns)) do
                out[#out + 1] = ("- %dx `%s`\n"):format(slot.patterns[p], p)
            end
        end
    end
    return table.concat(out)
end

-------------------------------------------------------------------------------
--  API documentation. Rendered generically: the keys Blizzard documents
--  everywhere get a fixed place, any other key (secret rules and the like)
--  is listed as key=value.
-------------------------------------------------------------------------------
local PLACED = { Name = true, Type = true, Nilable = true, Documentation = true, Arguments = true,
    Returns = true, Payload = true, Fields = true, Values = true, InnerType = true, Mixin = true,
    Default = true, LiteralName = true, Functions = true, Events = true, Tables = true,
    Namespace = true, System = true, EnumValue = true, Function = true, Event = true, Table = true }

local function Compact(v)
    if type(v) ~= "table" then return tostring(v) end
    local parts = {}
    for _, k in ipairs(SortedKeys(v)) do parts[#parts + 1] = tostring(k) .. "=" .. Compact(v[k]) end
    return "{" .. table.concat(parts, ", ") .. "}"
end

local function SortedKeysAny(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    return keys
end

local function Extras(t)
    local parts = {}
    for _, k in ipairs(SortedKeysAny(t)) do
        if not PLACED[k] then parts[#parts + 1] = tostring(k) .. "=" .. Compact(t[k]) end
    end
    return parts
end

-- SecretArguments (which arguments may be secret) is on nearly every
-- function and NeverSecret says the opposite, so neither counts.
local function MentionsSecret(t)
    for _, part in ipairs(Extras(t)) do
        if part:lower():find("secret") and not part:find("^SecretArguments") and not part:find("^NeverSecret") then
            return true
        end
    end
    return false
end

local function TypeText(p)
    local t = tostring(p.Type)
    if p.InnerType then t = t .. "<" .. tostring(p.InnerType) .. ">" end
    if p.Mixin then t = t .. " (" .. tostring(p.Mixin) .. ")" end
    if p.Nilable then t = t .. "?" end
    return t
end

local function DocText(t)
    if type(t.Documentation) ~= "table" or #t.Documentation == 0 then return "" end
    return " -- " .. table.concat(t.Documentation, " ")
end

local function ParamLine(p)
    local extras = Extras(p)
    if p.Default ~= nil then table.insert(extras, 1, "default=" .. tostring(p.Default)) end
    if p.EnumValue ~= nil then table.insert(extras, 1, "= " .. tostring(p.EnumValue)) end
    local tail = #extras > 0 and " [" .. table.concat(extras, ", ") .. "]" or ""
    return ("- `%s`: %s%s%s\n"):format(tostring(p.Name), TypeText(p), tail, DocText(p))
end

-- Extra keys ride along, so a changed secret rule shows in api-changes.md.
local function WithExtras(text, t)
    local extras = Extras(t)
    return #extras > 0 and text .. " [" .. table.concat(extras, ", ") .. "]" or text
end

local function Signature(list)
    local parts = {}
    for _, p in ipairs(list or {}) do parts[#parts + 1] = WithExtras(tostring(p.Name) .. ": " .. TypeText(p), p) end
    return table.concat(parts, ", ")
end

local function FunctionName(system, f)
    return system.Namespace and (system.Namespace .. "." .. tostring(f.Name)) or tostring(f.Name)
end

-- Fills out (lines of the system's file), sigs and secrets.
local function RenderSystem(system, sigs, secrets)
    local out = { ("# %s\n"):format(tostring(system.Name)) }
    if system.Namespace then out[#out + 1] = ("\nNamespace `%s`.\n"):format(system.Namespace) end
    local extras = Extras(system)
    if #extras > 0 then out[#out + 1] = "\n" .. table.concat(extras, ", ") .. "\n" end

    local function Item(kind, title, t, lists)
        out[#out + 1] = ("\n### %s%s\n"):format(title, DocText(t))
        local ex = Extras(t)
        if #ex > 0 then out[#out + 1] = "\n" .. table.concat(ex, ", ") .. "\n" end
        local secret = MentionsSecret(t)
        local secretLines = {}
        for _, list in ipairs(lists) do
            local items = t[list[1]]
            if type(items) == "table" and #items > 0 then
                out[#out + 1] = "\n" .. list[2] .. ":\n\n"
                for _, p in ipairs(items) do
                    local line = ParamLine(p)
                    out[#out + 1] = line
                    if MentionsSecret(p) then
                        secret = true
                        secretLines[#secretLines + 1] = "  " .. list[2]:lower() .. " " .. line
                    end
                end
            end
        end
        if secret then
            secrets.n = secrets.n + 1
            secrets[#secrets + 1] = ("- %s `%s` (%s)%s\n"):format(kind, title, tostring(system.Name),
                #ex > 0 and ": " .. table.concat(ex, ", ") or "")
            for _, l in ipairs(secretLines) do secrets[#secrets + 1] = l end
        end
    end

    if type(system.Functions) == "table" and #system.Functions > 0 then
        out[#out + 1] = "\n## Functions\n"
        for _, f in ipairs(system.Functions) do
            local name = FunctionName(system, f)
            Item("function", name, f, { { "Arguments", "Arguments" }, { "Returns", "Returns" } })
            sigs[#sigs + 1] = WithExtras(("%s(%s) -> %s"):format(name, Signature(f.Arguments), Signature(f.Returns)), f)
        end
    end
    if type(system.Events) == "table" and #system.Events > 0 then
        out[#out + 1] = "\n## Events\n"
        for _, e in ipairs(system.Events) do
            local name = tostring(e.LiteralName or e.Name)
            Item("event", name, e, { { "Payload", "Payload" } })
            sigs[#sigs + 1] = WithExtras(("event %s(%s)"):format(name, Signature(e.Payload)), e)
        end
    end
    if type(system.Tables) == "table" and #system.Tables > 0 then
        out[#out + 1] = "\n## Tables\n"
        for _, t in ipairs(system.Tables) do
            local name = tostring(t.Name)
            Item(tostring(t.Type or "table"):lower(), name, t, { { "Fields", "Fields" }, { "Values", "Values" } })
            local fields = {}
            for _, f in ipairs(t.Fields or t.Values or {}) do
                fields[#fields + 1] = tostring(f.Name) .. (f.EnumValue ~= nil and "=" .. tostring(f.EnumValue) or ": " .. TypeText(f))
            end
            sigs[#sigs + 1] = ("%s %s {%s}"):format(tostring(t.Type or "table"):lower(), name, table.concat(fields, ", "))
        end
    end
    return table.concat(out)
end

local function Docs(key, db, dir)
    local docs = db.docs
    if not docs then return end
    if docs.error then
        Write(dir .. "/docs-secret.md", Header(key, db, "API documentation") .. "Not saved: " .. docs.error .. "\n")
        return
    end
    os.execute('rm -rf "' .. dir .. '/docs"; mkdir -p "' .. dir .. '/docs"')
    local sigs, secrets, index = {}, { n = 0 }, {}
    local systems = {}
    for _, system in ipairs(docs.systems) do systems[#systems + 1] = system end
    table.sort(systems, function(a, b) return tostring(a.Name) < tostring(b.Name) end)
    for _, system in ipairs(systems) do
        local file = tostring(system.Name):gsub("[^%w_]", "_") .. ".md"
        Write(dir .. "/docs/" .. file, RenderSystem(system, sigs, secrets))
        index[#index + 1] = ("| [%s](%s) | %s | %d | %d | %d |\n"):format(tostring(system.Name), file,
            system.Namespace or "", #(system.Functions or {}), #(system.Events or {}), #(system.Tables or {}))
    end
    Write(dir .. "/docs/README.md", Header(key, db, "API documentation")
        .. "| System | Namespace | Functions | Events | Tables |\n|---|---|---|---|---|\n" .. table.concat(index))
    Write(dir .. "/docs-secret.md", Header(key, db, "Secret rules in the API documentation")
        .. "Every documented function, event or table whose own keys, or whose arguments, returns, payload or fields, "
        .. "mention secrets. The full entries are in docs/.\n\n" .. table.concat(secrets))
    table.sort(sigs)
    Write(dir .. "/signatures.txt", table.concat(sigs, "\n") .. "\n")
    print(("%s: %d documented systems, %d signatures, %d secret entries"):format(key, #systems, #sigs, secrets.n))
end

-------------------------------------------------------------------------------
--  Changes since the previous build
-------------------------------------------------------------------------------
local function Lines(text)
    local set = {}
    for line in (text or ""):gmatch("[^\n]+") do set[line] = true end
    return set
end

local function Diff(out, title, before, now)
    local added, removed = {}, {}
    for line in pairs(now) do if not before[line] then added[#added + 1] = line end end
    for line in pairs(before) do if not now[line] then removed[#removed + 1] = line end end
    table.sort(added)
    table.sort(removed)
    out[#out + 1] = ("\n## %s: added (%d)\n\n"):format(title, #added)
    for _, line in ipairs(added) do out[#out + 1] = "- `" .. line .. "`\n" end
    out[#out + 1] = ("\n## %s: removed (%d)\n\n"):format(title, #removed)
    for _, line in ipairs(removed) do out[#out + 1] = "- `" .. line .. "`\n" end
    return #added, #removed
end

local function Changes(key, db, dir, previous)
    local out = { Header(key, db, "API changes") }
    out[#out + 1] = "Compared with build " .. previous .. ". Changed signatures show as removed and added.\n"
    local summary = {}
    for _, file in ipairs({ { "api.txt", "API names" }, { "signatures.txt", "Documented signatures" } }) do
        local old, new = Read(OUT .. "/" .. previous .. "/" .. file[1]), Read(dir .. "/" .. file[1])
        if old and new then
            local a, r = Diff(out, file[2], Lines(old), Lines(new))
            summary[#summary + 1] = ("%s +%d -%d"):format(file[2], a, r)
        end
    end
    Write(dir .. "/api-changes.md", table.concat(out))
    print(("%s: since %s: %s"):format(key, previous, table.concat(summary, ", ")))
end

for _, key in ipairs(SortedKeys(builds)) do
    local db = builds[key]
    local dir = OUT .. "/" .. key
    os.execute('mkdir -p "' .. dir .. '"')
    local earlier
    for _, d in ipairs(ReportDirs()) do
        if VersionLess(d, key) then earlier = d end
    end
    if db.api then Write(dir .. "/api.txt", table.concat(db.api, "\n") .. "\n") end
    Docs(key, db, dir)
    if earlier then Changes(key, db, dir, earlier) end
    Write(dir .. "/units.md", Units(key, db))
    Write(dir .. "/events.md", Events(key, db))
    print("Wrote " .. dir)
end

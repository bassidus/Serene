-------------------------------------------------------------------------------
--  No Error Speech -- turns off the character's voice lines for errors ("Not
--  enough mana", "Out of range"...). The red error text itself is left as is.
--  Turning it off puts Blizzard's default back, but only if Serene set the
--  value (SereneDB.errorSpeechSet), so a choice made elsewhere is left alone.
-------------------------------------------------------------------------------
local _, ns = ...

local CVAR = "Sound_EnableErrorSpeech"

local function Apply()
    if ns.Get("noErrorSpeech") then
        SetCVar(CVAR, "0")
        SereneDB.errorSpeechSet = true
    elseif SereneDB.errorSpeechSet then
        SetCVar(CVAR, GetCVarDefault(CVAR))
        SereneDB.errorSpeechSet = nil
    end
end

ns.RegisterFeature({
    key = "noErrorSpeech", label = "No error speech", section = "General", category = "Interface",
    apply = Apply,
})

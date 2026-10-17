# FrameScript

Environment=All, Predicates={}

## Functions

### AddSourceLocationExclude

SecretArguments=AllowedWhenUntainted

Arguments:

- `fileName`: cstring

### canaccessallvalues -- Returns true if the immediate calling function has appropriate permissions to access and operate on all supplied values.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `canAccessAllValues`: bool

### canaccesssecrets -- Returns true if the immediate calling function has appropriate permissions to access or operate on secret values.

SecureHooksAllowed=false

Returns:

- `canAccessSecrets`: bool

### canaccesstable -- Returns true if the immediate calling function has appropriate permissions to index secret tables. This will return false if the caller cannot access the table value itself, or if access to the table contents is disallowed by taint.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `table`: LuaValueReference

Returns:

- `canAccessTable`: bool

### canaccessvalue -- Returns true if the immediate calling function has appropriate permissions to access and operate on a specific value.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `value`: LuaValueReference

Returns:

- `canAccessValue`: bool

### CreateFrameWithOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CreateFrameOptions

Returns:

- `frame`: SimpleFrame

### CreateFromMixins

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `mixins`: LuaValueVariant [StrideIndex=1]

Returns:

- `object`: LuaValueVariant

### CreateSecureDelegate -- Creates a secure delegate closure for a Lua function. The delegate invokes the original function in a protected call context with secure execution taint, and supports passing and returning values directly.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `luaFunction`: LuaValueReference -- The Lua function to invoke through the secure delegate.
- `options`: SecureDelegateOptions? -- Optional settings controlling secure delegate behavior. If omitted, default options are used.

Returns:

- `secureDelegateFunction`: LuaValueReference -- A secure delegate function that calls through to the original Lua function.

### CreateWindow

SecretArguments=AllowedWhenUntainted

Arguments:

- `popupStyle`: bool [default=true]
- `topMost`: bool [default=false]

Returns:

- `window`: SimpleWindow?

### dropsecretaccess -- Removes the ability for the immediate calling function to access secret values.

SecureHooksAllowed=false

### dumpobject -- Invokes the '__dump' metamethod on any value (if present), returning its result.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `value`: LuaValueReference?

Returns:

- `result`: LuaValueReference?

### GetCallstackHeight

Returns:

- `height`: number

### GetCurrentEventID

Returns:

- `eventID`: number?

### GetErrorCallstackHeight

Returns:

- `height`: number?

### GetEventTime

MayReturnNothing=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `eventProfileIndex`: number

Returns:

- `totalElapsedTime`: number
- `numExecutedHandlers`: number
- `slowestHandlerName`: cstring
- `slowestHandlerTime`: number

### GetForbiddenObjectTable

Environment=SecureOnly, SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `object`: FrameScriptObject

Returns:

- `forbiddenTable`: FrameScriptObject

### GetScriptBucketThrottleLimits

Returns:

- `limits`: ScriptBucketThrottleLimits

### GetSourceLocation

MayReturnNothing=true

Returns:

- `location`: string

### hasanysecretvalues -- Returns true if a supplied value is a secret value.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `isAnyValueSecret`: bool

### issecrettable -- Returns true if a supplied value is a secret table. This function will return true if the table value itself is secret, or if flags on the table are set such that accesses of the table would produce secrets.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `table`: LuaValueReference

Returns:

- `isSecretOrContentsSecret`: bool

### issecretvalue -- Returns true if a supplied value is a secret value.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `value`: LuaValueReference

Returns:

- `isSecret`: bool

### mapvalues -- Applies a given function over all supplied values individually, replacing the value with the result of the call.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `func`: LuaValueReference
- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `mapped`: LuaValueReference [StrideIndex=1]

### Mixin

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `object`: LuaValueVariant
- `mixins`: LuaValueVariant [StrideIndex=1]

Returns:

- `outObject`: LuaValueVariant

### RegisterEventCallback

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `eventName`: cstring
- `callback`: EventCallbackType

### RegisterUnitEventCallback

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `eventName`: cstring
- `callback`: EventCallbackType
- `unit`: UnitToken

### RunScript

SecretArguments=AllowedWhenUntainted

Arguments:

- `text`: cstring

### scrubsecretvalues -- Returns a transformed list of values with inputs that are secret values replaced by nil values.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `scrubbed`: LuaValueReference [StrideIndex=1]

### scrub -- Returns a transformed list of values with inputs that are either secret or are not string, number, or boolean type replaced by nil values.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `scrubbed`: LuaValueReference [StrideIndex=1]

### secretunwrap -- Unwraps all supplied secrets, converting them back to regular values.

HasRestrictions=true, SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `unwrapped`: LuaValueReference [StrideIndex=1]

### secretwrap -- Converts all supplied values to secret values, preventing most operations on them from occurring on tainted code paths.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `values`: LuaValueReference [StrideIndex=1]

Returns:

- `wrapped`: LuaValueReference [StrideIndex=1]

### securecallmethod -- Invokes a named method on an object with a secure call barrier that prevents errors or taint from function lookup and execution from propagating to the caller.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `object`: LuaValueReference -- The table on which to look up the named method from. Lookup of the method uses raw access and ignores any associated metatable.
- `method`: cstring -- The name of a method to retrieve.
- `arguments`: LuaValueReference [StrideIndex=1] -- Arguments to supply to the method. The initial 'object' parameter is always supplied as the first argument, followed by these values.

Returns:

- `results`: LuaValueReference [StrideIndex=1] -- Results from the executed function. If an error occurred, this result list will be empty.

### securecopy -- Securely copies a Lua value. Tables are deep-copied with recursive and shared references preserved. Copied values receive the current execution taint.

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `value`: LuaValueReference? -- The Lua value to copy.
- `options`: SecureCopyOptions? -- Optional settings controlling value copying behavior. If omitted, default secure copy options are used.

Returns:

- `copy`: LuaValueReference -- The copied value. For tables, recursive and shared references within the copied graph are preserved.

### SetErrorCallstackHeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `height`: number?

### settablesecurity

HasRestrictions=true, SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `table`: LuaValueVariant
- `option`: TableSecurityOption

### UnregisterEventCallback

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `eventName`: cstring
- `callback`: EventCallbackType

### UnregisterUnitEventCallback

SecretArguments=AllowedWhenUntainted, SecureHooksAllowed=false

Arguments:

- `eventName`: cstring
- `callback`: EventCallbackType
- `unit`: UnitToken

### debugprofilestart -- Starts a timer for profiling. The final time can be obtained by calling debugprofilestop.

### debugprofilestop -- Returns the time in milliseconds since the last debugprofilestart call.

Returns:

- `elapsedMilliseconds`: number

## Tables

### TableSecurityOption

MaxValue=2, MinValue=0, NumValues=3

Fields:

- `DisallowTaintedAccess`: TableSecurityOption [= 0]
- `DisallowSecretKeys`: TableSecurityOption [= 1]
- `SecretWrapContents`: TableSecurityOption [= 2]

### CreateFrameOptions

Fields:

- `frameType`: cstring
- `name`: cstring?
- `parent`: SimpleFrame?
- `inherits`: table<cstring>?
- `id`: number?
- `forbidden`: bool [default=false]
- `hidden`: bool [default=false]

### ScriptBucketThrottleLimits

Fields:

- `luaScriptBucketThrottleMaxMsPerSecondNormal`: number
- `luaScriptBucketThrottleMaxMsPerSecondRestricted`: number
- `luaScriptBucketThrottleMaxMsBurstNormal`: number
- `luaScriptBucketThrottleMaxMsBurstRestricted`: number

### SecureCopyOptions

Fields:

- `maxTraversalDepth`: number [default=100] -- Maximum table nesting depth allowed during recursive copying.
- `wrapUntrustedFunctions`: bool [default=true] -- Wrap function values in secure closures that call through using the original function taint.
- `permitScriptObjects`: bool [default=false] -- If true, preserve references to script objects in the copied output. By default, script objects will raise an error.

### SecureDelegateOptions

Fields:

- `wrapUntrustedFunctions`: bool [default=true] -- Wrap function arguments in secure closures that call through using the original function taint.

### EventCallbackType

# SimpleFrameScriptObjectAPI

Environment=All, Predicates={}

## Functions

### AddAccessRestrictions -- Adds access restrictions to a script object, preventing it from being used in API calls when enforced.

HasRestrictions=true, SecretArguments=NotAllowed

Arguments:

- `restrictions`: ScriptObjectAccessRestriction

### AddForbiddenAspects -- Adds forbidden aspects to a script object, restricting access to various functionalities such as script bindings.

HasRestrictions=true, SecretArguments=NotAllowed

Arguments:

- `aspects`: ForbiddenAspect

### AddSecretAspect

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `aspect`: SecretAspect [NeverSecret=true]

### CanBeAccessedInContext -- Returns whether the current Lua execution context has permission to access this object.

SecretReturnsForAspect={1=1}

Returns:

- `canAccess`: bool -- False if access is denied, such as when execution is tainted and the object is forbidden or enforcing access restrictions.

### GetAccessRestrictions -- Returns the mask of all access restrictions applied to this object.

SecretReturnsForAspect={1=1}

Returns:

- `restrictions`: ScriptObjectAccessRestriction

### GetForbiddenAspects -- Returns the mask of all forbidden aspects applied to this object.

SecretReturnsForAspect={1=1}

Returns:

- `aspects`: ForbiddenAspect

### GetInheritableForbiddenAspects -- Returns the mask of all forbidden aspects applied to this object that can propagate to others.

SecretArguments=NotAllowed, SecretReturnsForAspect={1=1}

Arguments:

- `path`: ScriptObjectPropagationPath

Returns:

- `aspects`: ForbiddenAspect

### GetName

SecretReturnsForAspect={1=1}

Returns:

- `name`: cstring

### GetObjectTable

Returns:

- `objectTable`: FrameScriptObject

### GetObjectType

SecretReturnsForAspect={1=1}

Returns:

- `objectType`: cstring

### HasAccessConstraints -- Returns whether this object has any access constraints that may limit access from some Lua execution contexts.

SecretReturnsForAspect={1=1}

Returns:

- `hasAccessConstraints`: bool -- True if this object is forbidden or subject to conditional access restrictions.

### HasAnyAccessRestrictions -- Returns true if this object has any of the supplied access restrictions applied.

SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `restrictions`: ScriptObjectAccessRestriction?

Returns:

- `hasAnyAccessRestriction`: bool

### HasAnyForbiddenAspects -- Returns true if this object has any of the supplied forbidden aspects added.

SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `aspects`: ForbiddenAspect?

Returns:

- `hasAnyForbiddenAspect`: bool

### HasAnySecretAspect

SecretReturnsForAspect={1=1}

Returns:

- `hasSecretAspect`: bool

### HasSecretAspect

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `aspect`: SecretAspect

Returns:

- `hasSecretAspect`: bool

### HasSecretValues

SecretReturnsForAspect={1=1}

Returns:

- `hasSecretValues`: bool

### IsForbidden -- Returns whether this object has been explicitly marked as forbidden.

SecretReturnsForAspect={1=1}

Returns:

- `isForbidden`: bool -- True if this object has been explicitly marked as forbidden, regardless of the current Lua execution context.

### IsObjectType

ConstSecretAccessor=true, SecretArguments=AllowedWhenUntainted, SecretReturnsForAspect={1=1}

Arguments:

- `objectType`: cstring

Returns:

- `isType`: bool

### IsPreventingSecretValues

SecretReturnsForAspect={1=1}

Returns:

- `isPreventingSecretValues`: bool

### SetForbidden

HasRestrictions=true

### SetToDefaults -- Reset all script accessible values to their default values. If possible, clears secret states.

ChecksForbiddenAspects={1={Argument=self, Aspect=1}, 2={Argument=self, Aspect=512}}, IsProtectedFunction=true

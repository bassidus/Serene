# UISystemVisibilityManager

Namespace `C_SystemVisibilityManager`.

Environment=All, Predicates={}

## Functions

### C_SystemVisibilityManager.IsSystemVisible

SecretArguments=AllowedWhenUntainted

Arguments:

- `system`: UISystemType

Returns:

- `visible`: bool

## Events

### SYSTEM_VISIBILITY_CHANGED

UniqueEvent=true

## Tables

### UISystemType

MaxValue=0, MinValue=0, NumValues=1

Fields:

- `InGameNavigation`: UISystemType [= 0]

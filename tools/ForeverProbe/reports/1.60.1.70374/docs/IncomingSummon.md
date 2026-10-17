# IncomingSummon

Namespace `C_IncomingSummon`.

Environment=All, Predicates={}

## Functions

### C_IncomingSummon.HasIncomingSummon

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `summon`: bool

### C_IncomingSummon.IncomingSummonStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `unit`: UnitToken

Returns:

- `status`: SummonStatus

## Tables

### SummonStatus

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `None`: SummonStatus [= 0]
- `Pending`: SummonStatus [= 1]
- `Accepted`: SummonStatus [= 2]
- `Declined`: SummonStatus [= 3]

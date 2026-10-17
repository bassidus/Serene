# LimitedInput

Namespace `C_LimitedInput`.

Environment=All, Predicates={}

## Functions

### C_LimitedInput.LimitedInputAllowed

SecretArguments=AllowedWhenUntainted

Arguments:

- `type`: LimitedInputType

Returns:

- `allowed`: bool

## Tables

### LimitedInputType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `MouseMove`: LimitedInputType [= 0]
- `MouseDown`: LimitedInputType [= 1]
- `MouseUp`: LimitedInputType [= 2]
- `MouseWheel`: LimitedInputType [= 3]

# UnitHealPredictionCalculatorAPI

Environment=All, ObjectType=Userdata, Predicates={}

## Functions

### EvaluateCurrentHealthPercent -- Calculates the percentage of current unit health and evaluates it against the supplied curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `curve`: LuaCurveObjectBase

Returns:

- `result`: LuaCurveEvaluatedResult

### EvaluateMissingHealthPercent -- Calculates the percentage of missing unit health and evaluates it against the supplied curve.

SecretArguments=AllowedWhenUntainted

Arguments:

- `curve`: LuaCurveObjectBase

Returns:

- `result`: LuaCurveEvaluatedResult

### GetCurrentHealth -- Returns the base amount of unit health.

Returns:

- `currentHealth`: number

### GetCurrentHealthPercent -- Returns the percentage of current unit health.

Returns:

- `currentHealthPercent`: number

### GetDamageAbsorbClampMode -- Returns the configured damage absorb clamping mode.

ReturnsNeverSecret=true

Returns:

- `damageAbsorbClampMode`: UnitDamageAbsorbClampMode

### GetDamageAbsorbs -- Calculates damage absorb values and clamping according to the configured options.

Returns:

- `amount`: number -- Amount of applied damage absorb affects with potential reductions from clamping included.
- `clamped`: bool -- If true, the value is in excess of the clamp boundary.

### GetHealAbsorbClampMode -- Returns the configured heal absorb clamping mode.

ReturnsNeverSecret=true

Returns:

- `healAbsorbClampMode`: UnitHealAbsorbClampMode

### GetHealAbsorbMode -- Returns the configured heal absorb processing mode.

ReturnsNeverSecret=true

Returns:

- `healAbsorbMode`: UnitHealAbsorbMode

### GetHealAbsorbs -- Calculates heal absorb values and clamping according to the configured options.

Returns:

- `amount`: number -- Amount of applied heal absorb affects with potential reductions from incoming heals and clamping included.
- `clamped`: bool -- If true, the value is in excess of the clamp boundary.

### GetIncomingHealClampMode -- Returns the configured incoming heal clamping mode.

ReturnsNeverSecret=true

Returns:

- `incomingHealClampMode`: UnitIncomingHealClampMode

### GetIncomingHealOverflowPercent -- Returns the configured incoming heal maximum overflow percentage.

ReturnsNeverSecret=true

Returns:

- `incomingHealOverflowPercent`: number

### GetIncomingHeals -- Calculates incoming heal values and clamping according to the configured options.

Returns:

- `amount`: number -- Amount of incoming heals across all units with potential reductions from heal absorb effects included.
- `amountFromHealer`: number -- Amount of incoming heals from the healer unit. Will never exceed the all-units value.
- `amountFromOthers`: number -- Amount of incoming heals from units other than theh healer. Calculated as the difference between amount and amount-from-healer.
- `clamped`: bool -- If true, the value is in excess of the clamp boundary.

### GetMaximumDamageAbsorbs -- Returns the maximum clamping amount for damage absorbs.

Returns:

- `maximumDamageAbsorbs`: number

### GetMaximumHealAbsorbs -- Returns the maximum clamping amount for heal absorbs.

Returns:

- `maximumHealAbsorbs`: number

### GetMaximumHealth -- Returns the base amount of maximum unit health.

Returns:

- `maximumHealth`: number

### GetMaximumHealthMode -- Returns the configured maximum health mode.

ReturnsNeverSecret=true

Returns:

- `maximumHealthMode`: UnitMaximumHealthMode

### GetMaximumIncomingHeals -- Returns the maximum clamping amount for incoming heals.

Returns:

- `maximumIncomingHeals`: number

### GetMissingHealth -- Returns the base amount of missing unit health.

Returns:

- `missingHealth`: number

### GetMissingHealthPercent -- Returns the percentage of missing unit health.

Returns:

- `missingHealthPercent`: number

### GetPredictedValues -- Returns the raw total figures used for data calculations.

Returns:

- `predictedValues`: UnitHealPredictionValues

### GetTotalDamageAbsorbs -- Returns the base total amount of all applied damage absorb shields.

Returns:

- `totalDamageAbsorbs`: number

### GetTotalHealAbsorbs -- Returns the base total amount of all applied heal absorption effects.

Returns:

- `totalHealAbsorbs`: number

### GetTotalIncomingHeals -- Returns the base total amount of all incoming heals.

Returns:

- `totalIncomingHeals`: number

### GetTotalIncomingHealsFromHealer -- Returns the base total amount of all incoming heals from the healer unit, if any.

Returns:

- `totalIncomingHealsFromHealer`: number

### HasSecretValues -- Returns true if the object has been configured with any secret values.

ReturnsNeverSecret=true

Returns:

- `hasSecretValues`: bool

### Reset -- Resets all stored state on the object.

### ResetPredictedValues -- Resets all stored healing values used for calculations.

### SetDamageAbsorbClampMode -- Changes the clamping mode used when calculating damage absorb amounts.

SecretArguments=NotAllowed

Arguments:

- `damageAbsorbClampMode`: UnitDamageAbsorbClampMode

### SetHealAbsorbClampMode -- Changes the clamping mode used when calculating heal absorb amounts.

SecretArguments=NotAllowed

Arguments:

- `healAbsorbClampMode`: UnitHealAbsorbClampMode

### SetHealAbsorbMode -- Changes the processing mode used when calculating both heal absorb and incoming heal amounts.

SecretArguments=NotAllowed

Arguments:

- `healAbsorbMode`: UnitHealAbsorbMode

### SetIncomingHealClampMode -- Changes the clamping mode used when calculating incoming heal amounts.

SecretArguments=NotAllowed

Arguments:

- `incomingHealClampMode`: UnitIncomingHealClampMode

### SetIncomingHealOverflowPercent -- Changes the maximum overflow percentage for incoming heals. Increasing this to a value over 1.0 will mean that incoming heals can extend beyond maximum health.

SecretArguments=NotAllowed

Arguments:

- `incomingHealOverflowPercent`: number

### SetMaximumHealthMode -- Changes the calculation mode for maximum health values used for clamping.

SecretArguments=NotAllowed

Arguments:

- `maximumHealthMode`: UnitMaximumHealthMode

### SetPredictedValues -- Sets the healing values used for all calculations.

SecretArguments=AllowedWhenUntainted

Arguments:

- `predictedValues`: UnitHealPredictionValues

### SetToDefaults -- Resets all state on the object, and clears the secret values flag.

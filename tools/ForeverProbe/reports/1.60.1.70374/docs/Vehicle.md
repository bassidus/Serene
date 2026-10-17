# Vehicle

Namespace `C_Vehicle`.

Environment=All, Predicates={}

## Events

### PLAYER_GAINS_VEHICLE_DATA

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `vehicleUIIndicatorID`: number

### PLAYER_LOSES_VEHICLE_DATA

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_ENTERED_VEHICLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `showVehicleFrame`: bool
- `isControlSeat`: bool
- `vehicleUIIndicatorID`: number
- `vehicleGUID`: WOWGUID
- `mayChooseExit`: bool
- `hasPitch`: bool

### UNIT_ENTERING_VEHICLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant
- `showVehicleFrame`: bool
- `isControlSeat`: bool
- `vehicleUIIndicatorID`: number
- `vehicleGUID`: WOWGUID
- `mayChooseExit`: bool
- `hasPitch`: bool

### UNIT_EXITED_VEHICLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### UNIT_EXITING_VEHICLE

SynchronousEvent=true

Payload:

- `unitTarget`: UnitTokenVariant

### VEHICLE_ANGLE_SHOW

SynchronousEvent=true

Payload:

- `shouldShow`: number?

### VEHICLE_PASSENGERS_CHANGED

SynchronousEvent=true

### VEHICLE_POWER_SHOW

SynchronousEvent=true

Payload:

- `shouldShow`: number?

### VEHICLE_UPDATE

SynchronousEvent=true

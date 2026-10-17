# Console

Environment=All, Predicates={}

## Functions

### CalculateStringEditDistance

SecretArguments=AllowedWhenUntainted

Arguments:

- `firstString`: stringView
- `secondString`: stringView

Returns:

- `distance`: number

### ConsoleEcho

SecretArguments=AllowedWhenUntainted

Arguments:

- `command`: cstring
- `addToHistory`: bool [default=false]
- `prefix`: cstring?

Returns:

- `result`: bool

### ConsoleExec

SecretArguments=AllowedWhenUntainted

Arguments:

- `command`: cstring
- `addToHistory`: bool [default=false]

Returns:

- `result`: bool

### ConsoleGetAllCommands

Returns:

- `commands`: table<ConsoleCommandInfo>

### ConsoleGetColorFromType

SecretArguments=AllowedWhenUntainted

Arguments:

- `colorType`: ConsoleColorType

Returns:

- `color`: colorRGB (ColorMixin)

### ConsoleGetFontHeight

Returns:

- `fontHeightInPixels`: number

### ConsoleIsActive

Returns:

- `consoleIsActive`: bool

### ConsolePrintAllMatchingCommands

SecretArguments=AllowedWhenUntainted

Arguments:

- `partialCommandText`: cstring

### ConsoleSetFontHeight

SecretArguments=AllowedWhenUntainted

Arguments:

- `fontHeightInPixels`: number

### SetConsoleKey

SecretArguments=AllowedWhenUntainted

Arguments:

- `keystring`: cstring

## Events

### CONSOLE_CLEAR

UniqueEvent=true

### CONSOLE_COLORS_CHANGED

UniqueEvent=true

### CONSOLE_FONT_SIZE_CHANGED

UniqueEvent=true

### CONSOLE_LOG

SynchronousEvent=true

Payload:

- `message`: cstring

### CONSOLE_MESSAGE

SynchronousEvent=true

Payload:

- `message`: cstring
- `colorType`: number

### CVAR_UPDATE

SynchronousEvent=true

Payload:

- `eventName`: cstring
- `value`: cstring

### TOGGLE_CONSOLE

SynchronousEvent=true

Payload:

- `showConsole`: bool?

## Tables

### ConsoleCategory

MaxValue=10, MinValue=0, NumValues=11

Fields:

- `Debug`: ConsoleCategory [= 0]
- `Graphics`: ConsoleCategory [= 1]
- `Console`: ConsoleCategory [= 2]
- `Combat`: ConsoleCategory [= 3]
- `Game`: ConsoleCategory [= 4]
- `Default`: ConsoleCategory [= 5]
- `Net`: ConsoleCategory [= 6]
- `Sound`: ConsoleCategory [= 7]
- `Gm`: ConsoleCategory [= 8]
- `Reveal`: ConsoleCategory [= 9]
- `None`: ConsoleCategory [= 10]

### ConsoleColorType

MaxValue=11, MinValue=0, NumValues=12

Fields:

- `DefaultColor`: ConsoleColorType [= 0]
- `InputColor`: ConsoleColorType [= 1]
- `EchoColor`: ConsoleColorType [= 2]
- `ErrorColor`: ConsoleColorType [= 3]
- `WarningColor`: ConsoleColorType [= 4]
- `GlobalColor`: ConsoleColorType [= 5]
- `AdminColor`: ConsoleColorType [= 6]
- `HighlightColor`: ConsoleColorType [= 7]
- `BackgroundColor`: ConsoleColorType [= 8]
- `ClickbufferColor`: ConsoleColorType [= 9]
- `PrivateColor`: ConsoleColorType [= 10]
- `DefaultGreen`: ConsoleColorType [= 11]

### ConsoleCommandType

MaxValue=3, MinValue=0, NumValues=4

Fields:

- `Cvar`: ConsoleCommandType [= 0]
- `Command`: ConsoleCommandType [= 1]
- `Macro`: ConsoleCommandType [= 2]
- `Script`: ConsoleCommandType [= 3]

### ConsoleCommandInfo

Fields:

- `command`: cstring
- `help`: cstring
- `category`: ConsoleCategory
- `commandType`: ConsoleCommandType
- `scriptContents`: cstring
- `scriptParameters`: cstring

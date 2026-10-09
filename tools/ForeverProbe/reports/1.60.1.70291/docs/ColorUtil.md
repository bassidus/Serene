# ColorUtil

Namespace `C_ColorUtil`.

Environment=All, Predicates={}

## Functions

### C_ColorUtil.ConvertHSLToHSV -- Converts an unpacked HSL color to HSV.

SecretArguments=AllowedWhenUntainted

Arguments:

- `hslH`: number
- `hslS`: number
- `hslL`: number

Returns:

- `hsvH`: number
- `hsvS`: number
- `hsvV`: number

### C_ColorUtil.ConvertHSVToHSL -- Converts an unpacked HSV color to HSL.

SecretArguments=AllowedWhenUntainted

Arguments:

- `hsvH`: number
- `hsvS`: number
- `hsvV`: number

Returns:

- `hslH`: number
- `hslS`: number
- `hslL`: number

### C_ColorUtil.ConvertHSVToRGB -- Converts an unpacked HSV color to RGB.

SecretArguments=AllowedWhenUntainted

Arguments:

- `hsvH`: number
- `hsvS`: number
- `hsvV`: number

Returns:

- `rgbR`: number
- `rgbG`: number
- `rgbB`: number

### C_ColorUtil.ConvertRGBToHSV -- Converts an unpacked RGB color to HSV. For achromatic inputs, the returned hue will be -1.

SecretArguments=AllowedWhenUntainted

Arguments:

- `rgbR`: number
- `rgbG`: number
- `rgbB`: number

Returns:

- `hsvH`: number
- `hsvS`: number
- `hsvV`: number

### C_ColorUtil.GenerateTextColorCode -- Generates a hex color code suitable for use in text color code markup.

SecretArguments=AllowedWhenTainted

Arguments:

- `color`: colorRGB (ColorMixin) -- Color to generate a hex color code from.

Returns:

- `textColorCode`: string -- Hex representation of the color formatted as an 8-byte ARGB string, with alpha forced to 255.

### C_ColorUtil.WrapTextInColor -- Wraps a given string with color code markup.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- Text to be wrapped in color markup.
- `color`: colorRGB (ColorMixin) -- Color to apply to the text.

Returns:

- `coloredText`: string -- The input text wrapped in '|c' and '|r' quoted code sequences for the supplied color.

### C_ColorUtil.WrapTextInColorCode -- Wraps a given string with color code markup.

SecretArguments=AllowedWhenTainted

Arguments:

- `text`: cstring -- Text to be wrapped in color markup.
- `textColorCode`: cstring -- Color to apply to the text, formatted as an 8-byte ARGB string as returned by GenerateTextColorCode.

Returns:

- `coloredText`: string -- The input text wrapped in '|c' and '|r' quoted code sequences for the supplied color.

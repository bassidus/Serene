# AuraContainerUtil

Namespace `C_AuraContainerUtil`.

Environment=All, Predicates={}

## Functions

### C_AuraContainerUtil.ProcessAuraTooltipBackdropOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: AuraContainerTooltipBackdropOptions

Returns:

- `result`: AuraContainerTooltipBackdropOptions

### C_AuraContainerUtil.ProcessAuraTooltipNineSliceOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: AuraContainerTooltipNineSliceOptions

Returns:

- `result`: AuraContainerTooltipNineSliceOptions

### C_AuraContainerUtil.ProcessAuraTooltipTextureSliceOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: AuraContainerTooltipTextureSliceOptions

Returns:

- `result`: AuraContainerTooltipTextureSliceOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonApplicationBarOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonApplicationBarOptions

Returns:

- `result`: CustomAuraButtonApplicationBarOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonApplicationCountOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonApplicationCountOptions?

Returns:

- `result`: CustomAuraButtonApplicationCountOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonCasterNameOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonCasterNameOptions?

Returns:

- `result`: CustomAuraButtonCasterNameOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonDispelTypeTextOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonDispelTypeTextOptions?

Returns:

- `result`: CustomAuraButtonDispelTypeTextOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonDispelTypeTextureOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonDispelTypeTextureOptions?

Returns:

- `result`: CustomAuraButtonDispelTypeTextureOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonDurationBarOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonDurationBarOptions?

Returns:

- `result`: CustomAuraButtonDurationBarOptions

### C_AuraContainerUtil.ProcessCustomAuraButtonDurationTextOptions

SecretArguments=AllowedWhenUntainted

Arguments:

- `options`: CustomAuraButtonDurationTextOptions?

Returns:

- `result`: CustomAuraButtonDurationTextOptions

## Tables

### AuraContainerTooltipAnchorOffsets

Fields:

- `left`: number [default=0]
- `right`: number [default=0]
- `top`: number [default=0]
- `bottom`: number [default=0]

### AuraContainerTooltipBackdropInfo

Fields:

- `bgFile`: TextureAssetDisk? -- Optional background texture asset.
- `edgeFile`: TextureAssetDisk? -- Optional edge texture asset.
- `edgeSize`: number? -- Optional edge size.
- `insets`: AuraContainerTooltipBackdropInsets? -- Optional backdrop insets.
- `tile`: bool? -- If true, tiles the background texture.
- `tileEdge`: bool? -- If true, tiles the edge texture.
- `tileSize`: number? -- Optional tile size used when tiling the background texture.

### AuraContainerTooltipBackdropInsets

Fields:

- `left`: number [default=0]
- `right`: number [default=0]
- `top`: number [default=0]
- `bottom`: number [default=0]

### AuraContainerTooltipBackdropOptions

Fields:

- `backdropInfo`: AuraContainerTooltipBackdropInfo -- Backdrop information used to construct the tooltip backdrop.
- `borderColor`: colorRGBA (ColorMixin)? -- Optional color applied to the backdrop border.
- `centerColor`: colorRGBA (ColorMixin)? -- Optional color applied to the backdrop background.
- `anchorOffsets`: AuraContainerTooltipAnchorOffsets? -- Optional offsets applied to the backdrop's TOPLEFT and BOTTOMRIGHT anchor points.

### AuraContainerTooltipNineSliceOptions

Fields:

- `layoutName`: cstring -- Name of the NineSlice layout template to apply, such as 'TooltipDefaultLayout'.
- `borderColor`: colorRGBA (ColorMixin)? -- Optional color applied to the NineSlice border.
- `centerColor`: colorRGBA (ColorMixin)? -- Optional color applied to the NineSlice center region.
- `anchorOffsets`: AuraContainerTooltipAnchorOffsets? -- Optional offsets applied to the NineSlice's TOPLEFT and BOTTOMRIGHT anchor points.

### AuraContainerTooltipTextureSliceOptions

Fields:

- `asset`: TextureAssetDisk -- Texture asset (file path or atlas name) displayed by the slice.
- `sliceMargins`: UITextureSliceMargins? -- Optional texture slice margins. See Texture:SetTextureSliceMargins.
- `sliceMode`: UITextureSliceMode? -- Optional texture slice mode. See Texture:SetTextureSliceMode.
- `color`: colorRGBA (ColorMixin)? -- Optional vertex color applied to the texture.
- `anchorOffsets`: AuraContainerTooltipAnchorOffsets? -- Optional offsets applied to the slice's TOPLEFT and BOTTOMRIGHT anchor points.
- `drawLayer`: DrawLayer? -- Draw layer used when displaying the texture.
- `drawLayerSublevel`: number [default=0] -- Draw layer sublevel used when displaying the texture.

### CustomAuraButtonApplicationBarOptions

Fields:

- `maxApplications`: number -- The maximum number of aura applications represented by the bar.
- `minApplications`: number [default=0] -- The minimum number of aura applications represented by the bar.
- `interpolation`: StatusBarInterpolation? -- Optional interpolation method used when updating the bar value.

### CustomAuraButtonApplicationCountOptions

Fields:

- `formatter`: NumericFormatter? -- Optional formatter used to display aura application counts.

### CustomAuraButtonCasterNameOptions

Fields:

- `showRealmName`: bool [default=false] -- If true, append realm names to the displayed string.
- `useClassColors`: bool [default=false] -- If true, apply class coloring to the text.

### CustomAuraButtonDispelTypeTextOptions

Fields:

- `showWhenHarmful`: bool [default=true] -- Shows the dispel type text for harmful auras.
- `showWhenHelpful`: bool [default=false] -- Shows the dispel type text for helpful auras.
- `showWithoutDispelType`: bool [default=false] -- Shows the dispel type text for auras that do not have a dispel type.
- `customDispelTextMap`: table<stringView>? [KeyType=string] -- Optional map of dispel type names to custom texts. An empty key can be used for auras without a dispel type.

### CustomAuraButtonDispelTypeTextureAsset

Fields:

- `asset`: TextureAssetDisk -- The texture file or atlas to use.
- `useAtlasSize`: bool [default=false] -- Resizes the texture to the atlas dimensions. Ignored when asset does not name an atlas.
- `texCoords`: CustomAuraButtonDispelTypeTextureTexCoords? -- Optional texture coordinates used when asset does not name an atlas.

### CustomAuraButtonDispelTypeTextureOptions

Fields:

- `showAlways`: bool [default=false] -- Shows the dispel type texture always, ignoring all other criteria.
- `showWhenHarmful`: bool [default=true] -- Shows the dispel type texture for harmful auras.
- `showWhenHelpful`: bool [default=false] -- Shows the dispel type texture for helpful auras.
- `showWithoutDispelType`: bool [default=false] -- Shows the dispel type texture for auras that do not have a dispel type.
- `stealableFilter`: CustomAuraButtonDispelTypeStealableFilter? -- Restricts display of the dispel type texture to either stealable or non-stealable auras. If omitted, the dispel type texture may be shown for both.
- `style`: CustomAuraButtonDispelTypeTextureStyle [default=BorderWithIcon] -- The texture style to use.
- `customDispelAssetMap`: table<CustomAuraButtonDispelTypeTextureAsset>? [KeyType=string] -- Optional map of dispel type names to custom texture assets. The "None" key represents auras without a dispel type. Only applies when using the CustomAsset style.
- `customDispelColorMap`: table<colorRGB>? [KeyType=string] -- Optional map of dispel type names to custom vertex colors. The "None" key represents auras without a dispel type.
- `customDispelColorCurve`: LuaColorCurveObject? -- Optional curve used to determine vertex colors from the aura's dispel type.

### CustomAuraButtonDispelTypeTextureTexCoords

Fields:

- `left`: number [default=0]
- `right`: number [default=1]
- `top`: number [default=0]
- `bottom`: number [default=1]

### CustomAuraButtonDurationBarOptions

Fields:

- `interpolation`: StatusBarInterpolation? -- The interpolation method used when updating the duration bar.
- `direction`: StatusBarTimerDirection? -- The direction in which the duration bar progresses.

### CustomAuraButtonDurationTextOptions

Fields:

- `binding`: DurationTextBinding? -- Optional duration text binding to use. The binding is copied before being associated with the aura button.
- `textFormatter`: NumericFormatter? -- Optional formatter used to display remaining duration values. Ignored if textFormat is specified.
- `textFormat`: DurationTextBindingFormatOptions? -- Optional text format configuration applied to the duration text binding. Overrides textFormatter when specified.
- `textColor`: DurationTextBindingColorOptions? -- Optional text color configuration applied to the duration text binding.

# UIFileAssetAPI

Namespace `C_UIFileAsset`.

Environment=All, Predicates={}

## Functions

### C_UIFileAsset.GetFileID -- Returns the numeric file ID associated with a file asset.

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: FileAsset

Returns:

- `assetFileID`: fileID? -- The file ID corresponding to the given asset. If the asset is already a file ID, it is returned unchanged; otherwise returns nil if the file path is not known to the client.

### C_UIFileAsset.IsKnownFile -- Determines whether a file asset is known to the client, either as a shipped asset or a locally existing loose file.

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: FileAsset

Returns:

- `isValid`: bool -- True if the asset is shipped with the client or refers to a known loose file. Existence or openability of loose files is not verified.

### C_UIFileAsset.IsLooseFile -- Determines whether a file asset refers to a known loose (local) file.

SecretArguments=AllowedWhenUntainted

Arguments:

- `asset`: FileAsset

Returns:

- `isLooseFile`: bool -- True if the asset refers to a loose file known to the client.

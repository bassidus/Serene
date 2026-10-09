# PhotoSharingUI

Namespace `C_PhotoSharing`.

Environment=All, Predicates={}

## Functions

### C_PhotoSharing.BeginAuthorizationFlow

### C_PhotoSharing.ClearAuthorization

### C_PhotoSharing.CompleteAuthorizationFlow

SecretArguments=AllowedWhenUntainted

Arguments:

- `callbackURL`: cstring

### C_PhotoSharing.GetCropRatio

Returns:

- `cropRatio`: number

### C_PhotoSharing.GetPhotoSharingAuthURL

Returns:

- `authUrl`: cstring

### C_PhotoSharing.GetStatus

Returns:

- `status`: PhotoSharingStatus

### C_PhotoSharing.IsAuthorized

Returns:

- `authorized`: bool

### C_PhotoSharing.IsEnabled

Returns:

- `enabled`: bool

### C_PhotoSharing.SetScreenshotPreviewTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture

### C_PhotoSharing.TakePhoto

### C_PhotoSharing.UploadPhotoToService

SecretArguments=AllowedWhenUntainted

Arguments:

- `optionalTitle`: cstring [default=]
- `optionalDescription`: cstring [default=]

## Events

### PHOTO_SHARING_AUTHORIZATION_NEEDED

SynchronousEvent=true

### PHOTO_SHARING_AUTHORIZATION_UPDATED

SynchronousEvent=true

Payload:

- `showNotification`: bool

### PHOTO_SHARING_PHOTO_UPLOAD_STATUS

SynchronousEvent=true

Payload:

- `uploadStatus`: PhotoSharingUploadStatus

### PHOTO_SHARING_SCREENSHOT_READY

SynchronousEvent=true

### PHOTO_SHARING_THIRD_PARTY_AUTHORIZATION_NEEDED

SynchronousEvent=true

Payload:

- `authUrl`: string

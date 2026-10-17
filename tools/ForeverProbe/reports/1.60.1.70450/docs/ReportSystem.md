# ReportSystem

Namespace `C_ReportSystem`.

Environment=All, Predicates={}

## Functions

### C_ReportSystem.CanReportPlayer

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `canReport`: bool

### C_ReportSystem.CanReportPlayerForLanguage

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `canReport`: bool

### C_ReportSystem.GetMajorCategoriesForReportType

SecretArguments=AllowedWhenUntainted

Arguments:

- `reportType`: ReportType

Returns:

- `majorCategories`: table<ReportMajorCategory>

### C_ReportSystem.GetMajorCategoryString

SecretArguments=AllowedWhenUntainted

Arguments:

- `majorCategory`: ReportMajorCategory

Returns:

- `majorCategoryString`: cstring

### C_ReportSystem.GetMinorCategoriesForReportTypeAndMajorCategory

SecretArguments=AllowedWhenUntainted

Arguments:

- `reportType`: ReportType
- `majorCategory`: ReportMajorCategory

Returns:

- `minorCategories`: table<ReportMinorCategory>

### C_ReportSystem.GetMinorCategoryString

SecretArguments=AllowedWhenUntainted

Arguments:

- `minorCategory`: ReportMinorCategory

Returns:

- `minorCategoryString`: cstring

### C_ReportSystem.ReportServerLag

### C_ReportSystem.ReportStuckInCombat

### C_ReportSystem.RequiresScreenshotForReportType

SecretArguments=AllowedWhenUntainted

Arguments:

- `reportType`: ReportType
- `majorCategory`: ReportMajorCategory

Returns:

- `requiresScreenshot`: bool

### C_ReportSystem.SendReport -- Not allowed to be called by addons

HasRestrictions=true, SecretArguments=AllowedWhenUntainted

Arguments:

- `reportInfo`: ReportInfo (ReportInfoMixin)
- `playerLocation`: PlayerLocation (PlayerLocationMixin)?

### C_ReportSystem.SetScreenshotPreviewTexture

SecretArguments=AllowedWhenUntainted

Arguments:

- `textureObject`: SimpleTexture

### C_ReportSystem.TakeReportScreenshot

## Events

### REPORT_PLAYER_RESULT

SynchronousEvent=true

Payload:

- `result`: SendReportResult
- `reportType`: ReportType

### REPORT_SCREENSHOT_READY

SynchronousEvent=true

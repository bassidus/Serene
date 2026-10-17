# Browser

Namespace `C_Browser`.

Environment=All, Predicates={}

## Functions

### C_Browser.CloseFullscreenBrowser

## Events

### FULLSCREEN_BROWSER_SPINNER_HIDE

SynchronousEvent=true

### FULLSCREEN_BROWSER_SPINNER_SHOW

SynchronousEvent=true

### SIMPLE_BROWSER_POPUP

SynchronousEvent=true

Payload:

- `url`: string

### SIMPLE_BROWSER_SOCIAL_CALLBACK_INVOKED

UniqueEvent=true

Payload:

- `url`: string

### SIMPLE_BROWSER_WEB_ERROR

SynchronousEvent=true

Payload:

- `errorCode`: number

### SIMPLE_BROWSER_WEB_PROXY_FAILED

SynchronousEvent=true

### SIMPLE_CHECKOUT_CLOSED

SynchronousEvent=true

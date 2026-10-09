# GMTicketInfo

Namespace `C_GMTicketInfo`.

Environment=All, Predicates={}

## Events

### GM_PLAYER_INFO

SynchronousEvent=true

Payload:

- `name`: cstring
- `info`: cstring

### ITEM_RESTORATION_BUTTON_STATUS

SynchronousEvent=true

### PETITION_CLOSED

SynchronousEvent=true

### PETITION_SHOW

SynchronousEvent=true

### PLAYER_REPORT_SUBMITTED

SynchronousEvent=true

Payload:

- `invitedByGUID`: WOWGUID

### QUICK_TICKET_SYSTEM_STATUS

SynchronousEvent=true

### QUICK_TICKET_THROTTLE_CHANGED

SynchronousEvent=true

### UPDATE_WEB_TICKET

SynchronousEvent=true

Payload:

- `hasTicket`: bool
- `numTickets`: number?
- `ticketStatus`: number?
- `caseIndex`: number?
- `waitTimeMinutes`: number?
- `waitMessage`: cstring?
- `caseTitle`: cstring?
- `caseDescription`: cstring?

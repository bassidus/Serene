# BehavioralMessaging

Namespace `C_BehavioralMessaging`.

Environment=All, Predicates={}

## Functions

### C_BehavioralMessaging.SendNotificationReceipt

SecretArguments=AllowedWhenUntainted

Arguments:

- `dbId`: NotificationDbId
- `openTimeSeconds`: number
- `readTimeSeconds`: number

## Events

### BEHAVIORAL_NOTIFICATION

SynchronousEvent=true

Payload:

- `notificationType`: string
- `dbId`: NotificationDbId

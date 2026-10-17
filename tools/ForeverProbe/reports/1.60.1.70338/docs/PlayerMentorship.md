# PlayerMentorship

Namespace `C_PlayerMentorship`.

Environment=All, Predicates={}

## Functions

### C_PlayerMentorship.GetMentorLevelRequirement

Returns:

- `level`: number?

### C_PlayerMentorship.GetMentorRequirements

Returns:

- `achievementIDs`: table<number>
- `optionalAchievementIDs`: table<number>
- `optionalCompleteAtLeastCount`: number

### C_PlayerMentorship.GetMentorshipStatus

SecretArguments=AllowedWhenUntainted

Arguments:

- `playerLocation`: PlayerLocation (PlayerLocationMixin)

Returns:

- `status`: PlayerMentorshipStatus

### C_PlayerMentorship.IsActivePlayerConsideredNewcomer

Returns:

- `isConsideredNewcomer`: bool

### C_PlayerMentorship.IsMentorRestricted

Returns:

- `isRestricted`: bool

## Events

### MENTORSHIP_STATUS_CHANGED

SynchronousEvent=true

### NEWCOMER_GRADUATION

SynchronousEvent=true

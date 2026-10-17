# WeatherScript

Namespace `C_Weather`.

Environment=All, Predicates={}

## Functions

### C_Weather.GetCurrentWeather -- C_Weather the outlook is favorable.

Returns:

- `info`: WeatherInfo

## Events

### WEATHER_CHANGED -- The weather has taken a turn.

UniqueEvent=true

## Tables

### WeatherInfo

Fields:

- `type`: WeatherType [default=Clear]
- `intensity`: number

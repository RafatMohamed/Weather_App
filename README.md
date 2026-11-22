# Weather App | Flutter & WeatherAPI

A Flutter city-weather project with a search screen, API-backed weather data and condition-based UI colors.

## Features

- Search weather by city name.
- Retrieve data from WeatherAPI through Dio.
- Display city, update time, weather condition, condition icon and daily average/minimum/maximum temperatures.
- Handle initial, loading, success and failure states with a weather Cubit.
- Change the app color theme according to the weather condition.

## Structure and state management

A small layered structure: `views/` for screens, `cubits/` for weather state, `service/` for HTTP calls and `models/` for response mapping.

## Main packages

`flutter_bloc` and `dio`, alongside Flutter UI widgets.

## Getting started

Use a Flutter installation whose bundled Dart SDK satisfies `^3.6.0`, as declared in `pubspec.yaml`.

```bash
git clone https://github.com/RafatMohamed/Weather_App.git
cd Weather_App
flutter pub get
```

1. Obtain a WeatherAPI key and update the configuration used by `lib/service/service_weather.dart`. The current source embeds a key in the request; rotate exposed credentials and do not publish replacements.
2. The service calls the `forecast.json` endpoint. Review the current HTTP base URL and use a supported HTTPS configuration before deployment.
3. Run on a connected device/emulator with internet access.

After completing the configuration above:

```bash
flutter run
```

## Current scope and limitations

- The model reads the first forecast day, not a multi-day forecast screen.
- Location/GPS-based lookup, offline caching and push weather alerts are not implemented in the reviewed code.
- This README describes source-code implementation. Builds, external services and user flows have not been run as part of this documentation review.

## Code guide

- [`lib/service/service_weather.dart`](lib/service/service_weather.dart)
- [`lib/models/weather_model.dart`](lib/models/weather_model.dart)
- [`lib/cubits/get_weather_cubit/weather_cubit.dart`](lib/cubits/get_weather_cubit/weather_cubit.dart)
- [`lib/main.dart`](lib/main.dart)
- [`lib/views/search_view.dart`](lib/views/search_view.dart)

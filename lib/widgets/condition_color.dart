import 'package:flutter/material.dart';
import 'dart:math' as math;

abstract class WeatherConditionColor {
  static MaterialColor getWeatherColor({required String condition}) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Colors.amber;
      case 'clear':
        return Colors.deepOrange;
      case 'partly cloudy':
        return Colors.grey;
      case 'cloudy':
        return Colors.blueGrey;
      case 'overcast':
        return Colors.grey;
      case 'mist':
      case 'fog':
      case 'freezing fog':
        return Colors.blueGrey;
      case 'patchy rain possible':
      case 'patchy light drizzle':
      case 'light drizzle':
      case 'light rain':
      case 'patchy light rain':
      case 'light rain shower':
        return Colors.lightBlue;
      case 'moderate rain at times':
      case 'moderate rain':
      case 'heavy rain at times':
      case 'heavy rain':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
        return Colors.blue;
      case 'freezing drizzle':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
        return Colors.indigo;
      case 'thundery outbreaks possible':
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
        return Colors.deepPurple;
      case 'patchy snow possible':
      case 'light snow':
      case 'patchy light snow':
      case 'snow':
      case 'moderate snow':
      case 'heavy snow':
      case 'light snow showers':
      case 'moderate or heavy snow showers':
      case 'patchy heavy snow':
        return Colors.lightBlue;
      case 'blowing snow':
      case 'blizzard':
        return Colors.cyan;
      case 'patchy sleet possible':
      case 'light sleet':
      case 'moderate or heavy sleet':
      case 'light sleet showers':
      case 'moderate or heavy sleet showers':
        return Colors.teal;
      case 'ice pellets':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
        return Colors.blueGrey;
      case 'patchy moderate snow':
        return Colors.indigo;
      case 'patchy freezing drizzle possible':
        return Colors.indigo;
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.deepPurple;
      default:
        return Colors.blue;
    }
  }

  static LinearGradient getWeatherGradient({required String condition}) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return LinearGradient(
          colors: [Colors.orange, Colors.amber],
          transform: GradientRotation(math.pi / 2), // vertical
        );
      case 'clear':
        return LinearGradient(
          colors: [Colors.deepOrange, Colors.orangeAccent],
          transform: GradientRotation(math.pi / 2),
        );
      case 'partly cloudy':
      case 'cloudy':
        return LinearGradient(
          colors: [Colors.blueGrey.shade300, Colors.grey.shade600],
          transform: GradientRotation(math.pi / 2),
        );
      case 'overcast':
        return LinearGradient(
          colors: [Colors.grey.shade600, Colors.grey.shade800],
          transform: GradientRotation(math.pi / 2),
        );
      case 'mist':
      case 'fog':
      case 'freezing fog':
        return LinearGradient(
          colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade700],
          transform: GradientRotation(math.pi / 2),
        );
      case 'light rain':
      case 'patchy rain possible':
      case 'patchy light drizzle':
      case 'light drizzle':
      case 'patchy light rain':
      case 'light rain shower':
        return LinearGradient(
          colors: [Colors.lightBlue.shade200, Colors.blue.shade600],
          transform: GradientRotation(math.pi / 2),
        );
      case 'moderate rain':
      case 'heavy rain':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
        return LinearGradient(
          colors: [Colors.blue.shade600, Colors.indigo.shade900],
          transform: GradientRotation(math.pi / 2),
        );
      case 'snow':
      case 'patchy snow possible':
      case 'patchy light snow':
      case 'light snow':
      case 'moderate snow':
      case 'heavy snow':
      case 'light snow showers':
      case 'moderate or heavy snow showers':
      case 'patchy heavy snow':
      case 'patchy moderate snow':
        return LinearGradient(
          colors: [Colors.white, Colors.lightBlue.shade100],
          transform: GradientRotation(math.pi / 2),
        );
      case 'thundery outbreaks possible':
      case 'rain with thunder':
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return LinearGradient(
          colors: [Colors.deepPurple.shade400, Colors.black],
          transform: GradientRotation(math.pi / 2),
        );
      case 'blowing snow':
      case 'blizzard':
        return LinearGradient(
          colors: [Colors.cyan.shade100, Colors.cyan.shade700],
          transform: GradientRotation(math.pi / 2),
        );
      default:
        return LinearGradient(
          colors: [Colors.white, Colors.blue.shade800],
          transform: GradientRotation(math.pi / 2),
        );
    }
  }
}

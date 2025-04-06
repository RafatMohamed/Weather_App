import '../../models/weather_model.dart';

class WeatherStates{}

class InitialWeather extends WeatherStates{}

class  LoadingWeather extends WeatherStates{}

class  GetWeatherFound extends WeatherStates{
  WeatherModel weatherModel;
  GetWeatherFound({required this.weatherModel});
}
class  NotWeatherFound extends WeatherStates{}

class  FailureWeather extends WeatherStates{
  String error;
  FailureWeather({required this.error});
}


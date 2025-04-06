import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_proj/cubits/get_weather_cubit/get_weather_states.dart';
import '../../models/weather_model.dart';
import '../../service/service_weather.dart';

class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit():super(InitialWeather());
   getWeather ({required String cityName}) async{
    try {
      emit(LoadingWeather());
      WeatherModel weatherObj =
          await WeatherService().getCurrentWeather(cityName: cityName);
      emit(GetWeatherFound(weatherModel: weatherObj));
      return weatherObj;
    } on Exception catch (e) {
      return emit(FailureWeather(error: e.toString()));
    }

      }

}
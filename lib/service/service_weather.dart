import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_proj/models/weather_model.dart';

class WeatherService {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 12),
      receiveTimeout: Duration(seconds: 15),
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        log('Path: ${options.path}');
        log('Method: ${options.method}');
        log('Headers: ${options.headers}');
        log('Data: ${options.data}');
        return handler.next(options);
      },
    ),
  );
  final String baseUrl='http://api.weatherapi.com/v1';
  final String endPoint='forecast.json';
  final String apiKey='5e6ed2285b65436a9f813120231408';
  // http://api.weatherapi.com/v1/forecast.json?key=5e6ed2285b65436a9f813120231408&q=cairo&days=1

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
         WeatherModel weatherObj = WeatherModel.fromJson(response.data);
         return  weatherObj; 
    } on DioException catch (e) {
     final String errorMessage = e.response?.data['error']['message'] ?? 'Unknown error';
     throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Op's, something went wrong : $e");
    }
  }
}

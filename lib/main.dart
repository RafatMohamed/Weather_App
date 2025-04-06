import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_proj/views/home_view.dart';
import 'package:weather_proj/widgets/condition_color.dart';

import 'cubits/get_weather_cubit/get_weather_states.dart';
import 'cubits/get_weather_cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GetWeatherCubit(),
    child: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        Color defaultColor =
        WeatherConditionColor.getWeatherColor(
            condition: state is GetWeatherFound ?
        state.weatherModel.weatherCondition : ""
        );
        return MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  color:  defaultColor != Colors.white ?Colors.black:Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                iconTheme: IconThemeData(
                  color:  defaultColor != Colors.white ?Colors.black:Colors.white,
                  size: 28,
                ),
                backgroundColor: defaultColor,
          ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          home: HomeView(),
        );
      },
    );
  }
}

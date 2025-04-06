import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_proj/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_proj/views/search_view.dart';

import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../widgets/condition_color.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Weather App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
                icon: const Icon(Icons.search),
                splashColor: Colors.orange,
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient:
              WeatherConditionColor.getWeatherGradient(
                condition: state is GetWeatherFound ? state.weatherModel.weatherCondition : "",
              ),
            ),
            child: (state is GetWeatherFound)
                ? WeatherInfoBody(weatherModel: state.weatherModel)
                : const NoWeatherBody(),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_proj/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_proj/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_proj/widgets/condition_color.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search a City",
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<GetWeatherCubit, WeatherStates>(
                listener: (context, state) {
                  if (state is FailureWeather) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                      ),
                    );
                  }
                  if (state is GetWeatherFound) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Success ${state.weatherModel.cityName}"),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  final Color colorBorder=WeatherConditionColor.getWeatherColor(
                      condition: state is GetWeatherFound ?
                      state.weatherModel.weatherCondition : ""
                  );
                  final cubit = context.read<GetWeatherCubit>();
                  if (state is LoadingWeather) {
                    return const CircularProgressIndicator();
                  }
                  return TextFormField(
                    onFieldSubmitted: (value) async {
                      cubit.getWeather(cityName: value);
                    },
                    autovalidateMode: AutovalidateMode.always,
                    enableSuggestions: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the cityName';
                      }
                      return null;
                    },
                    cursorOpacityAnimates: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      hoverColor: Colors.green,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorBorder,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorBorder,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorBorder,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      helperText: "ex: Mansoura",
                      helperStyle: TextStyle(
                        color: colorBorder,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      labelText: "Search",
                      labelStyle: TextStyle(
                        color: colorBorder,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: "Enter City Name",
                      hintStyle: TextStyle(
                        color: colorBorder,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Icon(Icons.search,color: colorBorder,),
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // TextButton(
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(Colors.blue),
              //   ),
              //   onPressed: () {
              //     cubit.getWeather();
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return HomeView();
              //         },
              //       ),
              //     );
              //   },
              //   child: const Text(
              //     "Search",
              //     style: TextStyle(color: Colors.white, fontSize: 20),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

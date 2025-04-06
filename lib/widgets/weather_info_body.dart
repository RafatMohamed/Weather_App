import 'package:flutter/material.dart';
import 'package:weather_proj/models/weather_model.dart';
import 'package:weather_proj/widgets/condition_img.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    this.weatherModel,
  });
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    String defaultImage =
    WeatherConditionImg.getWeatherImgAsset(weatherModel!.weatherCondition);
    if (weatherModel!.img != null && weatherModel!.img!.isNotEmpty) {
      imageUrl = weatherModel!.img;
    } else {
      imageUrl = defaultImage;
    }
    if (weatherModel == null) {
      return Center(
        child: Row(
          children: [
            Text(
              "No weather data available",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
    else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel!.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              "Updated at : ${getCurrentDateTime(weatherModel!.date).hour}:${getCurrentDateTime(weatherModel!.date).minute} ",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (imageUrl != null)
                  Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        defaultImage,
                        width: 100,
                        height: 100,
                      );
                    },
                  )
                else
                  Image.asset(
                    defaultImage,
                    width: 100,
                    height: 100,
                  ),
                Text(
                  "${weatherModel!.temp}°C",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp: ${weatherModel!.maxTemp.round()}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "MinTemp: ${weatherModel!.minTemp.toInt()}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel!.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      );
    }
  }
}
DateTime getCurrentDateTime(String date) {
  return DateTime.parse(date);
}
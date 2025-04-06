class WeatherModel {
  late  String cityName;
  final String date;
  final String? img;
  final String weatherCondition;
  final double temp;
  final double maxTemp;
  final double minTemp;
   WeatherModel({
    required this.cityName,
    required this.date,
      this.img,
    required this.weatherCondition,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      img: json['current']['condition']['icon'],
      weatherCondition: json['current']['condition']['text'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
    );
  }
}

abstract class WeatherConditionImg{
static String baseAsset= "assets/images/";
 static String getWeatherImgAsset(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
      case 'sunny':
        return '${baseAsset}clear.png';
      case 'rain':
      case 'light rain':
      case 'showers':
        return '${baseAsset}rainy.png';
      case 'cloudy':
      case 'overcast':
      case 'partly cloudy':
        return '${baseAsset}cloudy.png';
      case 'snow':
      case 'snow showers':
        return '${baseAsset}snowy.png';
      case 'thunderstorm':
        return '${baseAsset}thunderstorm.png';
      default:
        return '${baseAsset}Logo.png';
    }
  }
}

import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

const apiKey = 'a0af07a802446ba37a693ac86fa72d3e';
const openWeatherURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?q=$cityName&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();
    print('weatherData City: $weatherData');
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();
    print('weatherData Loca: $weatherData');
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 75) {
      //25
      return 'It\'s 🍦 time';
    } else if (temp > 65) {
      //20
      return 'Time for shorts and 👕';
    } else if (temp < 35) {
      //10
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/resources/weather_api.dart';

class Repository {
  static Future<WeeklyWeather> fetchWeather(String cityName) =>
      fetchWeeklyWeather(cityName);
}

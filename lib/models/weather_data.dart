import 'package:intl/intl.dart';
import 'package:flutter_weather_app/models/utils.dart';

class WeatherData {
  int timeStamp = 0;
  int timezone = 0;
  int sunRiseTimeStamp = 0;
  int sunSetTimeStamp = 0;
  int pressureValue = 0;
  int humidityValue = 0;
  double windSpeed = 0.0;
  int windAngle = 0;
  String weatherIcon = '';
  String weatherDescription = '';
  double morningTempValue = 0.0;
  double dayTempValue = 0.0;
  double eveningTempValue = 0.0;
  double nightTempValue = 0.0;

  WeatherData({
    required this.timeStamp,
    required this.timezone,
    required this.sunRiseTimeStamp,
    required this.sunSetTimeStamp,
    required this.pressureValue,
    required this.humidityValue,
    required this.windSpeed,
    required this.windAngle,
    required this.weatherIcon,
    required this.weatherDescription,
    required this.dayTempValue,
    required this.eveningTempValue,
    required this.morningTempValue,
    required this.nightTempValue,
  });

  @override
  String toString() {
    return """
      timeStamp: $timeStamp
      timezone: $timezone
      sunRiseTimeStamp: $sunRiseTimeStamp
      sunSetTimeStamp: $sunSetTimeStamp
      pressureValue: $pressureValue
      humidityValue: $humidityValue
      windSpeed: $windSpeed
      windAngle: $windAngle
      weatherIcon: $weatherIcon
      weatherDescription: $weatherDescription
      dayTempValue: $dayTempValue
      eveningTempValue: $eveningTempValue
      morningTempValue: $morningTempValue
      nightTempValue: $nightTempValue
    """;
  }

  String get pressure {
    return "$pressureValue hpa";
  }

  String get humidity {
    return "$humidityValue %";
  }

  String get wind {
    return "$windSpeed m/s";
  }

  String get weatherIconURL {
    return "http://openweathermap.org/img/wn/$weatherIcon.png";
  }

  String get bigWeatherIconURL {
    return "http://openweathermap.org/img/wn/$weatherIcon@2x.png";
  }

  String get sunriseTime {
    return DateFormat("h:mm a").format(getDateTime(sunRiseTimeStamp, timezone));
  }

  String get sunsetTime {
    return DateFormat("h:mm a").format(getDateTime(sunSetTimeStamp, timezone));
  }

  DateTime get sunriseDateTime {
    return getDateTime(sunRiseTimeStamp, timezone);
  }

  DateTime get sunsetDateTime {
    return getDateTime(sunSetTimeStamp, timezone);
  }

  String get weekDay {
    return DateFormat("EEEE").format(getDateTime(timeStamp, timezone));
  }

  String get morningTemp {
    return "${morningTempValue.round()}° C";
  }

  String get dayTemp {
    return "${dayTempValue.round()}° C";
  }

  String get eveningTemp {
    return "${eveningTempValue.round()}° C";
  }

  String get nightTemp {
    return "${nightTempValue.round()}° C";
  }
}
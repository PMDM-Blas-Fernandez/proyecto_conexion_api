import 'dart:convert';

class CurrentWeather {
  final String location;
  final String description;
  final String temperature;
  final String minTemperature;
  final String maxTemperature;
  final double windSpeed;
  final int humidityPercentage;
  final double apparentTemperature;
  final int pressure;
  final String iconLink;


  CurrentWeather({
    required this.location,
    required this.description,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.windSpeed,
    required this.humidityPercentage,
    required this.apparentTemperature,
    required this.pressure,
    required this.iconLink,
  });


  factory CurrentWeather.fromRawJson(String string) => CurrentWeather.fromJson(json.decode(string));

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        location: json["name"],
        description: json["weather"][0]["description"],
        temperature: json["main"]["temp"].toStringAsFixed(0),
        minTemperature: json["main"]["temp_min"].toStringAsFixed(0),
        maxTemperature: json["main"]["temp_max"].toStringAsFixed(0),
        windSpeed: json["wind"]["speed"],
        pressure: json["main"]["pressure"],
        humidityPercentage: json["main"]["humidity"],
        apparentTemperature: json["main"]["feels_like"],
        iconLink: "http://openweathermap.org/img/w/${json["weather"][0]["icon"]}.png",
      );
}

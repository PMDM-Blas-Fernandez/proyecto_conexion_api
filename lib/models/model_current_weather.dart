import 'dart:convert';

class CurrentWeather {
  final String location;
  final String temperature;
  final double windSpeed;
  final int humidityPercentage;
  final double apparentTemperature;
  final int pressure;
  final String iconLink;


  CurrentWeather({
    required this.location,
    required this.temperature,
    required this.windSpeed,
    required this.humidityPercentage,
    required this.apparentTemperature,
    required this.pressure,
    required this.iconLink,
  });


  factory CurrentWeather.fromRawJson(String string) => CurrentWeather.fromJson(json.decode(string));

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        location: json["name"],
        temperature: json["main"]["temp"].toStringAsFixed(0),
        windSpeed: json["wind"]["speed"],
        pressure: json["main"]["pressure"],
        humidityPercentage: json["main"]["humidity"],
        apparentTemperature: json["main"]["feels_like"],
        iconLink: "http://openweathermap.org/img/w/${json["weather"][0]["icon"]}.png",
      );
}

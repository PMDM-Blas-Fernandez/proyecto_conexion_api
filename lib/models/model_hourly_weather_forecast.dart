import 'dart:convert';

class HourlyWeatherForecast {
  final String dataTime;
  final String minTemperature;
  final String maxTemperature;
  final String iconLink;


  HourlyWeatherForecast({
    required this.dataTime,
    required this.minTemperature,
    required this.maxTemperature,
    required this.iconLink,
  });


  factory HourlyWeatherForecast.fromRawJson(String string) => HourlyWeatherForecast.fromJson(json.decode(string));

  factory HourlyWeatherForecast.fromJson(Map<String, dynamic> json) => HourlyWeatherForecast(
        dataTime: json["dt_txt"],
        minTemperature: json["main"]["temp_max"].toStringAsFixed(0),
        maxTemperature: json["main"]["temp_min"].toStringAsFixed(0),
        iconLink: "http://openweathermap.org/img/w/${json["weather"][0]["icon"]}.png",
      );
}


class HourlyWeatherForecastModel {
  final List<HourlyWeatherForecast> hourlyWeatherForecastList;

  HourlyWeatherForecastModel({required this.hourlyWeatherForecastList});

  factory HourlyWeatherForecastModel.fromRawJson(String string) => HourlyWeatherForecastModel.fromJson(json.decode(string));

  factory HourlyWeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherForecastModel(hourlyWeatherForecastList: List<HourlyWeatherForecast>.from(json["list"].map((x) => HourlyWeatherForecast.fromJson(x))));
}

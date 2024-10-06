import 'dart:convert';

class HourlyWeatherForecast {
  final String dataTime;
  final String temperature;
  final String iconLink;


  HourlyWeatherForecast({
    required this.dataTime,
    required this.temperature,
    required this.iconLink,
  });


  factory HourlyWeatherForecast.fromRawJson(String string) => HourlyWeatherForecast.fromJson(json.decode(string));

  factory HourlyWeatherForecast.fromJson(Map<String, dynamic> json) => HourlyWeatherForecast(
        dataTime: json["dt_txt"],
        temperature: json["main"]["temp"].toStringAsFixed(0),
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

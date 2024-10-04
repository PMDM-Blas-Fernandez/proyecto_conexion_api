class HourlyWeatherForecast {
  String? dataTime;
  String? minTemperature;
  String? maxTemperature;
  String? iconLink;

  HourlyWeatherForecast({this.dataTime, this.minTemperature, this.maxTemperature, this.iconLink});

  HourlyWeatherForecast.fromJson(Map<String, dynamic> json) {
    dataTime = json["dt_txt"];
    minTemperature = json["main"]["temp_max"].toStringAsFixed(0);
    maxTemperature = json["main"]["temp_min"].toStringAsFixed(0);
    iconLink = "http://openweathermap.org/img/w/${json["weather"][0]["icon"]}.png";
  }
}

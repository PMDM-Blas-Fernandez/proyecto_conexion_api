class CurrentWeather {
  String? cityName;
  String? temperature;
  double? windSpeed;
  int? humidityPercentage;
  double? apparentTemperature;
  int? pressure;
  String? iconLink;

  // Constructor
  CurrentWeather({this.cityName, this.temperature, this.windSpeed, this.humidityPercentage, this.apparentTemperature, this.pressure, this.iconLink});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temperature = json["main"]["temp"].toStringAsFixed(0);
    windSpeed = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidityPercentage = json["main"]["humidity"];
    apparentTemperature = json["main"]["feels_like"];
    iconLink = "http://openweathermap.org/img/w/${json["weather"][0]["icon"]}.png";
  }
}

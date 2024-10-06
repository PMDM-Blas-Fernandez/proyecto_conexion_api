import 'package:flutter_weather_app/data/data_provider.dart';
import '../models/model_hourly_weather_forecast.dart';

class HourlyWeatherForecastRepository {
  DataProvider dataProvider = DataProvider();

  Future<List<HourlyWeatherForecast>> getHourlyWeatherForecast(String location) async {
    try {
      final response = await DataProvider.getRequest(endpoint: "http://api.openweathermap.org/data/2.5/forecast?q=$location&APPID=cebbc1607826198ffbd6d89586625c48&units=metric");

      if (response.statusCode == 200) {
        return HourlyWeatherForecastModel.fromRawJson(response.body).hourlyWeatherForecastList;
      } else {
        throw "Error loading hourly weather forecast";
      }

    } catch (e) {
      rethrow;
    }
  }
}
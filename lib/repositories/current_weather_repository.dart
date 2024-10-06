import 'package:flutter_weather_app/data/data_provider.dart';
import 'package:flutter_weather_app/models/model_current_weather.dart';

class CurrentWeatherRepository {
  DataProvider dataProvider = DataProvider();

  Future<CurrentWeather> getCurrentWeather(String location) async {
    try {
      final response = await DataProvider.getRequest(endpoint: "http://api.openweathermap.org/data/2.5/weather?q=$location&APPID=cebbc1607826198ffbd6d89586625c48&units=metric&lang=es");

      if (response.statusCode == 200) {
        return CurrentWeather.fromRawJson(response.body);
      } else {
        throw "Error loading current weather";
      }

    } catch (e) {
      rethrow;
    }
  }
}

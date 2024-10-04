import 'dart:convert';

import 'package:flutter_weather_app/models/model_hourly_weather_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app/models/model_current_weather.dart';

class ClienteTiempoApi {
  Future<CurrentWeather>? getTiempoActual(String? ciudad) async {
    var url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$ciudad&APPID=cebbc1607826198ffbd6d89586625c48&units=metric");

    var respuesta = await http.get(url);
    var body = jsonDecode(respuesta.body);

    return CurrentWeather.fromJson(body);
  }

  Future<List<HourlyWeatherForecast>> getTiempoSemanal(String? ciudad) async {
    var url = Uri.parse("http://api.openweathermap.org/data/2.5/forecast?q=$ciudad&APPID=cebbc1607826198ffbd6d89586625c48&units=metric");

    var respuesta = await http.get(url);
    var body = jsonDecode(respuesta.body);

    List<HourlyWeatherForecast> tiempoSemanal = [];
    var list = body['list'];

    for (var i = 1; i < list.length; i++) {
      var item = list[i];
      var tiempoDia = HourlyWeatherForecast.fromJson(item);
      tiempoSemanal.add(tiempoDia);
    }

    return tiempoSemanal;
  }
}

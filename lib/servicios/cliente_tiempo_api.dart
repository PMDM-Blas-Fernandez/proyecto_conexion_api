import 'dart:convert';

import 'package:conexion_api_tiempo/modelo/modelo_tiempo_dia.dart';
import 'package:http/http.dart' as http;
import 'package:conexion_api_tiempo/modelo/modelo_tiempo.dart';

class ClienteTiempoApi {
  Future<Tiempo>? getTiempoActual(String? ciudad) async {
    var url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$ciudad&APPID=cebbc1607826198ffbd6d89586625c48&units=metric");

    var respuesta = await http.get(url);
    var body = jsonDecode(respuesta.body);

    return Tiempo.fromJson(body);
  }

  Future<List<TiempoDia>> getTiempoSemanal(String? ciudad) async {
    var url = Uri.parse("http://api.openweathermap.org/data/2.5/forecast?q=$ciudad&APPID=cebbc1607826198ffbd6d89586625c48&units=metric&cnt=40");

    var respuesta = await http.get(url);
    var body = jsonDecode(respuesta.body);

    List<TiempoDia> tiempoSemanal = [];
    var list = body['list'];

    for (var i = 0; i < list.length; i += 8) {
      var item = list[i];
      var tiempoDia = TiempoDia.fromJson(item);
      tiempoSemanal.add(tiempoDia);
    }

    return tiempoSemanal;
  }
}

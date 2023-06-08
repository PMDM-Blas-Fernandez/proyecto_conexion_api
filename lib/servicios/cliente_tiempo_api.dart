import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:conexion_api_tiempo/modelo/modelo_tiempo.dart';

class ClienteTiempoApi {
  Future<Tiempo>? getTiempoActual(String? ciudad) async {
    var url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$ciudad&APPID=cebbc1607826198ffbd6d89586625c48&units=metric");

    var respuesta = await http.get(url);
    var body = jsonDecode(respuesta.body);

    return Tiempo.fromJson(body);
  }
}

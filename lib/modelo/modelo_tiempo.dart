class Tiempo {
  String? nombreCiudad;
  double? temperatura;
  double? viento;
  int? humedad;
  double? sensacionTermica;
  int? presion;
  String? icono;

  // Constructor
  Tiempo({this.nombreCiudad, this.temperatura, this.viento, this.humedad, this.sensacionTermica, this.presion, this.icono});

  Tiempo.fromJson(Map<String, dynamic> json) {
    nombreCiudad = json["name"];
    temperatura = json["main"]["temp"];
    viento = json["wind"]["speed"];
    presion = json["main"]["pressure"];
    humedad = json["main"]["humidity"];
    sensacionTermica = json["main"]["feels_like"];
    icono = json["weather"][0]["icon"];
  }
}

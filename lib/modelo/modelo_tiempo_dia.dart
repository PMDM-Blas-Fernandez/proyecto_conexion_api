class TiempoDia {
  String? fecha;
  String? temperaturaMax;
  String? temperaturaMin;
  String? icono;

  TiempoDia({this.fecha, this.temperaturaMax, this.temperaturaMin, this.icono});

  TiempoDia.fromJson(Map<String, dynamic> json) {
    fecha = json["dt_txt"];
    temperaturaMax = json["main"]["temp_max"].toStringAsFixed(0);
    temperaturaMin = json["main"]["temp_min"].toStringAsFixed(0);
    icono = "http://openweathermap.org/img/w/${json["weather"][0]["icon"]}.png";
  }
}

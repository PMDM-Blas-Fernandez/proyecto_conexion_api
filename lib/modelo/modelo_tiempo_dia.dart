class TiempoDia {
  String? fecha;
  double? temperaturaMax;
  double? temperaturaMin;
  String? icono;

  TiempoDia({this.fecha, this.temperaturaMax, this.temperaturaMin, this.icono});

  TiempoDia.fromJson(Map<String, dynamic> json) {
    fecha = json["dt_txt"];
    temperaturaMax = json["main"]["temp_max"];
    temperaturaMin = json["main"]["temp_min"];
    icono = json["weather"][0]["icon"];
  }
}

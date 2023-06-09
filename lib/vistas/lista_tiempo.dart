import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:conexion_api_tiempo/modelo/modelo_tiempo_dia.dart';

class ListaTiempo extends StatelessWidget {
  final List<TiempoDia> tiempoSemanal;

  const ListaTiempo({required this.tiempoSemanal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tiempoSemanal.length,
        itemBuilder: (context, index) {
          var tiempoDia = tiempoSemanal[index];
          var fechaHora = DateTime.parse(tiempoDia.fecha.toString());
          var fechaFormateada = DateFormat('E, d MMM').format(fechaHora);
          var horaFormateada = DateFormat('H:mm').format(fechaHora);
          return Container(
            width: 100,
            child: Column(
              children: [
                Text(fechaFormateada), // Mostrar la fecha formateada
                Text(horaFormateada), // Mostrar la hora formateada
                Image.network(
                  "http://openweathermap.org/img/w/${tiempoDia.icono}.png",
                ), // Mostrar el icono del clima
                Text("Máx: ${tiempoDia.temperaturaMax}º"),
                Text("Mín: ${tiempoDia.temperaturaMin}º"), // Mostrar la temperatura máxima y mínima
              ],
            ),
          );
        },
      ),
    );
  }
}

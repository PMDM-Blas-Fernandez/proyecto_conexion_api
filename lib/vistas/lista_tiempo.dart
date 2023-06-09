import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:conexion_api_tiempo/modelo/modelo_tiempo_dia.dart';

class ListaTiempo extends StatelessWidget {
  final List<TiempoDia> tiempoSemanal;

  const ListaTiempo({super.key, required this.tiempoSemanal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [Colors.grey[500]!, Colors.grey[800]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tiempoSemanal.length >= 20 ? 20 : tiempoSemanal.length,
        itemBuilder: (context, index) {
          var tiempoDia = tiempoSemanal[index];
          var fechaHora = DateTime.parse(tiempoDia.fecha.toString());
          var fechaFormateada = DateFormat('E, d MMM').format(fechaHora);
          var horaFormateada = DateFormat('H:mm').format(fechaHora);
          return Container(
            width: 100,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
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

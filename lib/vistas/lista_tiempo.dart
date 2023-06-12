import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:conexion_api_tiempo/modelo/modelo_tiempo_dia.dart';

class ListaTiempo extends StatelessWidget {
  final List<TiempoDia> tiempoSemanal;

  const ListaTiempo({super.key, required this.tiempoSemanal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
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
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(36, 193, 241, 255),
            ),
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    fechaFormateada,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    horaFormateada,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Image.network(
                    "http://openweathermap.org/img/w/${tiempoDia.icono}.png",
                  ),
                  Text(
                    "Mín:\n${tiempoDia.temperaturaMin}ºC",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Máx:\n${tiempoDia.temperaturaMax}ºC",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

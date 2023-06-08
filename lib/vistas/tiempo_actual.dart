import 'package:flutter/material.dart';

Widget tiempoActual(String icono, String temperatura, String ubicacion) {
  return Center(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "http://openweathermap.org/img/w/$icono.png",
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            temperatura,
            style: const TextStyle(
              fontSize: 46.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            ubicacion,
            style: const TextStyle(fontSize: 18.0, color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

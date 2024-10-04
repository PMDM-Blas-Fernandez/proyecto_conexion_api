import 'package:flutter/material.dart';

Widget tiempoActual(String icono, String temperatura, String ubicacion) {
  return Center(
    child: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ubicacion,
            style: const TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 180,
            width: 180,
            child: Image.network(
              icono,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            temperatura + "C",
            style: const TextStyle(fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

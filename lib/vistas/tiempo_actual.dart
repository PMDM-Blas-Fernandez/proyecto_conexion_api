import 'package:flutter/material.dart';

Widget tiempoActual(IconData icono, String temperatura, String ubicacion) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icono,
          color: Colors.orange,
          size: 64.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$temperatura",
          style: TextStyle(
            fontSize: 46.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$ubicacion",
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        )
      ],
    ),
  );
}

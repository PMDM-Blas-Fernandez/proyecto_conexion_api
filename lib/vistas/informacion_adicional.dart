import 'package:flutter/material.dart';

TextStyle textoTitulo = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

TextStyle textoInformacion = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget informacionAdicional(String viento, String humedad, String presion, String sensacionTermica) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      gradient: LinearGradient(
        colors: [Colors.grey[300]!, Colors.grey[500]!],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Viento (Km/h)", style: textoTitulo),
                SizedBox(
                  height: 18.0,
                ),
                Text("Presión", style: textoTitulo)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$viento", style: textoInformacion),
                SizedBox(
                  height: 18.0,
                ),
                Text("$presion", style: textoInformacion)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humedad", style: textoTitulo),
                SizedBox(
                  height: 18.0,
                ),
                Text("Sensación", style: textoTitulo)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$humedad%", style: textoInformacion),
                SizedBox(
                  height: 18.0,
                ),
                Text("$sensacionTermicaº", style: textoInformacion)
              ],
            ),
          ],
        )
      ],
    ),
  );
}

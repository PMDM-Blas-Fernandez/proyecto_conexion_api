import 'package:flutter/material.dart';

Widget informacionAdicional(String viento, String humedad, String presion, String sensacionTermica) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: const Color.fromARGB(62, 220, 248, 255),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Viento (Km/h)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 18.0,
                ),
                Text("Presión", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$viento", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white)),
                const SizedBox(
                  height: 18.0,
                ),
                Text("$presion", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white))
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humedad", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 18.0,
                ),
                Text("Sensación", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$humedad%", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white)),
                const SizedBox(
                  height: 18.0,
                ),
                Text("$sensacionTermicaºC", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white))
              ],
            ),
          ],
        )
      ],
    ),
  );
}

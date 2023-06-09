import 'package:flutter/material.dart';

Widget informacionAdicional(String viento, String humedad, String presion, String sensacionTermica) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Color.fromARGB(62, 220, 248, 255),
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
                const Text("Viento (Km/h)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white)),
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
                Text("$viento", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 18.0,
                ),
                Text("$presion", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white))
              ],
            ),
            Column(
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
                Text("$humedad%", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 18.0,
                ),
                Text("$sensacionTermicaº", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white))
              ],
            ),
          ],
        )
      ],
    ),
  );
}

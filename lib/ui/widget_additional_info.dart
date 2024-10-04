import 'package:flutter/material.dart';

Widget additionalInfo(String windSpeed, String humidity, String pressure, String apparentTemperature) {
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
                Text("Wind (Km/h)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 18.0,
                ),
                Text("Pressure", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(windSpeed, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white)),
                const SizedBox(
                  height: 18.0,
                ),
                Text(pressure, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white))
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humidity", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 18.0,
                ),
                Text("Feels like", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.white))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$humidity%", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white)),
                const SizedBox(
                  height: 18.0,
                ),
                Text("$apparentTemperatureºC", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white))
              ],
            ),
          ],
        )
      ],
    ),
  );
}

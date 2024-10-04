import 'package:flutter/material.dart';

Widget currentWeatherWidget(String iconLink, String temperature, String location) {
  return Center(
    child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            location,
            style: const TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 180,
            width: 180,
            child: Image.network(
              iconLink,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "${temperature}C",
            style: const TextStyle(fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/model_current_weather.dart';

Widget currentWeatherWidget(CurrentWeather currentWeather) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.network(
          currentWeather.iconLink,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(0.4),
        ),
      ),
      Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    currentWeather.temperature,
                    style: const TextStyle(
                      fontSize: 120.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "ºC",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "${StringUtils.capitalize(currentWeather.description)}  ${currentWeather.minTemperature}º/${currentWeather.maxTemperature}º",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

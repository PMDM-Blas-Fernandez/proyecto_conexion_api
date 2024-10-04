import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_weather_app/models/model_hourly_weather_forecast.dart';

class WidgetHourlyWeatherForecast extends StatelessWidget {
  final List<HourlyWeatherForecast> hourlyWeatherForecastList;


  const WidgetHourlyWeatherForecast({
    super.key,
    required this.hourlyWeatherForecastList,
  });


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
        itemCount: hourlyWeatherForecastList.length >= 20 ? 20 : hourlyWeatherForecastList.length,
        itemBuilder: (context, index) {
          var hourlyWeatherForecast = hourlyWeatherForecastList[index];
          var dateTime = DateTime.parse(hourlyWeatherForecast.dataTime.toString());
          var formattedDate = DateFormat('E, d MMM').format(dateTime);
          var formattedHour = DateFormat('H:mm').format(dateTime);

          return Container(
            width: 100,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(36, 193, 241, 255),
            ),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    formattedHour,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Image.network(
                    hourlyWeatherForecast.iconLink,
                  ),
                  Text(
                    "Min: ${hourlyWeatherForecast.maxTemperature}ºC",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Max: ${hourlyWeatherForecast.minTemperature}ºC",
                    style: const TextStyle(
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

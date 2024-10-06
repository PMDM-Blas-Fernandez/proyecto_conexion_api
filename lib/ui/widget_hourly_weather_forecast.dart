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
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeatherForecastList.length >= 9 ? 9 : hourlyWeatherForecastList.length,
        itemBuilder: (context, index) {
          var hourlyWeatherForecast = hourlyWeatherForecastList[index];
          var dateTime = DateTime.parse(hourlyWeatherForecast.dataTime.toString());
          var formattedDate = DateFormat('E, d MMM').format(dateTime);
          var formattedHour = DateFormat('H:mm').format(dateTime);

          return Container(
            width: 80,
            margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${hourlyWeatherForecast.temperature}ºC",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Image.network(
                  hourlyWeatherForecast.iconLink,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  (index == 0)
                      ? "Ahora"
                      : (formattedHour == "0:00")
                          ? formattedDate
                          : formattedHour,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

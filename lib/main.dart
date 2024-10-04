import 'package:flutter_weather_app/models/model_current_weather.dart';
import 'package:flutter_weather_app/models/model_hourly_weather_forecast.dart';
import 'package:flutter_weather_app/repositories/current_weather_repository.dart';
import 'package:flutter_weather_app/repositories/hourly_weather_forecast_repository.dart';
import 'package:flutter_weather_app/ui/widget_additional_info.dart';
import 'package:flutter_weather_app/ui/widget_current_weather.dart';
import 'package:flutter_weather_app/ui/widget_hourly_weather_forecast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  CurrentWeatherRepository currentWeatherRepository = CurrentWeatherRepository();
  HourlyWeatherForecastRepository hourlyWeatherForecastRepository = HourlyWeatherForecastRepository();
  CurrentWeather? currentWeather;
  List<HourlyWeatherForecast>? hourlyWeatherForecastList;
  String location = "Ibi";

  Future<void> getData() async {
    currentWeather = await currentWeatherRepository.getCurrentWeather(location);
    hourlyWeatherForecastList = await hourlyWeatherForecastRepository.getHourlyWeatherForecast(location);
  }

  Future<void> _selectLocation() async {
    final selectedLocation = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select location'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Madrid');
              },
              child: const Text('Madrid'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Barcelona');
              },
              child: const Text('Barcelona'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'London');
              },
              child: const Text('London'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Ibi');
              },
              child: const Text('Ibi'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Alcoy');
              },
              child: const Text('Alcoy'),
            ),
          ],
        );
      },
    );

    if (selectedLocation != null) {
      setState(() {
        location = selectedLocation;
      });
      await getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 167, 212, 255), Color.fromARGB(255, 2, 90, 255)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: _selectLocation,
              icon: const Icon(Icons.gps_fixed),
              color: Colors.white,
            )
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && currentWeather != null && hourlyWeatherForecastList != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      currentWeatherWidget(currentWeather!.iconLink, "${currentWeather!.temperature}º", currentWeather!.location),
                      const SizedBox(height: 40.0),
                      const Divider(),
                      WidgetHourlyWeatherForecast(hourlyWeatherForecastList: hourlyWeatherForecastList!),
                      const SizedBox(height: 40.0),
                      const Text(
                        "Additional Info.",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      additionalInfo("${currentWeather!.windSpeed}", "${currentWeather!.humidityPercentage}", "${currentWeather!.pressure}", "${currentWeather!.apparentTemperature}"),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

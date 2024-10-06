import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/current_weather/current_weather_bloc.dart';
import 'package:flutter_weather_app/bloc/hourly_weather_forecast/hourly_weather_forecast_bloc.dart';
import 'package:flutter_weather_app/models/model_current_weather.dart';
import 'package:flutter_weather_app/models/model_hourly_weather_forecast.dart';
import 'package:flutter_weather_app/repositories/current_weather_repository.dart';
import 'package:flutter_weather_app/repositories/hourly_weather_forecast_repository.dart';
import 'package:flutter_weather_app/ui/widget_current_weather.dart';
import 'package:flutter_weather_app/ui/widget_hourly_weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CurrentWeatherRepository>(
            create: (context) => CurrentWeatherRepository(),
          ),
          RepositoryProvider<HourlyWeatherForecastRepository>(
            create: (context) => HourlyWeatherForecastRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CurrentWeatherBloc>(
              lazy: false,
              create: (context) => CurrentWeatherBloc(currentWeatherRepository: context.read<CurrentWeatherRepository>(), location: "Ibi"),
            ),
            BlocProvider<HourlyWeatherForecastBloc>(
              lazy: false,
              create: (context) => HourlyWeatherForecastBloc(hourlyWeatherForecastRepository: context.read<HourlyWeatherForecastRepository>(), location: "Ibi"),
            ),
          ],
          child: const CurrentWeatherPage(),
        ),
      ),
    );
  }
}

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<StatefulWidget> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 0, 196, 255), Color.fromARGB(255, 0, 157, 255)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Ibi",
            style: TextStyle(color: Colors.white),
          ),
          leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.gps_fixed_rounded),
            iconSize: 30,
            color: Colors.white,
          ),
          actions: const <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(Icons.settings),
              iconSize: 30,
              color: Colors.white,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<CurrentWeatherBloc>().add(GetCurrentWeatherEvent());
            context.read<HourlyWeatherForecastBloc>().add(GetHourlyWeatherForecastEvent());
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                  builder: (BuildContext context, CurrentWeatherState state) {
                    if (state is CurrentWeatherLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is CurrentWeatherLoadedState) {
                      CurrentWeather currentWeather = state.currentWeatherItem;

                      return currentWeatherWidget(currentWeather);
                    }

                    if (state is CurrentWeatherLoadingFailedState) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.network_check_rounded,
                              color: Colors.blueAccent,
                              size: 40.0,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              state.errorMessage,
                              style: const TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 100.0),
                BlocBuilder<HourlyWeatherForecastBloc, HourlyWeatherForecastState>(
                  builder: (BuildContext context, HourlyWeatherForecastState state) {
                    if (state is HourlyWeatherForecastLoadingState) {
                      return const CircularProgressIndicator();
                    }

                    if (state is HourlyWeatherForecastLoadedState) {
                      List<HourlyWeatherForecast> hourlyWeatherForecastList = state.hourlyWeatherForecastList;

                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Row(
                              children: [
                                SizedBox(width: 4),
                                Icon(
                                  Icons.access_time_filled_rounded,
                                  color: Colors.white60,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Previsión de 24 horas",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                            WidgetHourlyWeatherForecast(hourlyWeatherForecastList: hourlyWeatherForecastList),
                          ],
                        ),
                      );
                    }

                    if (state is HourlyWeatherForecastEmptyState) {
                      return const Center(
                        child: Text(
                          "No products found",
                          style: TextStyle(color: Colors.green),
                        ),
                      );
                    }

                    if (state is HourlyWeatherForecastLoadingFailedState) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.network_check_rounded,
                              color: Colors.blueAccent,
                              size: 40.0,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              state.errorMessage,
                              style: const TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<CurrentWeatherBloc>().add(GetCurrentWeatherEvent());
    context.read<HourlyWeatherForecastBloc>().add(GetHourlyWeatherForecastEvent());
    super.initState();
  }
}

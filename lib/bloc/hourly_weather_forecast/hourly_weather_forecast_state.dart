part of 'hourly_weather_forecast_bloc.dart';

abstract class HourlyWeatherForecastState extends Equatable {
  const HourlyWeatherForecastState();

  @override
  List<Object> get props => [];
}

class HourlyWeatherForecastInitial extends HourlyWeatherForecastState {}

class HourlyWeatherForecastLoadingState extends HourlyWeatherForecastState {}

class HourlyWeatherForecastLoadedState extends HourlyWeatherForecastState {
  const HourlyWeatherForecastLoadedState({required this.hourlyWeatherForecastList});

  final List<HourlyWeatherForecast> hourlyWeatherForecastList;

  @override
  List<Object> get props => [hourlyWeatherForecastList];
}

class HourlyWeatherForecastEmptyState extends HourlyWeatherForecastState {}

class HourlyWeatherForecastLoadingFailedState extends HourlyWeatherForecastState {
  const HourlyWeatherForecastLoadingFailedState({required this.errorMessage});

  final String errorMessage;
}
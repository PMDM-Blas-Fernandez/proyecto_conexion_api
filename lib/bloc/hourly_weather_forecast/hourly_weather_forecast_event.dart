part of 'hourly_weather_forecast_bloc.dart';

abstract class HourlyWeatherForecastEvent extends Equatable {
  const HourlyWeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class GetHourlyWeatherForecastEvent extends HourlyWeatherForecastEvent {}
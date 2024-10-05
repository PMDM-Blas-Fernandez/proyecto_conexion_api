part of 'current_weather_bloc.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoadingState extends CurrentWeatherState{}

class CurrentWeatherLoadedState extends CurrentWeatherState{
  const CurrentWeatherLoadedState({required this.currentWeatherItem});

  final CurrentWeather currentWeatherItem;

  @override
  List<Object> get props => [currentWeatherItem];
}

class CurrentWeatherLoadingFailedState extends CurrentWeatherState {
  const CurrentWeatherLoadingFailedState({required this.errorMessage});

  final String errorMessage;
}

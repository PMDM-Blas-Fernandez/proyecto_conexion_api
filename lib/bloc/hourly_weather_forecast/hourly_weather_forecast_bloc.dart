import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/exceptions/exception_handler.dart';
import 'package:flutter_weather_app/models/model_hourly_weather_forecast.dart';
import 'package:flutter_weather_app/repositories/hourly_weather_forecast_repository.dart';

part 'hourly_weather_forecast_event.dart';
part 'hourly_weather_forecast_state.dart';

class HourlyWeatherForecastBloc extends Bloc<HourlyWeatherForecastEvent, HourlyWeatherForecastState> {
  final HourlyWeatherForecastRepository hourlyWeatherForecastRepository;
  final String location;

  HourlyWeatherForecastBloc({required this.hourlyWeatherForecastRepository, required this.location}) : super(HourlyWeatherForecastInitial()) {
    on<GetHourlyWeatherForecastEvent>(
      (GetHourlyWeatherForecastEvent event, Emitter emit) async {
        emit(HourlyWeatherForecastLoadingState());

        try {
          final hourlyWeatherForecastList = await hourlyWeatherForecastRepository.getHourlyWeatherForecast(location);

          if (hourlyWeatherForecastList.isEmpty) {
            emit(HourlyWeatherForecastEmptyState());
          } else {
            emit(HourlyWeatherForecastLoadedState(hourlyWeatherForecastList: hourlyWeatherForecastList));
          }
        } catch (e) {
          final errorMessage = handleExceptionWithMessage(e);

          emit(HourlyWeatherForecastLoadingFailedState(errorMessage: errorMessage));
        }
      },
    );
  }
}

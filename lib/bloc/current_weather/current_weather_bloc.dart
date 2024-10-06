import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/exceptions/exception_handler.dart';
import 'package:flutter_weather_app/models/model_current_weather.dart';
import 'package:flutter_weather_app/repositories/current_weather_repository.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  late CurrentWeatherRepository currentWeatherRepository;
  late String location;

  CurrentWeatherBloc({required currentWeatherRepository, required location}) : super(CurrentWeatherInitial()) {
    on<GetCurrentWeatherEvent>(
      (GetCurrentWeatherEvent event, Emitter<CurrentWeatherState> emit) async {
        emit(CurrentWeatherLoadingState());

        try {
          final currentWeather = await currentWeatherRepository.getCurrentWeather(location);
          emit(CurrentWeatherLoadedState(currentWeatherItem: currentWeather));
        } catch (e) {
          final errorMessage = handleExceptionWithMessage(e);

          emit(CurrentWeatherLoadingFailedState(errorMessage: errorMessage));
        }
      },
    );
  }
}

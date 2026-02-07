// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:weatherapp/weatherfeature/businesslogic/weather_model.dart';
import 'package:weatherapp/weatherfeature/businesslogic/weather_repository.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  final IWeatherRepository _repository;
  WeatherblocBloc(IWeatherRepository repository)
    : _repository = repository,
      super(WeatherblocInitial()) {
    on<WeatherFetchDataEvent>((event, emit) async {
      final weatherdata = await _repository.getWeatherdata(event.cityname);
      if (weatherdata == null) {
        emit(WeatherFailed());
      } else {
        emit(WeatherSuccess(weatherdata));
      }
    });
  }
}

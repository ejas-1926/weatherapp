// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:weatherapp/weatherfeature/businesslogic/weather_model.dart';
import 'package:weatherapp/weatherfeature/businesslogic/weather_repository.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  final IWeatherRepository _repository;

  void fetchweatherdata(
    WeatherFetchDataEvent event,
    Emitter<WeatherblocState> emit,
  ) async {
    emit(WeatherblocInitial());
    var weatherdata = await _repository.getWeatherdata(event.cityname);
    if (weatherdata == null) {
      emit(WeatherFailed("Fetching Failed"));
    } else if (weatherdata.isEmpty) {
      emit(WeatherFailed("No data available"));
    } else {
      final currentdata = weatherdata[0];
      int size = weatherdata.length;
      weatherdata = weatherdata.skip(0).take(size - 1).toList();
      emit(
        WeatherSuccess(currentweather: currentdata, weatherdata: weatherdata),
      );
    }
  }

  WeatherblocBloc(IWeatherRepository repository)
    : _repository = repository,
      super(WeatherblocInitial()) {
    on<WeatherFetchDataEvent>((event, emit) => fetchweatherdata(event, emit));
  }
}

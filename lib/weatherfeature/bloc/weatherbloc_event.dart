part of 'weatherbloc_bloc.dart';

@immutable
sealed class WeatherblocEvent {}

class WeatherFetchDataEvent extends WeatherblocEvent {
  final String cityname;

  WeatherFetchDataEvent({required this.cityname});
}

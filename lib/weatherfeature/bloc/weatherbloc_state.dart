part of 'weatherbloc_bloc.dart';

@immutable
sealed class WeatherblocState {}

final class WeatherblocInitial extends WeatherblocState {}

final class WeatherFailed extends WeatherblocState {
  final String errormessage;

  WeatherFailed(this.errormessage);
}

final class WeatherSuccess extends WeatherblocState {
  final List<Weathermodel> weatherdata;
  final Weathermodel currentweather;
  WeatherSuccess({required this.weatherdata, required this.currentweather});
}




///the main thing is a class can use models ro ds from the other layers I mean consume 
///ie you can call some functions and get the data in the form of the models or data structures of that layer 
///you can use it 
/// no prob, but dont create or use throughout the entire layer either you need to map it in some class to the model of that specified layer
/// and use it 
//entitiy vs model model is something that represents the data
//entitiy represents a business layer concept
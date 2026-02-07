import 'package:weatherapp/weatherfeature/businesslogic/weather_model.dart';
import 'package:weatherapp/weatherfeature/data/weatherds.dart';

abstract interface class IWeatherRepository {
  Future<Weathermodel?> getWeatherdata(String cityname);
}

class WeatherRepository extends IWeatherRepository {
  final IWeatherDs ds;
  WeatherRepository({required this.ds});

  @override
  Future<Weathermodel?> getWeatherdata(String cityname) async {
    try {
      var ans = await ds.getCurrentWeather();
      return Weathermodel.fromjson(ans);
    } catch (e) {
      return null;
    }
  }
}

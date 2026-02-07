import 'package:weatherapp/weatherfeature/businesslogic/weather_model.dart';
import 'package:weatherapp/weatherfeature/data/weatherds.dart';

abstract interface class IWeatherRepository {
  Future<List<Weathermodel>?> getWeatherdata(String cityname);
}

class WeatherRepository extends IWeatherRepository {
  final IWeatherDs ds;
  WeatherRepository({required this.ds});

  @override
  Future<List<Weathermodel>?> getWeatherdata(String cityname) async {
    try {
      List<Weathermodel> x = [];
      var ans = await ds.getCurrentWeather();

      for (int i = 0; i < 6; i++) {
        x.add(Weathermodel.fromjson(ans, i));
      }
      return x;
    } catch (e) {
      return null;
    }
  }
}


//here we are converting the raw data into a form  that is useful in our current application
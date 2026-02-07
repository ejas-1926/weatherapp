import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/core/secrets.dart';

abstract interface class IWeatherDs {
  Future<Map<String, dynamic>> getCurrentWeather();
}

class weatherdatasource extends IWeatherDs {
  @override
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=${AppSecrets.openWeatherAPIKey}',
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      ///When you throw inside catch, the error is re-thrown to whoever called this function.
      //////ie on weather repository again this  throw will get called
      throw e.toString();
    }
  }
}






//suppose there are multiple classes having similar name, when we try to use this 
//in our project, flutter becomes ambiguious if we use the class and two libraries having same class existing inside it,
// being imported in the same file 
//to avoid this we use the package name 
//Eg: import 'package:http/http.dart' as http;  so from now we can call the function as http.get 
//telling it belongs to the other package



//
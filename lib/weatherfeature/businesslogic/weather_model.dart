class Weathermodel {
  final double currentTemp;
  final String currentSky;
  final double pressure;
  final double windspeed;
  final double humidity;
  DateTime time;

  factory Weathermodel.fromjson(Map<String, dynamic> map, [int index = 0]) {
    //there will be multiple datas exist and we are going to take the first value from the list
    //ie map['list'] is a list of some object and we are going to take  the first element of that list
    final currentWeatherData = map['list'][index];

    //if there is no field with the name exist in the map ie if this is null then we are assigning with the default values

    return Weathermodel(
      currentTemp: currentWeatherData['main']['temp'] ?? 0 as double,
      currentSky: currentWeatherData['weather'][0]['main'] ?? 0 as double,
      pressure: currentWeatherData['main']['presssure'] ?? 0 as double,
      humidity: currentWeatherData['main']['humidity'] ?? 0 as double,
      windspeed: currentWeatherData['wind']['speed'] ?? 0 as double,
      time: DateTime.parse(currentWeatherData['dt_txt']),
    );
  }

  Weathermodel({
    required this.currentTemp,
    required this.currentSky,
    required this.pressure,
    required this.windspeed,
    required this.humidity,
    required this.time,
  });
}

// the data from the map can be type casted easily using the as operator
//as is used for type casting from one data type to the otherfinal hourlyForecast = data['list'][index + 1];

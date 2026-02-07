class Weathermodel {
  final double currentTemp;
  final String currentSky;
  final double currentPressure;

  Weathermodel({
    required this.currentTemp,
    required this.currentPressure,
    required this.currentSky,
  });

  factory Weathermodel.fromjson(Map<String, dynamic> map) {
    return Weathermodel(
      currentTemp: map['CurrentTemp'] ?? '',
      currentPressure: map['CurrentPressure'] ?? '',
      currentSky: map['CurrentSky'] ?? '',
    );
  }
}

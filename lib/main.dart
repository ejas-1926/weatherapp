import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/weatherfeature/bloc/weatherbloc_bloc.dart';
import 'package:weatherapp/weatherfeature/businesslogic/weather_repository.dart';
import 'package:weatherapp/weatherfeature/data/weatherds.dart';
import 'package:weatherapp/weatherfeature/presentation/pages/weatherscreen.dart';

void main() {
  runApp(Weatherapp());
}

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return WeatherblocBloc(WeatherRepository(ds: weatherdatasource()));
          },
        ),
      ],
      child: MaterialApp(home: WeatherScreen()),
    );
  }
}

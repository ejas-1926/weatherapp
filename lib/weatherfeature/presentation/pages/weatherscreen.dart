import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/weatherfeature/bloc/weatherbloc_bloc.dart';
import 'package:weatherapp/weatherfeature/presentation/pages/additional_info_item.dart';
import 'package:weatherapp/weatherfeature/presentation/pages/hourly_forecast_item.dart';
import 'package:weatherapp/weatherfeature/presentation/widgets/loader.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<WeatherblocBloc>(context);
    bloc.add(WeatherFetchDataEvent(cityname: "London"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: BlocBuilder(
        bloc: context.read<WeatherblocBloc>(),
        builder: (BuildContext context, WeatherblocState state) {
          // we are checking the type of the instance
          if (state is WeatherblocInitial) {
            return Loader();
          } else if (state is WeatherFailed) {
            return Center(child: Text(state.errormessage));
          }

          if (state is WeatherSuccess) {
            final currentdata = state.currentweather;
            final weatherdatalist = state.weatherdata;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // main card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '${currentdata.currentTemp} K',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Icon(
                                  currentdata.currentSky == 'Clouds' ||
                                          currentdata.currentSky == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  currentdata.currentSky,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: weatherdatalist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final weather = weatherdatalist[index];
                        final hourlySky = weather.currentSky;
                        final hourlyTemp = weather.currentTemp.toString();
                        final time = weather.time;
                        return HourlyForecastItem(
                          time: time.toString(),
                          temperature: hourlyTemp,
                          icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                              ? Icons.cloud
                              : Icons.sunny,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Additional Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: currentdata.humidity.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.air,
                        label: 'Wind Speed',
                        value: currentdata.windspeed.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: currentdata.pressure.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Scaffold();

          //shows weather success
        },
      ),
    );
  }
}

import 'dart:math';

import 'package:advanced_widgets/pages/change_weather_page/widgets/weather_icon.dart';
import 'package:flutter/material.dart';

enum Weather { sunny, cloudy, rainy }

class ChangeWeatherPage extends StatefulWidget {
  const ChangeWeatherPage({super.key});

  @override
  State<ChangeWeatherPage> createState() => _ChangeWeatherPageState();
}

class _ChangeWeatherPageState extends State<ChangeWeatherPage> {
  var randomWeather = Random().nextInt(3);

  late Weather currentWeather;
  late double opacityValue;
  late double sunOpacity;
  late double cloudOpacity;
  late double dropsOpacity;

  @override
  void initState() {
    /// Initial elements' opacity depend on current weather

    currentWeather = Weather.values[randomWeather];

    opacityValue = currentWeather == Weather.sunny
        ? 0.0
        : currentWeather == Weather.cloudy
            ? 0.5
            : 1.0;

    sunOpacity = currentWeather == Weather.sunny
        ? 1.0
        : currentWeather == Weather.cloudy
            ? 0.5
            : 0.0;

    cloudOpacity = opacityValue;

    dropsOpacity =
        currentWeather == Weather.sunny || currentWeather == Weather.cloudy
            ? 0.0
            : 1.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Weather'),
        titleTextStyle: Theme.of(context).textTheme.headlineLarge,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherIcon(
              sunOpacity: sunOpacity,
              cloudOpacity: cloudOpacity,
              dropsOpacity: dropsOpacity,
            ),
            Slider(
              value: opacityValue,
              onChanged: (newValue) => setState(
                () {
                  opacityValue = newValue;
                  sunOpacity = _getSunOpacity(newValue);
                  cloudOpacity = _getCloudOpacity(newValue);
                  dropsOpacity = _getDropsOpacity(newValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getSunOpacity(double value) {
    if (value > 0.7) {
      return 0.0;
    }

    return -1.0 / 0.7 * value + 1;
  }

  double _getCloudOpacity(double value) {
    if (value > 0.2) {
      return 1.0 / 0.8 * value - 0.2 / 0.8;
    }

    return 0.0;
  }

  double _getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }

    return 1.0 / 0.3 * value - 0.7 / 0.3;
  }
}

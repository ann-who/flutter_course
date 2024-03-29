import 'dart:math';

import 'package:advanced_widgets/pages/change_weather_page/widgets/weather_icon.dart';
import 'package:advanced_widgets/pages/current_weather_info_page/widgets/text_decoration.dart';
import 'package:flutter/material.dart';

enum Weather { sunny, cloudy, rainy }

class CurrentWeatherInfoPage extends StatefulWidget {
  const CurrentWeatherInfoPage({super.key});

  @override
  State<CurrentWeatherInfoPage> createState() => _CurrentWeatherInfoPageState();
}

class _CurrentWeatherInfoPageState extends State<CurrentWeatherInfoPage>
    with TickerProviderStateMixin {
  var randomWeather = Random().nextInt(3);
  var minDegrees = -40;
  var maxDegrees = 40;
  bool isFullScreen = false;

  late int currentDegrees;
  late Weather currentWeather;
  late double opacityValue;
  late double sunOpacity;
  late double cloudOpacity;
  late double dropsOpacity;
  late double width;
  late double height;

  late AnimationController _iconCcontroller;
  late AnimationController _textController;
  late Animation<double> _sizeAnimation;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _opacityAnimation;

  Map<Weather, String> weatherDescription = {
    Weather.sunny: 'Sunny',
    Weather.cloudy: 'Cloudy',
    Weather.rainy: 'Rainy'
  };

  @override
  void initState() {
    /// Initial elements' opacity & weather info depend on current weather

    currentWeather = Weather.values[randomWeather];
    currentDegrees = currentWeather == Weather.rainy
        ? Random().nextInt(maxDegrees)
        : minDegrees + Random().nextInt(maxDegrees - minDegrees);

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

    _iconCcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _sizeAnimation =
        Tween<double>(begin: 100.0, end: 400.0).animate(_iconCcontroller);

    _positionAnimation = Tween<Offset>(
      begin: const Offset(290.0, 0.0),
      end: const Offset(0.0, 100.0),
    ).animate(_iconCcontroller);

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_textController);

    super.initState();
  }

  @override
  void dispose() {
    _iconCcontroller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width / 4;
    height = MediaQuery.of(context).size.height / 6;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String currentWeatherDescription = weatherDescription.entries
        .where((element) => element.key == currentWeather)
        .first
        .value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather Info'),
        titleTextStyle: Theme.of(context).textTheme.headlineLarge,
      ),
      body: AnimatedBuilder(
        animation: _iconCcontroller,
        builder: (context, child) {
          return GestureDetector(
            onTap: startAnimation,
            child: Stack(
              children: [
                // Weather icon
                Positioned(
                  left: _positionAnimation.value.dx,
                  top: _positionAnimation.value.dy,
                  child: WeatherIcon(
                    sunOpacity: sunOpacity,
                    cloudOpacity: cloudOpacity,
                    dropsOpacity: dropsOpacity,
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                  ),
                ),
                // Weather description
                Positioned(
                  left: 30.0,
                  bottom: MediaQuery.of(context).size.height / 7,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          child: InnerShadowText(
                            text: currentWeatherDescription,
                            textStyle: TextStyle(
                              fontSize: 46.0,
                              letterSpacing: 8.0,
                              color: getTextColor(currentWeather),
                            ),
                            shadowColor:
                                getTextColor(currentWeather).withOpacity(0.5),
                            offset: const Offset(-4, 1),
                            blurRadius: 10.0,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          child: InnerShadowText(
                            text: '$currentDegrees degrees',
                            textStyle: TextStyle(
                              color: getTextColor(currentWeather),
                              fontSize: 40.0,
                            ),
                            shadowColor:
                                getTextColor(currentWeather).withOpacity(0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 5.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color getTextColor(Weather currentWeather) {
    if (currentWeather == Weather.rainy) {
      return Colors.blue;
    } else if (currentWeather == Weather.cloudy) {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }

  void startAnimation() {
    if (_iconCcontroller.isCompleted) {
      _iconCcontroller.reverse();
      _textController.reverse();
    } else {
      _iconCcontroller.forward();
      _textController.forward();
    }
  }
}

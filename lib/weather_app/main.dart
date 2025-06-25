import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:slider_app/weather_app/models/city.dart';
import 'package:slider_app/weather_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // _MyHomePageState createState() => _MyHomePageState();
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: AnimatedSplashScreen(
        splash: Icons.home,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: HomeWidget(
          city: City(
            cityName: 'Noida',
            weatherType: 'Haze',
            airQuality: 98,
            temprature: 34,
            date: DateTime.now(),
          ),
        ),
        backgroundColor: Colors.red,
      ),
    ));
  }
}

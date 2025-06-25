import 'package:flutter/material.dart';
import 'package:slider_app/weather_app/models/city.dart';

class PrimaryTempWidget extends StatelessWidget {
  final City city;

  const PrimaryTempWidget({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("33° C", style: TextStyle(fontSize: 70)),

        Text(
          "${city.weatherType}      ${city.temprature}°C / ${city.temprature - 10}°C",
        ),
        Text(city.cityName, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}

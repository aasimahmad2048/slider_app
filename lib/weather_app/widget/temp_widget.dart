import 'package:flutter/material.dart';
import 'package:slider_app/weather_app/models/city.dart';

class TempWidget extends StatelessWidget {
  final City city;

  const TempWidget({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(city.weatherType),
          Text(city.date.toString()),
          Text("${city.airQuality}/${city.airQuality + 10}"),
        ],
      ),
    );
  }
}

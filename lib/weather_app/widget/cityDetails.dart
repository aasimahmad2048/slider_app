import 'package:flutter/material.dart';

class CityDetails extends StatelessWidget {
  const CityDetails({
    super.key,
    required this.airQuality,
    required this.cityName,
    required this.tempratre,
  });
  final String airQuality;

  final String cityName;
  final String tempratre;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: const Color.fromARGB(255, 23, 202, 187),
      ),
      child: ListTile(
        leading: Text(cityName[0], style: TextStyle(fontSize: 40)),
        title: Text(cityName),

        subtitle: Text(airQuality),
        trailing: Text(tempratre, style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

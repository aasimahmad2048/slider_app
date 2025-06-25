import 'package:flutter/material.dart';
import 'package:slider_app/weather_app/models/city.dart';

class CityForecast extends StatelessWidget {
  final City city;
  const CityForecast({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CityName")),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            child: Transform.translate(
              offset: Offset(20, 0),
              child: Text(
                "5-Day forecast",

                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
            height: 350,
            width: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 41, 196, 170),
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(40),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(50, 0, 10, 0),
              itemCount: 5, // Total number of items
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text("$index"),
                    Text((city.date.day + index).toString()),
                    Text(city.cityName),
                    Text(city.weatherType),
                    Text((index + city.airQuality).toString()),
                  ],
                );
              },
            ),
            // child: ListView(
            //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Text("yesterday1"),
            //         Text("Icons"),
            //         Text("temp"),
            //         Text("mintemp"),
            //         Text("cloud"),
            //         Text("windspeed"),
            //       ],
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:slider_app/weather_app/models/city.dart';
import 'package:slider_app/weather_app/screens/city_forecast.dart';
import 'package:slider_app/weather_app/screens/city_screen.dart';
import 'package:slider_app/weather_app/widget/primary_temp_widget.dart';
import 'package:slider_app/weather_app/widget/temp_widget.dart';

class HomeWidget extends StatelessWidget {
  final City city;

  const HomeWidget({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CityScreen()),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
                Text(city.cityName),
                Icon(Icons.settings),
              ],
            ),
            SizedBox(height: 250),
            PrimaryTempWidget(
              city: city,
              // city: City(
              //   cityName: city.cityName,
              //   airQuality: 100,
              //   temprature: 30,
              //   weatherType: 'Haze',
              // ),
            ),
            SizedBox(height: 40),
            SizedBox(
              child: Column(
                children: [
                  Column(
                    children: [
                      TempWidget(city: city),
                      TempWidget(city: city),
                      TempWidget(city: city),
                      Divider(),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityForecast(city: city),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "5 Day forecast",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

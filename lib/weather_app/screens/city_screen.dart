import 'package:flutter/material.dart';

import 'package:slider_app/weather_app/screens/add_city_screen.dart';
import 'package:slider_app/weather_app/widget/cityDetails.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String result = 'new delhi';

  @override
  void initState() {
    super.initState();
    result = "new delhi";
  }

  List<CityDetails> cityList = List.generate(
    5,
    (index) => CityDetails(
      airQuality: "airQuality",
      cityName: "cityName",
      tempratre: "Temprature",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Manage cities", style: TextStyle(fontSize: 30)),
              IconButton(
                onPressed: () async {
                  await _getCity(context);
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                hint: Row(
                  children: [Icon(Icons.search), Text("Enter Location")],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          Text(result),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return cityList[index];
              },
              itemCount: cityList.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCity(BuildContext context) async {
    result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCityScreen()),
    );
    if (!context.mounted) return;
    setState(() {
      result;
    });
  }
}

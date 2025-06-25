import 'package:flutter/material.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({super.key});

  @override
  State<AddCityScreen> createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController _cityController = TextEditingController();
  var _city;
  @override
  void initState() {
    super.initState();
  }

  void initialize() {
    _city = 'Initialized later';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Available cities", style: TextStyle(fontSize: 25)),
          ),

          SizedBox(
            height: 100,
            width: 300,
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hint: Row(
                  children: [Icon(Icons.search), Text("Enter Location")],
                ),
              ),
            ),
          ),

          ElevatedButton(
            style: ButtonStyle(),
            onPressed: () {
              setState(() {
                _city = _cityController.text;
              });

              Navigator.pop(context, _city);
            },
            child: Text("Add City"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RangeValues _currentRangeValues = const RangeValues(10, 50);

  late int _start=0;
  late int _end=0;

  @override
  void initState() {
    super.initState();
    _start = _currentRangeValues.start.round().toString() as int;
    _end = _currentRangeValues.end.round().toString() as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("flutter Range slider")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.volume_up, size: 40),
                  Expanded(
                    child: RangeSlider(
                      values: _currentRangeValues,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                          _start = _currentRangeValues.start.round().toString() as int;

                          _end = _currentRangeValues.end.round().toString() as int;
                        });
                      },
                      min: 0,
                      max: 100,
                      divisions: 10,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  ("You have selected the range between $_start and $_end"),
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Slider Demo")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.volume_up, size: 40),
              Slider(
                value: _value.toDouble(),
                min: 1,
                max: 20,
                onChanged: ( value) {
                  setState(() {
                    _value = value.round();
                  });
                },
                semanticFormatterCallback: (double newValue) {
                  return "${newValue.round()} dollars";
                },
              
                divisions: 10,
                activeColor: Colors.green,
                inactiveColor: Colors.deepOrange,
                label: "set volume $_value",
              ),
              Text('$_value' ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  var textvalue = "Switch is off";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1,
            child: Switch(
              value: isSwitched,
              onChanged: toggleSwitch,
              activeColor: Colors.lightBlue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.pink,
            ),
          ),
          Text(textvalue, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  toggleSwitch(value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textvalue = 'Switch Butoon is ON';
      });
    } else {
      setState(() {
        isSwitched = false;
        textvalue = "Switch Button is OFF";
      });
    }
  }
}

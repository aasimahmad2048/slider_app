import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}





class _MyAppState extends State<MyApp> {
  Choice _selectedOption = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedOption = choice;
    });
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: const Text('PopupMenu Button Example'),
          actions: <Widget>[
            PopupMenuButton<Choice>(
              tooltip: "Select a service",
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.name),
                  );
                }).toList();
              },
            ),
          ],
        ),


        body: Center(
          child: SizedBox(height: 200,
          width: 200,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ChoiceCard(choice: _selectedOption),
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.name, required this.icon});
  final String name;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(name: 'Wi-Fi', icon: Icons.wifi),
  Choice(name: 'Bluetooth', icon: Icons.bluetooth),
  Choice(name: 'Battery', icon: Icons.battery_alert),
  Choice(name: 'Storage', icon: Icons.storage),
];



class ChoiceCard extends StatelessWidget {
  const ChoiceCard({super.key, required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.greenAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 115.0, color: Colors.blue),
            Text(choice.name,style: TextStyle(fontSize: 40),),
          ],
        ),
      ),
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Tooltip Example")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Tooltip(
              waitDuration: Duration(seconds: 1),
              showDuration: Duration(seconds: 2),
              padding: EdgeInsets.all(5),

              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              message: 'My Account',
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.account_box, size: 100),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Tooltip(
              message: 'My Account',
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.account_box, size: 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

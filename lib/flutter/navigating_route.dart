import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: FirstScreen()));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("firstScreen")),
      body: Column(
        children: [
          Container(
            height: 300,
            // width: 400,
            decoration: BoxDecoration(color: Colors.red),
            child: Text("this is first screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
            child: Text(" To Second Screen"),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(color: Colors.green),
            child: Text("this is Second Screen"),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FirstScreen()),
              // );
            },
            child: Text(" Go back"),
          ),
        ],
      ),
    );
  }
}

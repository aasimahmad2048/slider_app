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
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      "HomePage",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text("Search", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),

    Center(
      child: Column(
        children: [
          ListTile(
            subtitle: Text("Reliwell"),
            title: Text("data"),
            leading: Text(("this is leading")),
          ),
          ListTile(title: Text("data"), leading: Text(("this is leading"))),
          ListTile(title: Text("data"), leading: Text(("this is leading"))),
          ListTile(title: Text("data"), leading: Text(("this is leading"))),
          ListTile(title: Text("data"), leading: Text(("this is leading"))),
          ListTile(title: Text("data"), leading: Text(("this is leading"))),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom NavigationBar Example"),
        backgroundColor: Colors.green,
      ),

      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            backgroundColor: Colors.green,
            icon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
            label: "Search",
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            backgroundColor: Colors.lightBlueAccent,
            icon: Icon(Icons.person),
          ),
        ],

        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 25,
        onTap: _onItemTapped,
        elevation: 2,
      ),
    );
  }
}

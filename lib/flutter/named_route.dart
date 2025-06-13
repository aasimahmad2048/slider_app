import 'package:flutter/material.dart';
import 'package:slider_app/flutter/navigating_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Named Route App",
      initialRoute: "/",
      routes: {
        '/': (context) => MyHomepage(),
        '/second': (context) => SecondScreen(),
      },

      // home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  // @override
  // State<MyHomepage> createState() {
  //   return _MyHomePageState();
  // }

  @override
  State<MyHomepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is user Profile")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.fromLTRB(40, 50, 40, 0),
              height: 400,
              width: 400,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.blue,
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Aasim Ahmad"),
                            subtitle: Text("Flutter Developer"),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 50),
                      title: Text("User Details"),
                    ),
                    ListTile(
                      leading: Icon(Icons.public_sharp, size: 50),
                      title: Text("friends"),
                    ),
                    ListTile(
                      leading: Icon(Icons.shield, size: 50),
                      title: Text("Credentials"),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_outlined, size: 50),
                      title: Text("Log Out"),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogoutScreen(),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second");
                },
                child: Text("Go to SecondScreen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have logged out ", style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}

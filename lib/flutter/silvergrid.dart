import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(int index) {
      if (index % 3 == 1) {
        return Colors.red;
      } else if (index % 3 == 2) {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    }

    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[Icon(Icons.camera_front, size: 40)],
              backgroundColor: Colors.green,
              expandedHeight: 50,
              elevation: 10,

              title: Text("Silver Grid view"),
              actionsIconTheme: IconThemeData(color: Colors.red),
            ),

            // SliverGrid(
            //   delegate: SliverChildBuilderDelegate((context, int index) {
            //     return Container(height: 100, color: getColor(index));
            //   }),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4,
            //   ),
            // ),
            SliverGrid.count(
              crossAxisCount: 4,
              crossAxisSpacing: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 4,

              children: [
                Container(height: 100, color: getColor(1)),
                Container(height: 100, color: getColor(2)),
                Container(height: 100, color: getColor(3)),
                Container(height: 100, color: getColor(4)),
                Container(height: 100, color: getColor(1)),
                Container(height: 100, color: getColor(2)),
                Container(height: 100, color: getColor(3)),
                Container(height: 100, color: getColor(4)),
                Container(height: 100, color: getColor(1)),
                Container(height: 100, color: getColor(2)),
                Container(height: 100, color: getColor(3)),
                Container(height: 100, color: getColor(4)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

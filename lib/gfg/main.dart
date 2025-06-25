import "package:flutter/material.dart";
import "package:skeleton_text/skeleton_text.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Skeleton text",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Skeleton effect app"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
        ),

        body: listView(),
      ),
    );
  }

  listView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,

      physics: BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white70,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SkeletonAnimation(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(color: Colors.green),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 5),
                      child: SkeletonAnimation(
                        child: Container(
                          height: 15,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: SkeletonAnimation(
                          child: Container(
                            width: 60,
                            height: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

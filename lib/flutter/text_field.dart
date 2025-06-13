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
  // _MyHomePageState createState() => _MyHomePageState();
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController courseController = TextEditingController(
    text: "Computer Science",
  );

  String skill = "";
  String skill_msg = "";
  String course_msg = "";
  @override
  void initState() {
    super.initState();

    skill = "java";
  }

  void updateSkill() {
    setState(() {
      skill_msg = "skill updated";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextField")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              // cursorWidth: 3,
              // maxLength: 4,
              onChanged: (text) {
                setState(() {
                  skill = text;
                  skill_msg = "Writing";
                });
              },

              // maxLines: 2,
              decoration: InputDecoration(
                hintText: "Enter Your Skills",
                constraints: BoxConstraints(maxWidth: 300),

                labelText: "Skills",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                updateSkill();
              },
              style: ButtonStyle(),
              child: Text("Update"),
            ),

            Text(skill_msg),
            Text(skill),

            Divider(),
            TextField(
              controller: courseController,

              // cursorWidth: 3,
              // maxLength: 4,
              // onChanged: (text) {
              //   setState(() {
              //     skill = text;
              //     msg = "Writing";
              //   });
              // },

              // maxLines: 2,
              decoration: InputDecoration(
                hintText: "Enter Your Course",
                constraints: BoxConstraints(maxWidth: 300),

                labelText: "Course",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                updateCourse();
              },
              child: Text("Update Course"),
            ),
            Text(course_msg),
            Text(courseController.text),
          ],
        ),
      ),
    );
  }

  void updateCourse() {
    setState(() {
      course_msg = "Course Updated";
      courseController.text;
    });
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Returning Data',
      home: HomeScreen(student: Student(age: 25, name: 'Aasim')),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  final dynamic student;

  const HomeScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Returning Data Demo')),
      body: Center(child: SelectionButton(student: student)),
    );
  }
}

class SelectionButton extends StatefulWidget {
  final Student student;

  const SelectionButton({super.key, required this.student});

  @override
  State<SelectionButton> createState() => _SelectionButtonState(student);
}

class _SelectionButtonState extends State<SelectionButton> {
  Student student;

  _SelectionButtonState(this.student);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('${student.name}  Select an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionScreen(student: student),
      ),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, student.age);
                },
                child: const Text('AGE'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: const Text('Nope.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  late int age;
  late String name;

  Student({required this.age, required this.name});
}

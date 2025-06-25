// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Radio Button Example',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? _selectedGender = 'male';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Radio Button Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Please let us know your gender:'),
//             ListTile(
//               leading: Radio<String>(
//                 value: 'male',
//                 groupValue: _selectedGender,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//               ),
//               title: const Text('Male'),
//             ),
//             ListTile(
//               leading: Radio<String>(
//                 value: 'female',
//                 groupValue: _selectedGender,
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//               ),
//               title: const Text('Female'),
//             ),
//             const SizedBox(height: 25),
//             Text(_selectedGender == 'male' ? 'Hello gentleman!' : 'Hi lady!'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'RadioListTile Example',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? _selectedGender = 'male';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('RadioListTile Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Please let us know your gender:'),
//             RadioListTile<String>(
//               value: 'male',
//               groupValue: _selectedGender,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value;
//                 });
//               },
//               title: const Text('Male'),
//             ),
//             RadioListTile<String>(
//               value: 'female',
//               groupValue: _selectedGender,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value;
//                 });
//               },
//               title: const Text('Female'),
//             ),
//             const SizedBox(height: 25),
//             Text(_selectedGender == 'male' ? 'Hello gentleman!' : 'Hi lady!'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Radio Button Example';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(child: MyStatefulWidget()),
      ),
    );
  }
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('www.javatpoint.com'),
          leading: Radio(
            value: BestTutorSite.javatpoint,
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('www.w3school.com'),
          leading: Radio(
            value: BestTutorSite.w3schools,
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('www.tutorialandexample.com'),
          leading: Radio(
            value: BestTutorSite.tutorialandexample,
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dropdown Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedAnimal;

  final List<String> _animals = ["Dog", "Cat", "Crocodile", "Dragon"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Example')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<String>(
            value: _selectedAnimal,
            onChanged: (value) {
              setState(() {
                _selectedAnimal = value;
              });
              debugPrint("You selected $_selectedAnimal");
            },
            hint: const Center(
              child: Text(
                'Select the animal you love',
                style: TextStyle(color: Colors.white),
              ),
            ),
            underline: Container(),
            dropdownColor: Colors.amber,
            icon: const Icon(Icons.arrow_downward, color: Colors.yellow),
            isExpanded: true,
            items: _animals
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(e, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                )
                .toList(),
            selectedItemBuilder: (BuildContext context) => _animals
                .map(
                  (e) => Center(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

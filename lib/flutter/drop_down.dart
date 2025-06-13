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
  final List<ListItem> _dropdownItems = [
    ListItem(1, "GeeksforGeeks"),
    ListItem(2, "Javatpoint"),
    ListItem(3, "tutorialandexample"),
    ListItem(4, "guru99"),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _itemSelected;

  List<DropdownMenuItem<ListItem>> buildDroDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(DropdownMenuItem(value: listItem, child: Text(listItem.name)));
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDroDownMenuItems((_dropdownItems));
    _itemSelected = _dropdownMenuItems[1].value!;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _itemSelected,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _itemSelected = value!;
                    });
                  },
                ),
              ),
            ),
          ),

          Center(child: Text(_itemSelected.name)),
        ],
      ),
    );
  }
}





class ListItem {
  final int value;
  final String name;

  ListItem(this.value, this.name);
}

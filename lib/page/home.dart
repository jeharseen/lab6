import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

final List<ListItem> _fruits = [
  ListItem(1, 'Apple'),
  ListItem(2, 'Banan'),
  ListItem(2, 'Papaya'),
];

late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
late ListItem _selectedItem;

  @override 
  void initState(){
    super.initState();
      _dropdownMenuItems = _buildDropdownMenuItems(_fruits);
      _selectedItem = _dropdownMenuItems[0].value!;

  }

List<DropdownMenuItem<ListItem>> _buildDropdownMenuItems(
    List<ListItem> fruits) {
  List<DropdownMenuItem<ListItem>> items = [];

  for (ListItem listItem in fruits) {
    items.add(DropdownMenuItem(
    child: Text(listItem.name),
    value: listItem,
    ));
  }
  return items;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Input Widget"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            DropdownButton(
          value: _selectedItem,
          items: _dropdownMenuItems,
          onChanged: (value) {
          setState(() {
        _selectedItem = value!;
      });
},
)




          ],
        )),
    );

  }
  
 
}

class ListItem{
  int value;
  String name;
  ListItem(this.value, this.name);
}
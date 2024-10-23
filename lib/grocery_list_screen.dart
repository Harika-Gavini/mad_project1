import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  final String userId;

  GroceryListScreen({required this.userId});

  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
 
  List<String> _groceries = ['Apples', 'Bananas', 'Tomatoes', 'Chicken', 'Milk'];
  TextEditingController _groceryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        backgroundColor: Color(0xFFAF7AC5),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _groceryController,
                    decoration: InputDecoration(
                      hintText: 'Add a new item',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _groceries.add(_groceryController.text);
                      _groceryController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _groceries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_groceries[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _groceries.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

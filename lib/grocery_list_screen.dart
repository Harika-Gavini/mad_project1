import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  final String userId;

  const GroceryListScreen({super.key, required this.userId});

  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<String> _groceries = [
    'Apples',
    'Bananas',
    'Tomatoes',
    'Chicken',
    'Milk'
  ];
  final TextEditingController _groceryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        backgroundColor: const Color(0xFFAF7AC5),
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
                    decoration: const InputDecoration(
                      hintText: 'Add a new item',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
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
                    icon: const Icon(Icons.delete),
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

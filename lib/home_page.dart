import 'package:flutter/material.dart';
import 'recipe_category_screen.dart';
import 'profile_page.dart';
import 'meal_planning_screen.dart'; // Import the new meal planning screen
import 'grocery_list_screen.dart'; // Import the new grocery list screen

class HomePage extends StatefulWidget {
  final String userId;

  HomePage({required this.userId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Center(
        child: Text("Today's meal plan", style: TextStyle(fontSize: 24)),
      ),
      RecipeCategoryScreen(
        userId: widget.userId,
      ), // Passing userId to RecipeCategoryScreen
      MealPlanningScreen(
        userId: widget.userId,
      ), // Add Meal Planning Screen
      GroceryListScreen(
        userId: widget.userId,
      ), // Add Grocery List Screen
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Nest'),
        centerTitle: true,
        backgroundColor: Color(0xFFAF7AC5),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(userId: widget.userId),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt), // Recipe List icon
            label: 'Recipe List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule), // Meal Planning icon
            label: 'Meal Planning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), // Grocery List icon
            label: 'Grocery List',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Update the selected index
        selectedItemColor: Colors.blue, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        backgroundColor: Color(0xFFEBDEF0), // Background color for the navigation bar
      ),
    );
  }
}

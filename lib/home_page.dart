import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart'; //  marquee package
import 'recipe_category_screen.dart';
import 'profile_page.dart';
import 'meal_planning_screen.dart'; 
import 'grocery_list_screen.dart'; 

class HomePage extends StatefulWidget {
  final String userId;

  HomePage({required this.userId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> messages = [
    "Welcome to Recipe Nest!",
    "Discover Recipe Specials!",
    "Exciting Meals Await You!",
    "Unleash Your Culinary Creativity!",
  ];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        children: [
          Container(
            height: 50, // Height of the marquee container
            color: Color(0xFFAF7AC5), // Background color of the marquee
            child: Marquee(
              text: messages.join('   |   '), // Join messages for scrolling
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold, 
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 50.0,
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          SizedBox(height: 20), 
          Expanded(
            child: PageView(
              children: [
                Center(child: Text("Explore Your Home", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                Center(child: Text("Cook with the Best Recipes", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                Center(child: Text("Plan Your Meals with Ease", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                Center(child: Text("Manage Your Grocery List Smartly", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              ],
              // Allow users to swipe through messages
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ],
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

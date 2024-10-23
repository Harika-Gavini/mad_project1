import 'package:flutter/material.dart';

class MealPlanningScreen extends StatefulWidget {
  final String userId;

  MealPlanningScreen({required this.userId});

  @override
  _MealPlanningScreenState createState() => _MealPlanningScreenState();
}

class _MealPlanningScreenState extends State<MealPlanningScreen> {
 
  List<String> _daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  Map<String, String> _selectedMeals = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planning'),
        backgroundColor: Color(0xFFAF7AC5),
      ),
      body: ListView.builder(
        itemCount: _daysOfWeek.length,
        itemBuilder: (context, index) {
          String day = _daysOfWeek[index];
          return ListTile(
            title: Text(day),
            subtitle: Text(_selectedMeals[day] ?? 'No meal selected'),
            trailing: Icon(Icons.edit),
            onTap: () async {
              String? selectedMeal = await _selectMeal(context, day);
              if (selectedMeal != null) {
                setState(() {
                  _selectedMeals[day] = selectedMeal;
                });
              }
            },
          );
        },
      ),
    );
  }

  Future<String?> _selectMeal(BuildContext context, String day) async {
    
    List<String> meals = ['Pasta', 'Salad', 'Pizza', 'Grilled Chicken', 'Soup'];
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Meal for $day'),
          children: meals.map((meal) {
            return SimpleDialogOption(
              child: Text(meal),
              onPressed: () {
                Navigator.pop(context, meal);
              },
            );
          }).toList(),
        );
      },
    );
  }
}



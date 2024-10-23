import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
        backgroundColor: Color(0xFFAF7AC5),
      ),
      body: Container(
        color: Color(0xFFEBDEF0), // Set background color for the entire screen
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(recipe['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Use a Card to display the recipe details
              Card(
                margin: EdgeInsets.all(16.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe['name'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                          'Prep Time: ${recipe['prepTime']} | Calories: ${recipe['calories']}'),
                      SizedBox(height: 10),
                      Text('Ingredients:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      for (var ingredient in recipe['ingredients'])
                        Text(ingredient),
                      SizedBox(height: 20),
                      Text('Instructions:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      for (var instruction in recipe['instructions'])
                        Text(instruction),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
        backgroundColor: const Color(0xFFAF7AC5),
      ),
      body: Container(
        color: const Color(
            0xFFEBDEF0), // Set background color for the entire screen
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
              const SizedBox(height: 10),
              // Use a Card to display the recipe details
              Card(
                margin: const EdgeInsets.all(16.0),
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
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                          'Prep Time: ${recipe['prepTime']} | Calories: ${recipe['calories']}'),
                      const SizedBox(height: 10),
                      const Text('Ingredients:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      for (var ingredient in recipe['ingredients'])
                        Text(ingredient),
                      const SizedBox(height: 20),
                      const Text('Instructions:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
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

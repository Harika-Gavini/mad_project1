import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class RecipeCategoryScreen extends StatelessWidget {
  final String userId; // Accept userId as a parameter

  const RecipeCategoryScreen(
      {super.key, required this.userId}); // Constructor to pass userId

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCategoryButton(context, "Brunch"),
            _buildCategoryButton(context, "Salads"),
            _buildCategoryButton(context, "Soups"),
            _buildCategoryButton(context, "Appetizers"),
            _buildCategoryButton(context, "Meat"),
            _buildCategoryButton(context, "Seafood"),
            _buildCategoryButton(context, "Drinks"),
            _buildCategoryButton(context, "Desserts"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String category) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), // Space between buttons
      width:
          MediaQuery.of(context).size.width * 0.75, // 3/4 of the screen width
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the list of recipes for the selected category
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeListScreen(
                category: category, // Pass category to RecipeListScreen
                userId: userId,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEBDEF0), // Button background color
        ),
        child: Text(category),
      ),
    );
  }
}

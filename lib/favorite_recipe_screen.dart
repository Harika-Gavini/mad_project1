import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  const FavoriteRecipesScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
        backgroundColor: const Color(0xFFAF7AC5),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text('No favorite recipes yet!'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final recipe = favorites[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(recipe['image']),
                    title: Text(recipe['name']),
                    subtitle: Text(
                      '${recipe['calories']} calories - ${recipe['prepTime']}',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

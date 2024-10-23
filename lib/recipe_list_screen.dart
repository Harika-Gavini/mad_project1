import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatefulWidget {
  final String userId;
  final String category; // Add this line

  // Update the constructor to accept category
  RecipeListScreen({required this.userId, required this.category});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  String selectedDietaryOption = 'All'; // Default option
  List<String> dietaryOptions = ['All', 'Vegetarian', 'Non-Vegetarian', 'Gluten-Free'];


  // Sample data for recipes with image paths, ingredients, instructions, and dietary type
  final Map<String, List<Map<String, dynamic>>> recipes = {
    'Brunch': [
      {
        'name': 'Pancakes',
        'calories': 350,
        'prepTime': '20 min',
        'image': 'assets/pancakes.jpeg',
        'ingredients': [
          '1. Flour',
          '2. Baking powder',
          '3. Sugar',
          '4. Salt',
          '5. Milk',
          '6. Eggs',
          '7. Butter',
        ],
        'instructions': [
          '1. Sift the dry ingredients together.',
          '2. Make a well, then add the wet ingredients. Stir to combine.',
          '3. Scoop the batter onto a hot griddle or pan.',
          '4. Cook for two to three minutes, then flip.',
          '5. Continue cooking until brown on both sides.',
        ],
        'dietaryType': 'Vegetarian',
      },
      {
        'name': 'Egg Benedict',
        'calories': 400,
        'prepTime': '30 min',
        'image': 'assets/eggbenedict.jpeg',
        'ingredients': [
          '2 large eggs',
          '2 English muffins, split in half',
          '2 slices of Canadian bacon or ham',
          'Fresh chives or parsley (for garnish)',
        ],
        'instructions': [
          '1. Poach eggs in simmering water.',
          '2. Toast English muffins and cook bacon.',
          '3. Assemble: muffin half, bacon, egg, and hollandaise sauce.',
          '4. Garnish with chives or parsley.',
        ],
        'dietaryType': 'Non-Vegetarian',
      },
      {
        'name': 'Avocado Toast',
        'calories': 300,
        'prepTime': '10 min',
        'image': 'assets/avocadotoast.jpeg',
        'ingredients': [
          '1. Bread (your choice)',
          '2. 1 ripe avocado',
          '3. Salt and pepper',
          '4. Olive oil (optional)',
        ],
        'instructions': [
          '1. Toast the bread.',
          '2. Mash avocado and spread it on the toast.',
          '3. Season with salt, pepper, and drizzle with olive oil.',
        ],
        'dietaryType': 'Vegetarian',
      },
    ],
    'Salads': [
      {
        'name': 'Caesar Salad',
        'calories': 250,
        'prepTime': '15 min',
        'image': 'assets/caesarsalad.jpeg',
        'ingredients': [
          '1. Romaine lettuce',
          '2. Croutons',
          '3. Parmesan cheese',
          '4. Caesar dressing',
        ],
        'instructions': [
          '1. Chop romaine lettuce and place in a bowl.',
          '2. Add croutons and parmesan cheese.',
          '3. Drizzle with Caesar dressing and toss to combine.',
        ],
        'dietaryType': 'Vegetarian',
      },
    ],
    'Soups': [
      {
        'name': 'Tomato Soup',
        'calories': 150,
        'prepTime': '20 min',
        'image': 'assets/tomatosoup.jpeg',
        'ingredients': [
          '1. Tomatoes',
          '2. Onion',
          '3. Garlic',
          '4. Vegetable broth',
        ],
        'instructions': [
          '1. Sauté onion and garlic until soft.',
          '2. Add chopped tomatoes and broth, simmer for 15 minutes.',
          '3. Blend until smooth and serve.',
        ],
        'dietaryType': 'Vegetarian',
      },
    ],
    'Appetizers': [
      {
        'name': 'Bruschetta',
        'calories': 200,
        'prepTime': '15 min',
        'image': 'assets/bruschetta.jpeg',
        'ingredients': [
          '1. Baguette',
          '2. Tomatoes',
          '3. Basil',
          '4. Olive oil',
        ],
        'instructions': [
          '1. Toast baguette slices.',
          '2. Mix diced tomatoes with basil and olive oil.',
          '3. Top toasted baguette with tomato mixture.',
        ],
        'dietaryType': 'Vegetarian',
      },
    ],
    'Meat': [
      {
        'name': 'Grilled Chicken',
        'calories': 400,
        'prepTime': '30 min',
        'image': 'assets/grilledchicken.jpeg',
        'ingredients': [
          '1. Chicken breasts',
          '2. Olive oil',
          '3. Spices',
        ],
        'instructions': [
          '1. Marinate chicken in olive oil and spices.',
          '2. Grill until cooked through.',
        ],
        'dietaryType': 'Non-Vegetarian',
      },
    ],
    'Seafood': [
      {
        'name': 'Shrimp Scampi',
        'calories': 450,
        'prepTime': '25 min',
        'image': 'assets/shrimpscampi.jpeg',
        'ingredients': [
          '1. Shrimp',
          '2. Garlic',
          '3. Butter',
          '4. Lemon',
        ],
        'instructions': [
          '1. Sauté garlic in butter, add shrimp.',
          '2. Cook until shrimp are pink, add lemon juice.',
        ],
        'dietaryType': 'Non-Vegetarian',
      },
    ],
    'Drinks': [
      {
        'name': 'Mojito',
        'calories': 150,
        'prepTime': '10 min',
        'image': 'assets/mojito.jpeg',
        'ingredients': [
          '1. Mint leaves',
          '2. Lime',
          '3. Sugar',
          '4. Soda water',
        ],
        'instructions': [
          '1. Muddle mint, lime, and sugar in a glass.',
          '2. Fill with ice, top with soda water, stir.',
        ],
        'dietaryType': 'Vegan',
      },
    ],
    'Desserts': [
      {
        'name': 'Chocolate Cake',
        'calories': 350,
        'prepTime': '45 min',
        'image': 'assets/chocolatecake.jpeg',
        'ingredients': [
          '1. Flour',
          '2. Cocoa powder',
          '3. Sugar',
          '4. Eggs',
          '5. Butter',
        ],
        'instructions': [
          '1. Preheat oven and mix dry ingredients.',
          '2. Add wet ingredients, combine well.',
          '3. Bake until a toothpick comes out clean.',
        ],
        'dietaryType': 'Vegetarian',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Filter recipes based on selected dietary option for the selected category
    List<Map<String, dynamic>> filteredRecipes = recipes[widget.category] ?? [];
    
    // Further filter by dietary option
    filteredRecipes = filteredRecipes.where((recipe) {
      if (selectedDietaryOption == 'All') return true; // Show all recipes
      return recipe['dietaryType'] == selectedDietaryOption; // Filter by dietary type
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes - ${widget.category}'), // Display selected category
        actions: [
          DropdownButton<String>(
            value: selectedDietaryOption,
            icon: Icon(Icons.filter_list),
            items: dietaryOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedDietaryOption = newValue!;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = filteredRecipes[index];
          return Card(
            child: ListTile(
              leading: Image.asset(recipe['image']),
              title: Text(recipe['name']),
              subtitle: Text('${recipe['calories']} calories - ${recipe['prepTime']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(recipe: recipe),
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

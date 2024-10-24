import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';
import 'favorite_recipe_Screen.dart';

class RecipeListScreen extends StatefulWidget {
  final String userId;
  final String category;

  const RecipeListScreen(
      {super.key, required this.userId, required this.category});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  String selectedDietaryOption = 'All'; // Default option
  List<String> dietaryOptions = [
    'All',
    'Vegetarian',
    'Non-Vegetarian',
    'Gluten-Free'
  ];

  final List<Map<String, dynamic>> favorites = [];

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
        'isFavorite': false,
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
        'isFavorite': false,
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
        'isFavorite': false,
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
        'isFavorite': false,
      },
      {
        'name': 'Cobb Salad',
        'calories': 400,
        'prepTime': '20 min',
        'image': 'assets/cobbsalad.jpeg',
        'ingredients': [
          '1. Romaine lettuce, chopped',
          '2. Grilled chicken, diced',
          '3. Avocado, sliced',
          '4. Bacon, crumbled',
          '5. Blue cheese, crumbled',
          '6. Hard-boiled eggs, sliced',
        ],
        'instructions': [
          '1. Arrange lettuce on a plate.',
          '2. Top with chicken, avocado, bacon, blue cheese, and eggs.',
          '3. Drizzle with dressing of your choice.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Greek Salad',
        'calories': 250,
        'prepTime': '10 min',
        'image': 'assets/greeksalad.jpeg',
        'ingredients': [
          '1. Cucumber, diced',
          '2. Tomatoes, diced',
          '3. Red onion, sliced',
          '4. Feta cheese, crumbled',
          '5. Olive oil and vinegar dressing',
        ],
        'instructions': [
          '1. Combine cucumber, tomatoes, and onion in a bowl.',
          '2. Add feta cheese and drizzle with dressing.',
          '3. Toss to combine and serve chilled.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
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
        'isFavorite': false,
      },
      {
        'name': 'Chicken Noodle Soup',
        'calories': 200,
        'prepTime': '25 min',
        'image': 'assets/chicken noodles soup.jpeg',
        'ingredients': [
          '1. 1 lb chicken breast',
          '2. 4 cups chicken broth',
          '3. Carrots, diced',
          '4. Celery, diced',
          '5. Egg noodles',
        ],
        'instructions': [
          '1. Cook chicken in broth until tender.',
          '2. Remove chicken and shred it.',
          '3. Add carrots and celery to broth; simmer until soft.',
          '4. Add shredded chicken and egg noodles; cook until noodles are done.',
        ],
        'dietaryType': 'Non-Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Minestrone',
        'calories': 180,
        'prepTime': '35 min',
        'image': 'assets/Minestrone.jpeg',
        'ingredients': [
          '1. 1 can of beans',
          '2. 1 cup pasta',
          '3. 1 onion, chopped',
          '4. 2 carrots, diced',
          '5. 2 stalks celery, diced',
          '6. 4 cups vegetable broth',
        ],
        'instructions': [
          '1. Sauté onion, carrots, and celery until soft.',
          '2. Add broth and bring to a boil.',
          '3. Stir in pasta and beans; simmer until pasta is cooked.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
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
        'isFavorite': false,
      },
      {
        'name': 'Spring Rolls',
        'calories': 200,
        'prepTime': '20 min',
        'image': 'assets/springrolls.jpeg',
        'ingredients': [
          '1. Rice paper wrappers',
          '2. Lettuce leaves',
          '3. Shrimp or tofu',
          '4. Vermicelli noodles',
          '5. Fresh herbs (mint, cilantro)',
        ],
        'instructions': [
          '1. Soak rice paper in warm water until pliable.',
          '2. Layer lettuce, shrimp/tofu, noodles, and herbs.',
          '3. Roll tightly and serve with dipping sauce.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Nachos',
        'calories': 350,
        'prepTime': '10 min',
        'image': 'assets/nachos.jpeg',
        'ingredients': [
          '1. Tortilla chips',
          '2. Shredded cheese',
          '3. Jalapeños',
          '4. Salsa',
          '5. Sour cream (optional)',
        ],
        'instructions': [
          '1. Preheat oven to 350°F (175°C).',
          '2. Spread chips on a baking sheet.',
          '3. Top with cheese and jalapeños.',
          '4. Bake for 10 minutes and serve with salsa and sour cream.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
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
        'isFavorite': false,
      },
      {
        'name': 'Beef Steak',
        'calories': 500,
        'prepTime': '30 min',
        'image': 'assets/beafsteak.jpeg',
        'ingredients': [
          '1. 2 ribeye steaks',
          '2. Olive oil',
          '3. Salt and pepper',
          '4. Garlic (optional)',
        ],
        'instructions': [
          '1. Season steaks with salt and pepper.',
          '2. Heat olive oil in a pan over high heat.',
          '3. Cook steaks for 4-5 minutes on each side for medium-rare.',
          '4. Let rest for 5 minutes before serving.',
        ],
        'dietaryType': 'Non-Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Pork Chops',
        'calories': 450,
        'prepTime': '30 min',
        'image': 'assets/porkchop.jpeg',
        'ingredients': [
          '1. 4 pork chops',
          '2. Olive oil',
          '3. Salt and pepper',
          '4. Garlic powder (optional)',
        ],
        'instructions': [
          '1. Preheat oven to 375°F (190°C).',
          '2. Season pork chops with salt, pepper, and garlic powder.',
          '3. Sear chops in a hot skillet for 3-4 minutes per side.',
          '4. Transfer to the oven and bake for 15-20 minutes.',
        ],
        'dietaryType': 'Non-Vegetarian',
        'isFavorite': false,
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
        'isFavorite': false,
      },
      {
        'name': 'Shrimp Scampi',
        'calories': 400,
        'prepTime': '25 min',
        'image': 'assets/shrimpscampi.jpeg',
        'ingredients': [
          '1. 1 lb shrimp, peeled and deveined',
          '2. 4 cloves garlic, minced',
          '3. 1/2 cup white wine',
          '4. 1/4 cup butter',
          '5. Parsley (for garnish)',
        ],
        'instructions': [
          '1. In a skillet, melt butter over medium heat.',
          '2. Add garlic and sauté until fragrant.',
          '3. Add shrimp and cook until pink.',
          '4. Pour in white wine and simmer for 2-3 minutes.',
          '5. Garnish with parsley and serve over pasta.',
        ],
        'dietaryType': 'Non-Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Fish Tacos',
        'calories': 300,
        'prepTime': '30 min',
        'image': 'assets/fishtaco.jpeg',
        'ingredients': [
          '1. 1 lb white fish',
          '2. Tortillas',
          '3. Cabbage, shredded',
          '4. Avocado, sliced',
          '5. Lime juice',
        ],
        'instructions': [
          '1. Grill or pan-fry fish until cooked.',
          '2. Warm tortillas in a skillet.',
          '3. Assemble tacos with fish, cabbage, and avocado.',
          '4. Squeeze lime juice over the top.',
        ],
        'dietaryType': 'Non-Vegetarian',
        'isFavorite': false,
      }
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
        'isFavorite': false,
      },
      {
        'name': 'Pinacolado',
        'calories': 150,
        'prepTime': '5 min',
        'image': 'assets/pinacolado.jpeg',
        'ingredients': [
          '1. 2 oz light rum',
          '2. 1 oz coconut cream',
          '3. 1 oz heavy cream',
          '4. 6 oz fresh pineapple juice',
          '5. 1/2 cup crushed ice',
        ],
        'instructions': [
          '1. Blend all ingredients until smooth.',
          '2. Pour into a chilled glass and garnish with pineapple.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Iced Coffee',
        'calories': 120,
        'prepTime': '5 min',
        'image': 'assets/icedcoffe.jpeg',
        'ingredients': [
          '1. Brewed coffee (chilled)',
          '2. Ice cubes',
          '3. Milk or cream (optional)',
          '4. Sweetener (optional)',
        ],
        'instructions': [
          '1. Fill a glass with ice cubes.',
          '2. Pour in chilled coffee.',
          '3. Add milk and sweetener to taste.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
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
        'isFavorite': false,
      },
      {
        'name': 'Ice Cream Sundae',
        'calories': 300,
        'prepTime': '10 min',
        'image': 'assets/icecreamsundae.jpeg',
        'ingredients': [
          '1. Ice cream (your choice)',
          '2. Chocolate syrup',
          '3. Whipped cream',
          '4. Cherries (for topping)',
          '5. Nuts (optional)',
        ],
        'instructions': [
          '1. Scoop ice cream into a bowl.',
          '2. Drizzle with chocolate syrup.',
          '3. Top with whipped cream, nuts, and a cherry.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
      },
      {
        'name': 'Apple Pie',
        'calories': 400,
        'prepTime': '45 min',
        'image': 'assets/applepie.jpeg',
        'ingredients': [
          '1. 6-8 apples (peeled and sliced)',
          '2. 1/2 cup sugar',
          '3. 1 tsp cinnamon',
          '4. 1/4 tsp nutmeg',
          '5. 1/4 cup flour',
          '6. Pie crust (top and bottom)',
        ],
        'instructions': [
          '1. Preheat oven to 425°F (220°C).',
          '2. Mix apples, sugar, cinnamon, nutmeg, and flour.',
          '3. Place filling in pie crust and cover with top crust.',
          '4. Cut slits in the top crust to vent.',
          '5. Bake for 45-50 minutes until golden brown.',
        ],
        'dietaryType': 'Vegetarian',
        'isFavorite': false,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRecipes = recipes[widget.category] ?? [];

    // Further filter by dietary option
    filteredRecipes = filteredRecipes.where((recipe) {
      if (selectedDietaryOption == 'All') return true; // Show all recipes
      return recipe['dietaryType'] ==
          selectedDietaryOption; // Filter by dietary type
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Recipes - ${widget.category}'), // Display selected category
        actions: [
          DropdownButton<String>(
            value: selectedDietaryOption,
            icon: const Icon(Icons.filter_list),
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
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoriteRecipesScreen(favorites: favorites),
                ),
              );
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
              subtitle: Text(
                  '${recipe['calories']} calories - ${recipe['prepTime']}'),
              trailing: IconButton(
                icon: Icon(
                  recipe['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                  color: recipe['isFavorite'] ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    recipe['isFavorite'] = !recipe['isFavorite'];
                    if (recipe['isFavorite']) {
                      favorites.add(recipe);
                    } else {
                      favorites.remove(recipe);
                    }
                  });
                },
              ),
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

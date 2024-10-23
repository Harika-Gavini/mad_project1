import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;
  final String userId;

  // Sample data for recipes with image paths, ingredients, and instructions
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
          'For the Hollandaise Sauce:',
          '3 large egg yolks',
          '1 tablespoon lemon juice',
          '1/2 cup unsalted butter, melted',
          'Salt and pepper to taste',
          'A pinch of cayenne pepper (optional)',
        ],
        'instructions': [
          '1. Prepare the Hollandaise Sauce: In a bowl, whisk together the egg yolks and lemon juice until thick. Gradually drizzle in the melted butter while whisking continuously until the sauce is smooth and creamy. Season with salt, pepper, and cayenne pepper (if using). Set aside.',
          '2. Cook the Canadian Bacon: In a skillet over medium heat, cook the Canadian bacon or ham slices until heated through and slightly browned. Set aside.',
          '3. Poach the Eggs: Fill a saucepan with water and bring to a gentle simmer. Crack the eggs into a small bowl, then gently slide them into the simmering water. Cook for about 3-4 minutes until the whites are set but the yolks are still runny. Remove with a slotted spoon.',
          '4. Toast the English Muffins: Toast the English muffins until golden brown.',
          '5. Assemble the Eggs Benedict: Place a slice of Canadian bacon on each half of the toasted English muffin. Top with a poached egg, then drizzle with hollandaise sauce. Garnish with chopped chives or parsley.',
        ],
      },
      {
        'name': 'Avocado Toast',
        'calories': 300,
        'prepTime': '10 min',
        'image': 'assets/avocadotoast.jpeg',
        'ingredients': [
          '1. Bread (your choice)',
          '2. 1 ripe avocado',
          '3. Salt and pepper to taste',
          '4. Olive oil (optional)',
          '5. Lemon juice (optional)',
        ],
        'instructions': [
          '1. Toast the bread until golden brown.',
          '2. Mash the avocado in a bowl, add salt, pepper, and lemon juice.',
          '3. Spread the avocado mixture over the toasted bread.',
          '4. Drizzle with olive oil if desired.',
        ],
      },
    ],
    'Drinks': [
      {
        'name': 'Mojito',
        'calories': 200,
        'prepTime': '5 min',
        'image': 'assets/mojito.jpeg',
        'ingredients': [
          '1. Fresh mint leaves',
          '2. 1 lime (cut into wedges)',
          '3. 2 tablespoons sugar',
          '4. 1 cup ice cubes',
          '5. 1.5 oz white rum',
          '6. Club soda',
        ],
        'instructions': [
          '1. Muddle mint leaves and lime with sugar.',
          '2. Add ice and pour in rum.',
          '3. Top with club soda and stir well.',
        ],
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
      },
    ],
    'Meat': [
      {
        'name': 'Grilled Chicken',
        'calories': 300,
        'prepTime': '25 min',
        'image': 'assets/grilledchicken.jpeg',
        'ingredients': [
          '1. 4 chicken breasts',
          '2. Olive oil',
          '3. Salt and pepper to taste',
          '4. Your choice of herbs (e.g., rosemary, thyme)',
        ],
        'instructions': [
          '1. Preheat grill to medium-high heat.',
          '2. Brush chicken with olive oil and season with salt, pepper, and herbs.',
          '3. Grill for 6-7 minutes on each side or until fully cooked.',
          '4. Let rest before slicing.',
        ],
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
      },
    ],
    'Seafood': [
      {
        'name': 'Grilled Salmon',
        'calories': 350,
        'prepTime': '20 min',
        'image': 'assets/grilled salmon.jpeg',
        'ingredients': [
          '1. 4 salmon fillets',
          '2. Olive oil',
          '3. Lemon juice',
          '4. Salt and pepper',
        ],
        'instructions': [
          '1. Preheat grill to medium-high heat.',
          '2. Brush salmon with olive oil and lemon juice. Season with salt and pepper.',
          '3. Grill for 4-5 minutes on each side.',
          '4. Serve with lemon wedges.',
        ],
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
      },
    ],
    'Salads': [
      {
        'name': 'Caesar Salad',
        'calories': 300,
        'prepTime': '15 min',
        'image': 'assets/caesarsalad.jpeg',
        'ingredients': [
          '1. Romaine lettuce, chopped',
          '2. Caesar dressing',
          '3. Croutons',
          '4. Grated Parmesan cheese',
        ],
        'instructions': [
          '1. In a large bowl, toss lettuce with Caesar dressing.',
          '2. Add croutons and toss again.',
          '3. Sprinkle with grated Parmesan cheese before serving.',
        ],
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
      },
    ],
    'Soups': [
      {
        'name': 'Tomato Soup',
        'calories': 150,
        'prepTime': '30 min',
        'image': 'assets/tomato soup.jpeg',
        'ingredients': [
          '1. 2 cans of diced tomatoes',
          '2. 1 onion, chopped',
          '3. 2 cloves garlic, minced',
          '4. 1 cup vegetable broth',
          '5. Basil and salt to taste',
        ],
        'instructions': [
          '1. Sauté onion and garlic until soft.',
          '2. Add tomatoes and broth; simmer for 20 minutes.',
          '3. Blend until smooth and season with basil and salt.',
        ],
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
      },
    ],
    'Appetizers': [
      {
        'name': 'Bruschetta',
        'calories': 250,
        'prepTime': '15 min',
        'image': 'assets/Bruschetta.jpeg',
        'ingredients': [
          '1. Baguette, sliced',
          '2. Tomatoes, diced',
          '3. Garlic, minced',
          '4. Fresh basil, chopped',
          '5. Olive oil',
          '6. Balsamic vinegar',
        ],
        'instructions': [
          '1. Preheat oven to 400°F (200°C).',
          '2. Mix tomatoes, garlic, basil, olive oil, and vinegar.',
          '3. Toast baguette slices in the oven for 5 minutes.',
          '4. Top toasted bread with the tomato mixture.',
        ],
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
      },
    ],
    'Desserts': [
      {
        'name': 'Chocolate Cake',
        'calories': 450,
        'prepTime': '60 min',
        'image': 'assets/chocolatecake.jpeg',
        'ingredients': [
          '1. 1 3/4 cups all-purpose flour',
          '2. 3/4 cup cocoa powder',
          '3. 2 cups sugar',
          '4. 1 1/2 tsp baking powder',
          '5. 1 1/2 tsp baking soda',
          '6. 1 tsp salt',
          '7. 2 large eggs',
          '8. 1 cup milk',
          '9. 1/2 cup vegetable oil',
          '10. 2 tsp vanilla extract',
          '11. 1 cup boiling water',
        ],
        'instructions': [
          '1. Preheat oven to 350°F (175°C).',
          '2. Grease and flour two 9-inch round cake pans.',
          '3. Mix dry ingredients in a bowl.',
          '4. Add wet ingredients and mix until smooth.',
          '5. Pour into prepared pans and bake for 30-35 minutes.',
          '6. Cool before frosting.',
        ],
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
      },
    ],
  };

  RecipeListScreen({required this.category, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes in $category'),
        backgroundColor: Color(0xFFAF7AC5),
      ),
      body: Container(
        color: Color(0xFFEBDEF0), // Set background color
        child: ListView.builder(
          itemCount: recipes[category]?.length ?? 0,
          itemBuilder: (context, index) {
            final recipe = recipes[category]![index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Image.asset(recipe['image'], width: 50, height: 50),
                title: Text(recipe['name']),
                subtitle: Text(
                    'Prep Time: ${recipe['prepTime']}, Calories: ${recipe['calories']}'),
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
      ),
    );
  }
}

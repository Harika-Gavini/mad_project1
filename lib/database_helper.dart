import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 2, // Increment the version to update the schema
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            first_name TEXT, 
            last_name TEXT, 
            email TEXT, 
            user_id TEXT UNIQUE, 
            password TEXT
          )
          ''',
        ).then((_) {
          // Create recipes table
          return db.execute('''
          CREATE TABLE recipes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category TEXT,
            name TEXT,
            prep_time INTEGER,
            calories INTEGER,
            instructions TEXT,
            ingredients TEXT
          )
          ''');
        }).then((_) {
          // Create favorite recipes table
          return db.execute('''
          CREATE TABLE favorite_recipes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            recipe_id INTEGER,
            FOREIGN KEY (user_id) REFERENCES users(user_id),
            FOREIGN KEY (recipe_id) REFERENCES recipes(id)
          )
          ''');
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          // Adding new columns to recipes table if upgrading from an older version
          db.execute('''
            ALTER TABLE recipes ADD COLUMN category TEXT;
          ''');
        }
      },
    );
  }

  // Insert new user
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  // Retrieve user from database for login based on userId and password
  Future<Map<String, dynamic>?> getUser(String userId, String password) async {
    final db = await database;
    var res = await db.query(
      'users',
      where: 'user_id = ? AND password = ?',
      whereArgs: [userId, password],
    );
    return res.isNotEmpty ? res.first : null;
  }

  // Get the profile of the currently logged-in user based on userId
  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final db = await database;
    var res = await db.query(
      'users',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return res.isNotEmpty ? res.first : null;
  }

  // Update the user's profile, except for the user_id
  Future<int> updateProfile(
      String userId, String fullName, String email) async {
    final db = await database;
    return await db.update(
      'users',
      {
        'first_name': fullName.split(' ').first,
        'last_name': fullName.split(' ').last,
        'email': email,
      },
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  // Update the user's password
  Future<int> updatePassword(String userId, String newPassword) async {
    final db = await database;
    return await db.update(
      'users',
      {'password': newPassword},
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  // Insert a new recipe
  Future<int> insertRecipe(Map<String, dynamic> recipe) async {
    final db = await database;
    return await db.insert('recipes', recipe);
  }

  // Get recipes based on the category
  Future<List<Map<String, dynamic>>> getRecipesByCategory(
      String category) async {
    final db = await database;
    return await db.query(
      'recipes',
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  // Add a recipe to favorites
  Future<void> addFavorite(String userId, int recipeId) async {
    final db = await database;
    await db.insert('favorite_recipes', {
      'recipe_id': recipeId,
      'user_id': userId,
    });
  }

  // Remove a recipe from favorites
  Future<void> removeFavorite(int recipeId) async {
    final db = await database;
    await db.delete(
      'favorite_recipes',
      where: 'recipe_id = ?',
      whereArgs: [recipeId],
    );
  }

  // Get favorite recipes for a user
  Future<List<Map<String, dynamic>>> getFavoriteRecipes(String userId) async {
    final db = await database;
    final favoriteIds = await db.query(
      'favorite_recipes',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    List<Map<String, dynamic>> favoriteRecipes = [];
    for (var favorite in favoriteIds) {
      var recipe = await db.query(
        'recipes',
        where: 'id = ?',
        whereArgs: [favorite['recipe_id']],
      );
      if (recipe.isNotEmpty) {
        favoriteRecipes.add(recipe.first);
      }
    }
    return favoriteRecipes;
  }

  // Get all recipe categories (unique)
  Future<List<String>> getRecipeCategories() async {
    final db = await database;
    final categories =
        await db.rawQuery('SELECT DISTINCT category FROM recipes');
    return categories.map((cat) => cat['category'] as String).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Nest'),
        centerTitle: true,
        backgroundColor: const Color(0xFFAF7AC5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String userId = _userIdController.text;
                String password = _passwordController.text;

                // Ensure both fields are not empty
                if (userId.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('User ID and Password are required!')),
                  );
                  return; // Stop further execution
                }

                // Platform-specific login logic
                if (Theme.of(context).platform == TargetPlatform.android ||
                    Theme.of(context).platform == TargetPlatform.iOS) {
                  // Mobile: Check against database
                  var user = await dbHelper.getUser(userId, password);
                  if (user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful!')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(userId: user['user_id']),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Invalid User ID or Password!')),
                    );
                  }
                } else {
                  // Web: Check against SharedPreferences
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String storedPassword = prefs.getString(userId) ?? '';
                  if (storedPassword == password) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful!')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(userId: userId),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Invalid User ID or Password!')),
                    );
                  }
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/signup'); // Navigate to signup page
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

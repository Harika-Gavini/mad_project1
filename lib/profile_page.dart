import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  const ProfilePage({super.key, required this.userId});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData(); // Load profile data on initialization
  }

  Future<void> _loadProfileData() async {
    var profile = await dbHelper.getUserProfile(widget.userId);
    if (profile != null) {
      setState(() {
        _fullNameController.text =
            '${profile['first_name']} ${profile['last_name']}';
        _emailController.text = profile['email'];
      });
    }
  }

  Future<void> _updateProfile() async {
    String fullName = _fullNameController.text;
    String email = _emailController.text;

    // Save the updated profile in the database
    await dbHelper.updateProfile(widget.userId, fullName, email);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );

    // Navigate back to HomePage after saving
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage(userId: widget.userId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: false, // User ID is non-editable
              decoration: InputDecoration(
                labelText: 'User ID',
                hintText: widget.userId, // Display the User ID
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateProfile, // Call _updateProfile when saving
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

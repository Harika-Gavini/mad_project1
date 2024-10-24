import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'login_page.dart'; // Import your login page

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
  bool _isEditing = false; // Track if in editing mode

  @override
  void initState() {
    super.initState();
    _loadProfileData();
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

    await dbHelper.updateProfile(widget.userId, fullName, email);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );

    setState(() {
      _isEditing = false; // Exit editing mode after saving
    });
  }

  Future<void> _changePassword() async {
    String? oldPassword;
    String? newPassword;

    oldPassword = await _showOldPasswordDialog();
    if (oldPassword == null || oldPassword.isEmpty) return;

    var user = await dbHelper.getUser(widget.userId, oldPassword);
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Old password is incorrect')),
      );
      return;
    }

    newPassword = await _showNewPasswordDialog();
    if (newPassword == null || newPassword.isEmpty) return;

    await dbHelper.updatePassword(widget.userId, newPassword);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated successfully')),
    );
  }

  Future<String?> _showOldPasswordDialog() {
    TextEditingController oldPasswordController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Old Password'),
          backgroundColor: const Color(0xFFAF7AC5),
          content: TextField(
            controller: oldPasswordController,
            decoration: const InputDecoration(hintText: 'Old Password'),
            obscureText: true,
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context, oldPasswordController.text),
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showNewPasswordDialog() {
    TextEditingController newPasswordController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter New Password'),
          backgroundColor: const Color(0xFFAF7AC5),
          content: TextField(
            controller: newPasswordController,
            decoration: const InputDecoration(hintText: 'New Password'),
            obscureText: true,
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context, newPasswordController.text),
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage()), // Adjust to your login page
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFAF7AC5),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing; // Toggle editing mode
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.lock),
            onPressed: _changePassword, // Change password action
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Logout action
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: InputBorder.none,
                    ),
                    enabled: _isEditing,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.mail),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                    ),
                    enabled: _isEditing,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isEditing) ...[
              ElevatedButton(
                onPressed: _updateProfile,
                child: const Text('Save'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

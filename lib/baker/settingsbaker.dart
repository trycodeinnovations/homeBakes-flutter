import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/profilegetfun.dart';

class Settingsbaker extends StatelessWidget {
  const Settingsbaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.red.shade300,
        elevation: 0,
        automaticallyImplyLeading: false, // Disables the back button
      ),
      body: Container(
        color: Colors.red.shade50,  // Background color matching the homepage theme
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Image only
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red.shade200,
              child: ClipOval(
                child: Image.asset(
                  'assets/baker.jpg', // Replace with your actual asset path
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Profile option
            _buildSettingsOption(
              context,
              icon: Icons.person,
              text: "Profile",
              onPressed: () {
                bakerprofilegetfun();
                Navigator.pushNamed(context, "bakerprofile");
              },
            ),
            const SizedBox(height: 20),
            // Logout option
            _buildSettingsOption(
              context,
              icon: Icons.logout,
              text: "Logout",
              onPressed: () {
                Navigator.pushNamed(context, "login");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context,
      {required IconData icon, required String text, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.red.shade600),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.red.shade600,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.red.shade600),
        onTap: onPressed,
      ),
    );
  }
}

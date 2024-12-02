import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/profilegetfun.dart';

class Bakerprofile extends StatelessWidget {
  const Bakerprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Baker Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.red.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Profile Image and Name Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red.shade200,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/baker.jpg', // Replace with your actual asset path
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      bakerprofilelist.first.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Name container with a label and value
            _buildProfileContainer(
              label: "Name:",
              text: bakerprofilelist.first.name,
            ),
            const SizedBox(height: 20),
            // Place container with a label and value
            _buildProfileContainer(
              label: "Place:",
              text: bakerprofilelist.first.place,
            ),
            const SizedBox(height: 20),
            // Email container with a label and value
            _buildProfileContainer(
              label: "Email:",
              text: "sahla@gmail.com", // Placeholder email
            ),
            const SizedBox(height: 20),
            // Phone number container with a label and value
            _buildProfileContainer(
              label: "Phone Number:",
              text: "9756056794", // Placeholder phone number
            ),
          ],
        ),
      ),
    );
  }

  // Reusable container for profile details with a label and the value
  Widget _buildProfileContainer({required String label, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.red.shade100),
        ),
        child: ListTile(
          title: Row(
            children: [
              // Label styled with the theme color
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade600, // Red label color
                ),
              ),
              const SizedBox(width: 10),
              // Text value styled with the theme color
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.red.shade700, // Red text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/admin/bakersmodel.dart';

class AdminViewbakerdetails extends StatelessWidget {
  final Bakersdetails bkrvws;
  const AdminViewbakerdetails({super.key, required this.bkrvws});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baker Details"),
        backgroundColor: Colors.red.shade300, // Match app bar color with other screens
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // If you have an image file for the baker, uncomment and use:
                    // CircleAvatar(
                    //   backgroundImage: FileImage(File(bkrvws.imagePath)),
                    //   radius: 40,
                    // ),
                    const SizedBox(height: 7),
                    Text(
                      bkrvws.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade700, // Text color to match theme
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildDetailContainer("Name", bkrvws.name),
            const SizedBox(height: 20),
            _buildDetailContainer("Place", bkrvws.place),
            const SizedBox(height: 20),
            _buildDetailContainer("Post", bkrvws.post),
            const SizedBox(height: 20),
            _buildDetailContainer("District", bkrvws.district),
          ],
        ),
      ),
    );
  }

  // Helper method to create a labeled container for each detail
  Widget _buildDetailContainer(String label, String value) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade100), // Border color to match theme
        borderRadius: BorderRadius.circular(7),
        color: Colors.red.shade50, // Background color to match theme
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$label:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700, // Label text color to match theme
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: Colors.red.shade600, // Value text color to match theme
            ),
          ),
        ],
      ),
    );
  }
}

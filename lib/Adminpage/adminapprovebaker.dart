import 'package:flutter/material.dart';

class Adminviewapprovedbakerist extends StatelessWidget {
  final List<dynamic> approvedlist; // Assuming the list contains baker data

  const Adminviewapprovedbakerist({super.key, required this.approvedlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approved Bakers'),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: approvedlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(approvedlist[index]['name']), // Replace with actual data fields
            subtitle: Text(approvedlist[index]['email']), // Replace with actual data fields
            leading: CircleAvatar(
              backgroundImage: NetworkImage(approvedlist[index]['profileImage']), // Example for profile image
            ),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
            onTap: () {
              // Add navigation or functionality when the list item is tapped
            },
          );
        },
      ),
    );
  }
}

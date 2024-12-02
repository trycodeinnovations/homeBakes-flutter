import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/adminviewbakerdetails.dart';
import 'package:homebakes/admin/services/admin/adminbakerget.dart';

class Adminviewbaker extends StatelessWidget {
  const Adminviewbaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baker"),
        backgroundColor: Colors.red.shade300, // Match app bar color with order screen
        automaticallyImplyLeading: false, // Remove the default back navigation
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: bakersview.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // Removed fixed height to prevent overflow issues
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.red.shade50, // Match container background color with order screen
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bakersview[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red.shade700, // Text color to match theme
                              ),
                            ),
                            Text(
                              bakersview[index].place,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red.shade600, // Text color to match theme
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AdminViewbakerdetails(
                            bkrvws: bakersview[index],
                          ),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.red.shade700, // Icon color to match theme
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

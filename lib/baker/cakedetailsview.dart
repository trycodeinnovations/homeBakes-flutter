import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/bakerdeletefun.dart';
import 'package:homebakes/admin/services/bakergetfun.dart';
import 'package:homebakes/admin/services/bakermodel.dart';
import 'package:homebakes/baker/bakerupdatenew.dart';

class Cakeviewdetails extends StatelessWidget {
  final Baker bkr;

  const Cakeviewdetails({super.key, required this.bkr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cake Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.red.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 248, 240, 245), // Main background color
              ),
              width: double.infinity,
              height: 180,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => updateScreen(
                                cakename: bkr.cakename,
                                flavour: bkr.flavour,
                                price: bkr.price,
                                id: bkr.id,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit, color: Colors.red.shade300),
                      ),
                      const SizedBox(width: 150),
                      IconButton(
                        onPressed: () async {
                          await deletebaker(bkr.id);
                          await Bakerget();
                          Navigator.pushNamed(context, "bakerhomepage");
                        },
                        icon: Icon(Icons.delete, color: Colors.red.shade300),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CircleAvatar(
                    backgroundImage: NetworkImage(bkr.images),
                    radius: 40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildDetailContainer("Cake Name", bkr.cakename),
                  _buildDetailContainer("Price", bkr.price),
                  _buildDetailContainer("Flavour", bkr.flavour),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for creating a consistent detail container with styled heading
  Widget _buildDetailContainer(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: const Color.fromARGB(255, 245, 228, 240), // Container color
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red.shade600)),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 14, color: Colors.red.shade300)),
            ],
          ),
        ),
      ),
    );
  }
}

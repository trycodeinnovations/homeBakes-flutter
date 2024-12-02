
import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/adminprovider.dart';
import 'package:homebakes/admin/services/admin/adminapprovebaker.dart';
import 'package:homebakes/admin/services/admin/adminrejectfun.dart';
import 'package:homebakes/admin/services/admin/bakersmodel.dart';
import 'package:provider/provider.dart';

class AdminViewpendingbakerdetails extends StatelessWidget {
  final Bakersdetails bakerpending;
  //  final List<dynamic> pending;
  const AdminViewpendingbakerdetails({super.key, required this.bakerpending,   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400], // Matching previous app bar color
        title: const Text(
          "Baker Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centering profile section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple[100],
                      radius: 40,
                      child: Text(
                        bakerpending.name.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurple[800],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bakerpending.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple[900],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Info Container 1 - Place
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.deepPurple[400]),
                  const SizedBox(width: 10),
                  Text(
                    bakerpending.place,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Info Container 2 - District
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  Icon(Icons.map, color: Colors.deepPurple[400]),
                  const SizedBox(width: 10),
                  Text(
                    bakerpending.district,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Info Container 3 - Post
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  Icon(Icons.markunread, color: Colors.deepPurple[400]),
                  const SizedBox(width: 10),
                  Text(
                    bakerpending.post,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // Push buttons to the bottom

            // Approve and Reject Buttons
            Consumer<Adminprovider>(builder: (context, value, child) => 
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    
                    
                    
                    onPressed: () async{
                         String status = 'Approved';
                            Map<String, dynamic> data = {
                              "status": status,
                            };
                            bakerapprovefun(data, bakerpending.id);
                          //  await value.getartistfun();
                            
                      // Approve logic goes here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${bakerpending.name} approved"))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.green[400] ,
                      
                      // iconColor: Colors.green[400], // Approve button color
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Approve",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    
                    onPressed: () {
                       String status = 'reject';
                            Map<String, dynamic> data = {
                              "status": status,
                            };
                            bakerrejectfun(data, bakerpending.id);
                      // Reject logic goes here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${bakerpending.name} rejected"))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400], // Reject button color
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Reject",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space at the bottom
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
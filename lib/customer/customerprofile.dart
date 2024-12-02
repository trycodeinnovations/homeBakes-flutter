import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/customers/customerprofilegetfun.dart';

class customerprofile extends StatelessWidget {
  const customerprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Additional controls if needed
              ],
            ),
            const SizedBox(height: 20),

            // Name field
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Text(customerprofilelist.first.name),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Place field
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Place: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Text(customerprofilelist.first.place),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Post field
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Post: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Text(customerprofilelist.first.post),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // District field
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(255, 251, 219, 246),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("District: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Text(customerprofilelist.first.district),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

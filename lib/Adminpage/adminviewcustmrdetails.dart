


import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/admin/viewcustomermodel.dart';

class AdminViewcustomerdetails extends StatelessWidget {
  final Customerviewbyadmin cstmrvws;
  const AdminViewcustomerdetails({super.key,     required this.cstmrvws});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // CircleAvatar(backgroundImage: FileImage(File(user.image)),
                    //   radius: 40,
                    // ), SizedBox(height: 7,),
                    // Text(user.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                  borderRadius: BorderRadius.circular(7),
                  color: const Color.fromARGB(255, 251, 219, 246)),
              child: Row(
                children: [
                  Text(cstmrvws.name),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 55,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 251, 219, 246)),
                child: Row(
                  children: [
                    Text(cstmrvws.email),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 55,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 251, 219, 246)),
                child: Row(
                  children: [
                    Text(cstmrvws.phoneNumber),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 55,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 251, 219, 246)),
                child: Row(
                  children: [
                    Text(cstmrvws.address),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 55,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 251, 219, 246)),
                child: const Row(
                  children: [
                    // Text(Bakersview.age),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

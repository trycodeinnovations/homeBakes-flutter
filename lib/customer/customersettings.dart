import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/bakergetfun.dart';


class Settingscustomer extends StatelessWidget {
  const Settingscustomer({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(7)),
              height: 130,
              child: const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sahla")
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 40,
                    ),
                    const Expanded(child: Text("Profile")),
                    IconButton(
                        onPressed: () {
                          Bakerget();
                          Navigator.pushNamed(context, "customerprofile");
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    const Icon(Icons.logout),
                    const SizedBox(
                      width: 40,
                    ),
                    const Expanded(child: Text("Logout")),
                    IconButton(
                        onPressed: () async {
                                  // await addItemToCartfun();
                         Navigator.pushNamed(context, "login");
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

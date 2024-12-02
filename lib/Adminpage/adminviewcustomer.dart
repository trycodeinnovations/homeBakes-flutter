import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/adminviewcustmrdetails.dart';
import 'package:homebakes/admin/services/admin/customersdetailsgetfun.dart';
import 'package:homebakes/admin/services/admin/viewcustomermodel.dart';

class Adminviewcustomer extends StatelessWidget {
  const Adminviewcustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: customervwbyadmin.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 251, 219, 246)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(customervwbyadmin[index].name),
                            Text(customervwbyadmin[index].email),
                            // Text(customerlist[index].age),
                            // Text(customerlist[index].district),
                            // Text(customerlist[index].post),
                            // Text(customerlist[index].password),
                            // Text(customerlist[index].confirmpassword),
                            // Text(customerlist[index].email),
                            // Text(customerlist[index].username),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminViewcustomerdetails(
                                cstmrvws: Customerviewbyadmin(
                                    customerId:
                                        customervwbyadmin[index].customerId,
                                    name: customervwbyadmin[index].name,
                                    email: customervwbyadmin[index].email,
                                    phoneNumber:customervwbyadmin[index].phoneNumber,
                                    address:customervwbyadmin[index].address,)),
                          ));
                        },
                        icon: const Icon(Icons.arrow_forward_ios))
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

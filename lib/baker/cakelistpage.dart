import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/Bakers/Bakercakegetfun.dart';
import 'package:homebakes/admin/services/bakermodel.dart';
import 'package:homebakes/baker/cakedetailsview.dart';

class Listcakepage extends StatelessWidget {
  const Listcakepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cake List",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300, // Home screen theme color
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red.shade50, // Light background color for consistency
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bakerscakelist.length,
          itemBuilder: (BuildContext context, int index) {
            print('abd=${bakerscakelist.length}');
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
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(bakerscakelist[index].images),
                    backgroundColor: Colors.red.shade100, // Placeholder color
                  ),
                  title: Text(
                    bakerscakelist[index].cakename,
                    style: TextStyle(
                      fontSize: 16, // Reduced font size for cakename
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade600,
                    ),
                  ),
                  subtitle: Text(
                    bakerscakelist[index].flavour,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red.shade300,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.red.shade300,
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cakeviewdetails(
                            bkr: Baker(
                              price: bakerscakelist[index].price,
                              cakename: bakerscakelist[index].cakename,
                              flavour: bakerscakelist[index].flavour,
                              images: bakerscakelist[index].images,
                              id: bakerscakelist[index].id,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

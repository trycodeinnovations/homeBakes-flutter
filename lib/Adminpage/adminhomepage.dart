import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/adminviewbaker.dart';
import 'package:homebakes/Adminpage/adminviewpayment.dart';
import 'package:homebakes/Adminpage/adminviewreview.dart';
import 'package:homebakes/Adminpage/viewordersdetails.dart';
import 'package:homebakes/admin/services/admin/adminviewproduct.dart';

class Adminhomepage extends StatelessWidget {
  Adminhomepage({super.key});

  final ValueNotifier<int> current = ValueNotifier(0);

  final List<Widget> screens = [
   
    const Adminviewbaker(),
    const AdminViewOrdersGrid(),
      const AdminPaymentViewScreen(),
    const AdminReviewView(),
  
    //  SettingsAdmin(), // Add the payment screen here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300, // Same color as baker's homepage
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red.shade300, // Matching the header with the theme
              ),
              child: const Text(
                'Admin Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
           
            ListTile(
              leading: Icon(Icons.view_agenda, color: Colors.red.shade600),
              title: Text('View Bakers', style: TextStyle(color: Colors.red.shade600)),
              onTap: () {
                current.value = 0;
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.view_agenda, color: Colors.red.shade600),
              title: Text('View Products', style: TextStyle(color: Colors.red.shade600)),
              onTap: () {
                  print(Customerdata.length);
                current.value = 1;
                Navigator.pop(context);
              },
            ),
          
            ListTile(
              leading: Icon(Icons.payment, color: Colors.red.shade600),
              title: Text('View Payments', style: TextStyle(color: Colors.red.shade600)),
              onTap: () {
                current.value = 2;
                Navigator.pop(context);
              },
            ),
              ListTile(
              leading: Icon(Icons.view_agenda, color: Colors.red.shade600),
              title: Text('View Review', style: TextStyle(color: Colors.red.shade600)),
              onTap: () {
                current.value = 3;
                Navigator.pop(context);
              },
            ),
            //  ListTile(
            //   leading: Icon(Icons.settings, color: Colors.red.shade600),
            //   title: Text('Settings', style: TextStyle(color: Colors.red.shade600)),
            //   onTap: () {
            //     current.value = 4;
            //     Navigator.pop(context); // Close the drawer
            //   },
            // ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red.shade600),
              title: Text('Logout', style: TextStyle(color: Colors.red.shade600)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "login");
              },
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: current,
        builder: (context, value, child) {
          return screens[value]; // Display the selected screen
        },
      ),
    );
  }
}

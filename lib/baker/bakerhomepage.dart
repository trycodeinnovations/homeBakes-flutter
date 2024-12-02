import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/Bakers/Bakercakegetfun.dart';
import 'package:homebakes/baker/add%20cake.dart';
import 'package:homebakes/baker/cakelistpage.dart';
import 'package:homebakes/baker/settingsbaker.dart';
import 'package:homebakes/baker/viewpayment.dart';
import 'package:homebakes/baker/viewreview.dart';

class Bakerhomepage extends StatelessWidget {
  Bakerhomepage({super.key});
  final ValueNotifier<int> current = ValueNotifier(0);

  // Screens for different functionalities
  final List<Widget> screens = [
    Addcakescreen(),       // Index 0
    const Listcakepage(),        // Index 1
    const BakerPaymentViewScreen(),  // Index 2
    const BakerReviewView(),     // Index 3
  ];

  void navigateToScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Bakery Hub",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            Card(
              color: Colors.red.shade100,
              child: InkWell(
                onTap: () => navigateToScreen(context, 0),  // Updated index to 0
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline, size: 40, color: Colors.red.shade600),
                    const SizedBox(height: 8),
                    Text("Add Cake", style: TextStyle(fontSize: 14, color: Colors.red.shade600)),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.red.shade100,
              child: InkWell(
                onTap: () async {
                  try {
                    await getbakercakefunction();
                    navigateToScreen(context, 1);  // Updated index to 1
                  } catch (e) {
                    print("Error loading cakes: $e");
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list_alt_outlined, size: 40, color: Colors.red.shade600),
                    const SizedBox(height: 8),
                    Text("List Cakes", style: TextStyle(fontSize: 14, color: Colors.red.shade600)),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.red.shade100,
              child: InkWell(
                onTap: () => navigateToScreen(context, 2),  // Updated index to 2
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.receipt_long_outlined, size: 40, color: Colors.red.shade600),
                    const SizedBox(height: 8),
                    Text("Orders", style: TextStyle(fontSize: 14, color: Colors.red.shade600)),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.red.shade100,
              child: InkWell(
                onTap: () => navigateToScreen(context, 3),  // Updated index to 3
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.reviews, size: 40, color: Colors.red.shade600),
                    const SizedBox(height: 8),
                    Text("Reviews", style: TextStyle(fontSize: 14, color: Colors.red.shade600)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: current,
        builder: (context, value, child) {
          return BottomNavigationBar(
            selectedItemColor: Colors.red.shade600,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            elevation: 10.0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
            currentIndex: current.value,
            onTap: (value) {
              current.value = value;
              if (value == 1) {
                // Navigate to the Settings page when the settings icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settingsbaker()),
                );
              }
            },
          );
        },
      ),
    );
  }
}

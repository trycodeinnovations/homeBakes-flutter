//  import 'package:flutter/material.dart';
// import 'package:homebakes/customer/add%20reviews&ratings.dart';
// import 'package:homebakes/customer/customercart.dart';
// import 'package:homebakes/customer/customersettings.dart';
// import 'package:homebakes/admin/services/bakergetfun.dart';

// // Mock cake model for Popular Cakes
// class Cake {
//   final String name;
//   final String image;
//   final double price;

//   Cake({required this.name, required this.image, required this.price});
// }

// class Customerhomepage extends StatelessWidget {
//   Customerhomepage({super.key});
//   final ValueNotifier<int> current = ValueNotifier(0);

//   // Sample list of popular cakes (replace with dynamic data)
//   final List<Cake> popularCakes = [
//     Cake(name: "Chocolate Cake", image: "https://via.placeholder.com/120", price: 15.99),
//     Cake(name: "Vanilla Cake", image: "https://via.placeholder.com/120", price: 12.99),
//     Cake(name: "Red Velvet Cake", image: "https://via.placeholder.com/120", price: 18.99),
//     Cake(name: "Strawberry Cake", image: "https://via.placeholder.com/120", price: 14.99),
//     Cake(name: "Lemon Cake", image: "https://via.placeholder.com/120", price: 13.99),
//   ];

//   // Define screens for navigation within the drawer
//   final List<Widget> screens = [
//     Settingscustomer(),
    // Customercart(),
//     AddReviewScreen(),
//   ];

//   void navigateToScreen(BuildContext context, int index) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => screens[index]),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Customer Hub",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.red.shade300,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart, color: Colors.white),
//             onPressed: () => navigateToScreen(context, 1),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.red.shade300),
//               child: const Text(
//                 "Welcome",
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings, color: Colors.red.shade300),
//               title: Text("Settings"),
//               onTap: () => navigateToScreen(context, 0),
//             ),
//             ListTile(
//               leading: Icon(Icons.star, color: Colors.red.shade300),
//               title: Text("Reviews"),
//               onTap: () => navigateToScreen(context, 2),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search cakes...",
//                   prefixIcon: Icon(Icons.search, color: Colors.red.shade300),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.red.shade300),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Up to 50% Off
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.red.shade100,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Up to 50% Off",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red.shade600,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text("Get Now", style: TextStyle(color: Colors.red.shade600)),
//                       ],
//                     ),
//                     Icon(Icons.local_offer, size: 40, color: Colors.red.shade600),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Category Cakes
//               Text(
//                 "Category Cakes",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade600),
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 5, // Replace with dynamic count
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 120,
//                       margin: EdgeInsets.only(right: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.cake, size: 40, color: Colors.red.shade600),
//                           const SizedBox(height: 8),
//                           Text("Cake $index", style: TextStyle(color: Colors.red.shade600)),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Popular Cakes
//               Text(
//                 "Popular Cakes",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade600),
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: popularCakes.length, // Use the dynamic list
//                   itemBuilder: (context, index) {
//                     final cake = popularCakes[index];
//                     return Container(
//                       width: 120,
//                       margin: EdgeInsets.only(right: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade100,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.network(
//                             cake.image, // Image from URL
//                             width: 80,
//                             height: 80,
//                             fit: BoxFit.cover,
//                           ),
//                           const SizedBox(height: 8),
//                           Text(cake.name, style: TextStyle(color: Colors.red.shade600)),
//                           Text('\$${cake.price}', style: TextStyle(color: Colors.red.shade600)),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: ValueListenableBuilder(
//         valueListenable: current,
//         builder: (context, value, child) {
//           return BottomNavigationBar(
//             selectedItemColor: Colors.red.shade600,
//             unselectedItemColor: Colors.grey,
//             backgroundColor: Colors.white,
//             elevation: 10.0,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.dashboard_outlined),
//                 label: 'Dashboard',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings_outlined),
//                 label: 'Settings',
//               ),
//             ],
//             currentIndex: current.value,
//             onTap: (value) {
//               current.value = value;
//               if (value == 1) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Settingscustomer()),
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }

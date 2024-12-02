import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/viewordersdetails.dart';
import 'package:homebakes/admin/services/admin/adminviewproduct.dart';
import 'package:homebakes/admin/services/bakergetfun.dart';
// Customer model

class AdminViewProducts extends StatelessWidget {
  const AdminViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Products', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: admingetproduct(), // Call your fetch function here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching products: ${snapshot.error}'));
          } else if (Bakerdata.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(), // Prevent scrolling on the GridView
              shrinkWrap: true, // Use shrinkWrap to take only the required height
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75, // Adjust aspect ratio for card sizing
              ),
              itemCount: Bakerdata.length,
              itemBuilder: (context, index) {
                final product = Bakerdata[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            product.images,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(child: CircularProgressIndicator());
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/no_image.png', // Provide a placeholder image asset
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product.cakename,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Flavour: ${product.flavour}',
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Price: \$${product.price}',
                            style: const TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.pinkAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Navigate to the product details page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminViewOrdersGrid(
                                    // You can pass the product to the next screen if necessary
                                  ),
                                ),
                              );
                            },
                            child: const Text('View Details', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
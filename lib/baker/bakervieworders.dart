import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/Bakers/bakerorderget.dart';


class BakerCartScreen extends StatelessWidget {
  const BakerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: FutureBuilder(
        future: bakerviewCart(), // Call the function to fetch cart data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Show loader while waiting
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Show error message
            );
          } else if (Cartdata.isEmpty) {
            return const Center(
              child: Text('No items in the cart.'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: Cartdata.length,
                itemBuilder: (context, index) {
                  final item = Cartdata[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          // Displaying the image if available
                          if (item.images.isNotEmpty)
                            Image.network(
                              item.images,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            )
                          else
                            Container(
                              height: 60,
                              width: 60,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image, color: Colors.grey),
                            ),
                          const SizedBox(width: 10),
                          // Displaying the cake details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cake: ${item.cakename}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Flavor: ${item.flavour}',
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Price: \$${item.price}',
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                                const SizedBox(height: 5),
                                // Text(
                                //   'Quantity: ${item.quantity}',
                                //   style: const TextStyle(fontSize: 14.0),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

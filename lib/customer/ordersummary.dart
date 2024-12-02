import 'package:flutter/material.dart';
import 'package:homebakes/provider/cakeprovider.dart';
import 'package:provider/provider.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Thank you for your order!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Order Details:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartCount,
                itemBuilder: (context, index) {
                  final item = cartProvider.cartItems[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(item.images, width: 50, height: 50),
                          Text(item.cakename, style: const TextStyle(fontSize: 18)),
                          Text("Flavour: ${item.flavour}"),
                          Text("Price: ${item.price}"),
                          Text("Quantity: ${item.count}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Amount:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cartProvider.gtotal.toString(),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the home page or reset the cart
                  cartProvider.clearCart(); // Clear the cart after order summary
                  Navigator.of(context).popUntil((route) => route.isFirst); // Navigate to the home page
                },
                child: const Text("Continue Shopping"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homebakes/provider/cakeprovider.dart';
import 'package:homebakes/provider/remove%20to%20cart%20fun.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.red.shade300, // Primary color
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartCount == 0) {
            return Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            );
          }

          return ListView.builder(
            itemCount: cartProvider.cartCount,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.images,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.cakename,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Flavour: ${item.flavour}",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            Text(
                              "Price: ₹${item.price}",
                              style: TextStyle(
                                color: Colors.red.shade600, // Darker accent color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartProvider.countincrement(index);
                                    cartProvider.grandtotal();
                                  },
                                  icon: const Icon(Icons.add_circle, color: Colors.green),
                                ),
                                Text(
                                  cartProvider.cartItems[index].count.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartProvider.countdecreament(index);
                                    cartProvider.grandtotal();
                                  },
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () async {
                                    await deletecart(item);
                                    cartProvider.removeFromCart(item);
                                    cartProvider.grandtotal();
                                  },
                                  icon: Icon(Icons.delete, color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(thickness: 1, color: Colors.grey.shade300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grand Total:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      "₹${cartProvider.gtotal.toString()}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade600, // Darker accent color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'checkoutpage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300, // Primary color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Proceed to Checkout (${cartProvider.cartCount} items)",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

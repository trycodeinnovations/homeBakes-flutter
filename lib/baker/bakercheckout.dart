import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/Bakers/bakercheckoutgetfun.dart';
import 'package:homebakes/admin/services/Bakers/checkoutordermodel.dart';


class BakerViewOrdersScreen extends StatelessWidget {
  const BakerViewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Orders"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Checkorder>>(
        future: bakerOrderGetFun(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No orders available."));
          } else {
            List<Checkorder> orders = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cake Name: ${order.cakename}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text('Flavour: ${order.flavour}', style: const TextStyle(fontSize: 14)),
                        Text('Price: \$${order.price}', style: const TextStyle(fontSize: 14)),
                        Text('Quantity: ${order.quantity}', style: const TextStyle(fontSize: 14)),
                        Text('Total Amount: \$${order.totalAmount}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

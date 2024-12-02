import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/Bakers/bakerseenpayment.dart';
import 'package:homebakes/admin/services/Bakers/paymentmodel.dart';
import 'package:intl/intl.dart';

class BakerPaymentViewScreen extends StatelessWidget {
  const BakerPaymentViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Baker Payments",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,  // Match the font size from the homepage model
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300,
        elevation: 0,  // Set elevation to 0 to match Bakerhomepage if applicable
      ),
      body: FutureBuilder<List<BakerPayment>>(
        future: bakerGetPayments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No payments available."));
          }

          final payments = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: payments.length,
            itemBuilder: (context, index) {
              final payment = payments[index];
              return Card(
                color: Colors.red.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    payment.cakename,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade600,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Flavour: ${payment.flavour}",
                          style: TextStyle(color: Colors.red.shade600)),
                      Text("Quantity: ${payment.quantity}",
                          style: TextStyle(color: Colors.red.shade600)),
                      Text("Price: ${payment.price}",
                          style: TextStyle(color: Colors.red.shade600)),
                      Text("Status: ${payment.isPaid ? "Paid" : "Not Paid"}",
                          style: TextStyle(color: Colors.red.shade600)),
                      Text("Date: ${formatter.format(DateTime.now())}",
                          style: TextStyle(color: Colors.red.shade600)), // Replace with actual date if available
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

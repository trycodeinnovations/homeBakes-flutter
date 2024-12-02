import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/admin/adminpaymentmodel.dart';
import 'package:homebakes/admin/services/admin/viewpayment.dart';
import 'package:intl/intl.dart';

class AdminPaymentViewScreen extends StatelessWidget {
  const AdminPaymentViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Payments",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,  // Match the font size from the homepage model
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300, // Consistent color with the baker theme
        elevation: 0, // Set elevation to 0 to match the homepage model
        automaticallyImplyLeading: false, // Remove the back navigation icon
      ),
      body: FutureBuilder<List<AdminPayment>>(
        future: adminGetAdminPayments(),
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
                color: Colors.red.shade100, // Same card color for consistency
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
                      color: Colors.red.shade600, // Text color for the title
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
                      Text("Status: ${payment.paid ? "Paid" : "Not Paid"}",
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

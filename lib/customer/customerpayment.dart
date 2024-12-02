import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/customers/paymentgetfun.dart';
import 'package:homebakes/admin/services/customers/paymentmodel.dart';
import 'package:homebakes/provider/cakeprovider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

    if (cartProvider.cartItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Payment"),
          backgroundColor: Colors.red.shade300,
        ),
        body: Center(
          child: Text(
            "Your cart is empty.",
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
        ),
      );
    }

    final cake = cartProvider.cartItems[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.red.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    const SizedBox(height: 10),
                    _buildDetailRow("Cake:", cake.cakename),
                    _buildDetailRow("Flavour:", cake.flavour),
                    _buildDetailRow(
                      "Total Amount:",
                      "₹${cartProvider.getGrandTotal}",
                      isAmount: true,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                bool paymentSuccess = true;
                await cartProvider.processPayment(paymentSuccess);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Row(
                      children: [
                        Icon(
                          paymentSuccess ? Icons.check_circle : Icons.error,
                          color: paymentSuccess ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 8),
                        const Flexible(
                          child: Text("Payment Confirmation"),
                        ),
                      ],
                    ),
                    content: Text(
                      "Payment Status: ${paymentSuccess ? "Paid" : "Not Paid"}\nDate: ${formatter.format(DateTime.now())}",
                      style: TextStyle(color: Colors.grey.shade700),
                      softWrap: true, // Allow text wrapping
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await addpayment(
                            Payment(
                              id: cake.customerid,
                              cakename: cake.cakename,
                              flavour: cake.flavour,
                              price: cartProvider.getGrandTotal.toString(),
                              Quantity: cake.count,
                              isPaid: paymentSuccess,
                            ),
                            paymentSuccess,
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.payment, color: Colors.white),
              label: const Text("Proceed to Pay"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isAmount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: isAmount ? Colors.red.shade600 : Colors.grey.shade800,
                fontWeight: isAmount ? FontWeight.bold : FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis, // Handles overflow
              maxLines: 1, // Limits to one line
            ),
          ),
        ],
      ),
    );
  }
}

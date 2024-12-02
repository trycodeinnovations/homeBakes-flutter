import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/customers/paymentmodel.dart';

Future<void> addpayment(Payment item, bool isPaid) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('payment').add({
      'id':item.id,
      'cakename': item.cakename,
      'flavour': item.flavour,
      'price': item.price,
      'quantity': item.Quantity,
      
      'paid': isPaid ? 'Paid' : 'Not Paid', // Payment status
      'date': DateTime.now(), // Capture the current date and time
    });
    print("Payment successfully recorded");
  } catch (e) {
    print("Error adding payment to Firebase: $e");
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/admin/adminpaymentmodel.dart';

Future<List<AdminPayment>> adminGetAdminPayments() async {
  List<AdminPayment> payments = [];
  try {
    var querySnapshot = await FirebaseFirestore.instance.collection("payment").get();

    payments = querySnapshot.docs.map((doc) {
      return AdminPayment(
        id: doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
        price: doc['price'] ?? '0',
        quantity: doc['quantity'] ?? 1,
        paid: doc['paid'] == 'Paid', // Corrected to lowercase 'paid'
      );
    }).toList();

    print("Number of payments fetched: ${payments.length}");
  } catch (e) {
    print("Error fetching payments: $e");
  }
  return payments;
}

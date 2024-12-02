import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/Bakers/paymentmodel.dart';


Future<List<BakerPayment>> bakerGetPayments() async {
  List<BakerPayment> paymentss = [];
  try {
    var querySnapshot = await FirebaseFirestore.instance.collection("payment").get();

    paymentss = querySnapshot.docs.map((doc) {
      return BakerPayment(
        id: doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
        price: doc['price'] ?? '0',
        
        quantity: doc['quantity'] ?? 1,
        
        isPaid: doc['paid'] == 'Paid', // Adjust to match the admin version
      );
    }).toList();

    print("Number of payments fetched for baker: ${paymentss.length}");
  } catch (e) {
    print("Error fetching payments for baker: $e");
  }
  return paymentss;
}

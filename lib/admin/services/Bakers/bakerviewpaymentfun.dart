// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:homebakes/admin/services/customers/paymentmodel.dart';

// Future<List<Payment>> paymentgetfun(data) async {
//   try {
//     var update = FirebaseFirestore.instance.collection("payment");
//     QuerySnapshot querySnapshot = await update.get();
//     print(querySnapshot.docs.length);
//     print("Fetching payment data...");

//     paymentview = querySnapshot.docs.map((doc) {
//       return Payment(
//         id: doc.id,
//         cakename: doc['cakename'] ?? '',
//         flavour: doc['flavour'] ?? '',
//         price: doc['price'] ?? '' , // Ensure price is a double
//         Quantity: doc['quantity'] ?? 0,         // Ensure quantity is an int
//         isPaid: data.containsKey('isPaid')
//             ? (data['isPaid'] is bool ? data['isPaid'] : data['isPaid'] == 'true')
//             : false, 
//                 // Ensure isPaid is a boolean
//         // date: (doc['date'] as Timestamp).toDate(), // Correctly parse Timestamp to DateTime
//       );
//     }).toList();

//     return paymentview;
//   } catch (e) {
//     print("Error fetching payments: $e");
//     return [];
//   }
// }

// List<Payment> paymentview = [];

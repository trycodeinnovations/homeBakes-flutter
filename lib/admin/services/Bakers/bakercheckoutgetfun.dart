import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/Bakers/checkoutordermodel.dart';


Future<List<Checkorder>> bakerOrderGetFun() async {
  try {
    var orderCollection = FirebaseFirestore.instance.collection("orders");
    QuerySnapshot querySnapshot = await orderCollection.get();
    
    List<Checkorder> orders = querySnapshot.docs.map((doc) {
      return Checkorder(
        id: doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
        price: doc['price'] ?? 0,
        quantity: doc['quantity'] ?? 0,
        totalAmount: doc['totalAmount'] ?? 0,
      );
    }).toList();

    return orders;
  } catch (e) {
    print("Error fetching orders: $e");
    return [];
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/Bakers/cartmodel.dart';

Future<void> bakerviewCart() async {
  try {
    var cartCollection = FirebaseFirestore.instance.collection("cart");
    QuerySnapshot querySnapshot = await cartCollection.get();

    Cartdata = querySnapshot.docs.map((doc) {
      return Carts(
        id: doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
        price: doc['price'] ?? '',
        images: doc['images'] ?? '',
        // quantity: doc['quantity'] ?? 1, // Default to 1 if not provided
      );
    }).toList();

    print("Total items in cart: ${Cartdata.length}");
    if (Cartdata.isNotEmpty) {
      print("First item cake name: ${Cartdata[0].cakename}");
    }
  } catch (e) {
    print("Error fetching cart data: $e");
  }
}

List<Carts> Cartdata = [];

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/provider/customercakedatamodel.dart';

Future<void> addItemToCartfun(CustomerCakeData item, ) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('cart').add({
      
      'cakename': item.cakename,
      'flavour': item.flavour,
      'price': item.price,
      'images': item.images,
      'customerid': item.customerid, // Add customer ID here
    });
    print("Item successfully added to cart");
  } catch (e) {
    print("Error adding item to cart in Firebase: $e");
  }
}

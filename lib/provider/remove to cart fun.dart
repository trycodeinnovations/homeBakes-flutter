import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/provider/customercakedatamodel.dart';

Future<void> deletecart(CustomerCakeData item) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


    try {
      var snapshot = await firestore
          .collection('cart')
          .where('cakename', isEqualTo: item.cakename)
          .where('flavour', isEqualTo: item.flavour)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }print("successs");
    } catch (e) {
      print("Error removing item from cart in Firebase: $e");
    }
  }
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:homebakes/admin/services/bakermodel.dart';

Future Bakerget() async {
  try {
    var update = FirebaseFirestore.instance.collection("baker");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
    Bakerdata = querySnapshot.docs.map((doc) {
      return Baker(
        id: doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
         price: doc['price'] ?? '',
        images: doc['image'] ?? '',
      );
    }).toList();
    Bakerdata = Bakerdata;
    print(Bakerdata.length);
    print("hhhhhhhh");
    
  } catch (e) {
    print(e);
  }
}

List<Baker> Bakerdata = [];

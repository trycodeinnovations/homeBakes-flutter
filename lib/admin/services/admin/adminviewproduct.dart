import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:homebakes/admin/services/customers/customergetmodel.dart';

Future admingetproduct() async {
  try {
    var update = FirebaseFirestore.instance.collection("baker");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
    Customerdata = querySnapshot.docs.map((doc) {
      return Customer(
        id: doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
         price: doc['price'] ?? '',
        images: doc['image'] ?? '',
      );
    }).toList();
    Customerdata = Customerdata;
    print(Customerdata.length);
      print(Customerdata[1].cakename);

    print("hhhhhhhh");
    
  } catch (e) {
    print(e);
  }
}

List<Customer> Customerdata = [];

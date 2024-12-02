import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:homebakes/admin/services/admin/viewcustomermodel.dart';

Future<List<Customerviewbyadmin>> customerdetailsgetfun() async {
  try {
   
    var update = FirebaseFirestore.instance.collection("customers");

   
    QuerySnapshot querySnapshot = await update.get();

   
    print(querySnapshot.docs.length);
    print("aaaaaaaaaaaaaaaaaaaaaaa");
    print(customervwbyadmin.length);

   
    customervwbyadmin = querySnapshot.docs.map((doc) {
      return Customerviewbyadmin(
        customerId: doc.id,  
        name: doc['name'] ?? '',  
        email: doc['email'] ?? '',
        phoneNumber: doc['phoneNumber'] ?? '',
        address: doc['address'] ?? '',
        
      );
    }).toList();

    
    return customervwbyadmin;
  } catch (e) {
    
    print(e);
    return [];
  }
}

List<Customerviewbyadmin> customervwbyadmin = [];

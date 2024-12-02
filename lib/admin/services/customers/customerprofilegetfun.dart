import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:homebakes/admin/services/customers/customerprofilemodel.dart';

List<Customerprofilemodel> customerprofilelist=[];

Future customerprofilegetfun() async{
var email =FirebaseAuth.instance.currentUser!.email;
try {
   var update = FirebaseFirestore.instance.collection("customers").where('email',isEqualTo: email);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
     customerprofilelist = querySnapshot.docs.map((doc) {
      return Customerprofilemodel(

        
          id: doc.id,
          // landmark:doc['landmark']??'',
          
          name: doc['name']??'',
          post: doc['post']??'',
          place: doc['place']??'',
          district: doc['district']??'',
          
        );
    }).toList();
   customerprofilelist=customerprofilelist;

print(customerprofilelist[0].place);
print(customerprofilelist.length);


  
} catch (e) {

  print(e);
  
}

}
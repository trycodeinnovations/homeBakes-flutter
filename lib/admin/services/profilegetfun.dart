import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:homebakes/admin/services/bakerprofilemodel.dart';
List<Bakerprofilemodel> bakerprofilelist=[];

Future bakerprofilegetfun() async{
var email =FirebaseAuth.instance.currentUser!.email;
try {
   var update = FirebaseFirestore.instance.collection("bakers").where('email',isEqualTo: email);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
     bakerprofilelist = querySnapshot.docs.map((doc) {
      return Bakerprofilemodel(

        
          id: doc.id,
          // landmark:doc['landmark']??'',
          
          name: doc['name']??'',
          post: doc['post']??'',
          place: doc['place']??'',
          district: doc['district']??'',
          
        );
    }).toList();
   bakerprofilelist=bakerprofilelist;

print(bakerprofilelist[0].place);
print(bakerprofilelist.length);


  
} catch (e) {

  print(e);
  
}

}
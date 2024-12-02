
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/admin/bakersmodel.dart';



Future bakersdetailsgetfun() async{

try {
   var update = FirebaseFirestore.instance.collection("bakers");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
    print("aaaaaaaaaaaaaaaaaaaaaaa");
    print(bakersview.length);
     bakersview= querySnapshot.docs.map((doc) {
      return Bakersdetails(

        
          id: doc.id,
          
          name: doc['name']??'',
          post: doc['post']??'',
          place: doc['place']??'',
          district: doc['district']??'',
          





        );
    }).toList();
   
  
} catch (e) {

  print(e);
  return[];
}
}

List<Bakersdetails> bakersview=[];

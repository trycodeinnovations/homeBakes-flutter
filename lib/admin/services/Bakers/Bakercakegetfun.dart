import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/Bakers/Bakercakemodel.dart';
import 'package:homebakes/admin/services/loginfun.dart';


// List<Artistworklistmodel> hgfhgf= [];
// add()async{
//   hgfhgf=await getworklistfunction();
// }

Future<List<Bakerscake>> getbakercakefunction()async{

  
  try {
     
    var update = FirebaseFirestore.instance.collection("baker").where('bakerid',isEqualTo: bakerid);
    QuerySnapshot querySnapshot = await update.get();
      
    print(querySnapshot.docs);
    bakerscakelist =querySnapshot.docs.map((doc) {
      return Bakerscake(

        
          id:doc.id,
        cakename: doc['cakename'] ?? '',
        flavour: doc['flavour'] ?? '',
         price: doc['price'] ?? '',
        images: doc['image'] ?? '',
          
          );
    }).toList();
    // bakerscakelist=bakerscakelist;
    print(bakerscakelist.length);
    // print(bakerscakelist[0].cakename);
    // print("hhhhhhhh");
    // print(employeedata[0].age);
return bakerscakelist;
  } catch (e) {
    print(e);
    return [];
  }

}
List<Bakerscake> bakerscakelist = [];
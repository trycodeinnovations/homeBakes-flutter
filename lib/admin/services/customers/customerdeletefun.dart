import 'package:cloud_firestore/cloud_firestore.dart';

Future deletecustomer(id)async{
  print(id);
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  try{
    firestore.collection("customers").doc(id).delete();
    print("successsssssssssss");
  }
  catch (e) {
    print("nnnnnnnnnnnnnnno");
  print(e);
}
}
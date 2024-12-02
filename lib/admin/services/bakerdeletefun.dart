import 'package:cloud_firestore/cloud_firestore.dart';

Future deletebaker(id)async{
  print(id);
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  try{
    firestore.collection("baker").doc(id).delete();
    print("successsssssssssss");
  }
  catch (e) {
    print("nnnnnnnnnnnnnnno");
  print(e);
}
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> bakerregisterfun(email,password,data) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore =FirebaseFirestore.instance;

  try {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email:email, password: password,);
firestore.collection('bakers').add(data);


    print('success');
  } catch (e) {
    print(e);
  }
}

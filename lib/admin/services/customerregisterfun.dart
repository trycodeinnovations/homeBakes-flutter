

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> customerregisterfun(email,password,datas) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore =FirebaseFirestore.instance;

  try {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email:email, password: password);
firestore.collection('customers').add(datas);


    print('success');
  } catch (e) {
    print(e);
  }
}

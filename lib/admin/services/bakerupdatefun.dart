import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/bakergetfun.dart';

import 'package:homebakes/baker/cakelistpage.dart';

Future bakerupdate(data, id, context) async {
  print('hello');

  // FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // UserCredential user= await auth.createUserWithEmailAndPassword(email:email, password:pass );
    print('successs');
    firestore.collection('baker').doc(id).update(data);
    await Bakerget();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctxt) => const Listcakepage()));
  } catch (e) {
    print(e);

  }
}

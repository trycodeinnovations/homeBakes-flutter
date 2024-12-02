import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/admin/customersdetailsgetfun.dart';

import 'package:homebakes/customer/customerprofile.dart';

Future customerupdate(data, id, context) async {
  print('hello');

  // FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // UserCredential user= await auth.createUserWithEmailAndPassword(email:email, password:pass );
    print('successs');
    firestore.collection('customers').doc(id).update(data);
    await customerdetailsgetfun();
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (ctxt) =>const customerprofile()));
  } catch (e) {
    print(e);

  }
}

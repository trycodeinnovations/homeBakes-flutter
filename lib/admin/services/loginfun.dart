import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/adminhomepage.dart';
import 'package:homebakes/admin/services/admin/adminbakerget.dart';
import 'package:homebakes/admin/services/customers/customerprofilegetfun.dart';
import 'package:homebakes/admin/services/customers/customerscakegetfun.dart';
import 'package:homebakes/admin/services/profilegetfun.dart';
import 'package:homebakes/baker/bakerhomepage.dart';
import 'package:homebakes/customer/customercart.dart';
String? bakerid;
String? customerid;

Future login(email, password, context) async {
  FirebaseAuth auther = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    UserCredential user = await auther.signInWithEmailAndPassword(
        email: email, password: password);
    if (user.user != null) {
      if (email == "admin@gmail.com") {

        // artistgetfun();
         bakersdetailsgetfun();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Adminhomepage(),
            ));
      } else  {
        QuerySnapshot<Map<String, dynamic>> bakerDoc = await firestore
            .collection('bakers')
            .where('email', isEqualTo: email)
            .get();
            await bakerprofilegetfun();
            // await getbakercakefunction();
        print(bakerDoc.docs);
        
        // print()
        if (bakerDoc.docs.isNotEmpty) {
          bakerid=bakerDoc.docs.first.id;
          print("Document exists");
          // var fieldValue = artistDoc.get('fieldname');  // Replace 'fieldname' with the actual field name
          // print(fieldValue);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Bakerhomepage()));
        } else {
 QuerySnapshot<Map<String, dynamic>> customerDoc = await firestore
            .collection('customers')
            .where('email', isEqualTo: email)
            .get();
                    await customerprofilegetfun();
            print(customerDoc.docs);
                    if (customerDoc.docs.isNotEmpty) {
                         customerid=customerDoc.docs.first.id;
                      
          // Validate the password
          // await Bakerget();
          //  Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => Customerhomepage()));
           await Customerget();
           Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Customerhomepage()));
        }        }
       
//        
      }
      
      
      //  print("success");
    } else {
      print("failed");
      
    }
  } catch (e) {
    print(e);
  }
}

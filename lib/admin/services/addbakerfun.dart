import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

Future<void> addbakesfun(data,  img) async {
  // FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore =FirebaseFirestore.instance;

  try {
  if (img != null) {
  try {
    final storageref = FirebaseStorage.instance
        .ref()
        .child('bakes_images')
        .child('${img.name}.jpg');

    await storageref.putFile(File(img.path));
    final imageUrl = await storageref.getDownloadURL();

    data['image'] = imageUrl;
    print('Image URL: $imageUrl');
  } catch (e) {
    print('Error uploading image: $e');
  }
}

   
firestore.collection('baker').add(data);



    print('success');
    // print(bakerdata.length);
  } catch (e) {
    print(e);
  }
}

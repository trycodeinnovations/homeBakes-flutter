import 'package:cloud_firestore/cloud_firestore.dart';


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to get bakers
  Future<List<Map<String, dynamic>>> getBakers() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('bakers').get();
      List<Map<String, dynamic>> bakers = [];

      for (var doc in snapshot.docs) {
        bakers.add({
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>, // Add all fields from the document
        });
      }
      return bakers;
    } catch (e) {
      print("Error getting bakers: $e");
      return [];
    }
  }


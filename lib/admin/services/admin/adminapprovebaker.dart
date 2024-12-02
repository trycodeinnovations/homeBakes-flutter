import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> bakerapprovefun(Map<String, dynamic> data, String bakerId) async {
  try {
    await FirebaseFirestore.instance
        .collection('bakers')
        .doc(bakerId)
        .update(data);
    print("Baker approved successfully");
  } catch (e) {
    print("Error approving baker: $e");
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> bakerrejectfun(Map<String, dynamic> data, String bakerId) async {
  try {
    await FirebaseFirestore.instance
        .collection('bakers')
        .doc(bakerId)
        .update(data);
    print("Baker rejected successfully");
  } catch (e) {
    print("Error rejecting baker: $e");
  }
}
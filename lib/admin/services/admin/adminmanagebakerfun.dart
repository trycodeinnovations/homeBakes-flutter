import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/customers/reviews%20model.dart';
class FirestoreService{
Future<void> fetchBakers() async {
  try {
   // Fetch all documents from the collection
QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('bakers').get();

// Iterate through each document
for (var doc in querySnapshot.docs) {
  Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?; // Get the document data

  if (data != null && data.containsKey('isApproved')) {
    bool isApproved = data['isApproved'] ?? false; // Use a default value if null
    
    // Now use the isApproved value as needed
    print('Baker isApproved: $isApproved');
  } else {
    // Handle documents without the isApproved field or null data
    print('Baker does not have isApproved field or data is null.');
  }

    }
  } catch (e) {
    print('Error fetching bakers: $e');
  }
}

  addCustomerReview(CustomerReview review) {
    
  }
}
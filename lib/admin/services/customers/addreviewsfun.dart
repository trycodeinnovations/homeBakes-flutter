import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/customers/reviews%20model.dart';

Future<void> addcustomerreview(CustomerReview review, ) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('review').add({
      
      // 'id': review.id,
      // 'bakerName': review.bakerName,
      'reviewText': review.reviewText,
      'rating': review.rating,
      'timestamp': review.timestamp, // Add customer ID here
    });
    print("Item successfully added to cart");
  } catch (e) {
    print("Error adding item to cart in Firebase: $e");
  }
}



// List<CustomerReview>review=[];
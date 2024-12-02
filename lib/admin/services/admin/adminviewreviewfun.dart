import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebakes/admin/services/customers/reviews model.dart';

Future<List<CustomerReview>> adminGetReviews() async {
  List<CustomerReview> reviews = [];
  try {
    var querySnapshot = await FirebaseFirestore.instance.collection("review").get();

    reviews = querySnapshot.docs.map((doc) {
      return CustomerReview(
        //  id: doc.id,
        // bakerName: doc['bakerName'] ?? '',
        reviewText: doc['reviewText'] ?? '',
        rating: (doc['rating'] ?? 0).toDouble(),
        timestamp: (doc['timestamp'] as Timestamp).toDate(),// Ensure timestamp is fetched as Timestamp
      );
    }).toList();

    print("Number of reviews fetched: ${reviews.length}");
  } catch (e) {
    print("Error fetching reviews: $e");
  }
  return reviews;
}

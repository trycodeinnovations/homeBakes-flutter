
class CustomerReview {
  final String id; // You can use this to uniquely identify the review
  final String bakerName;
  final String reviewText;
  final double rating;
  // final Timestamp timestamp; // Assuming you are using Firestore timestamp

  CustomerReview({
    required this.id,
    required this.bakerName,
    required this.reviewText,
    required this.rating,
    // required this.timestamp,
  });
}

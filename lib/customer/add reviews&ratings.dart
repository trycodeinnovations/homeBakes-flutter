import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homebakes/admin/services/customers/addreviewsfun.dart';
import 'package:homebakes/admin/services/customers/reviews%20model.dart';

class AddReviewScreen extends StatelessWidget {
  final TextEditingController _bakerNameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;
  final _formKey = GlobalKey<FormState>();

  AddReviewScreen({super.key});

  void onSubmitReview(BuildContext context, String reviewText, double rating) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Review submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Review"),
        backgroundColor: Colors.red.shade300, // Consistent with the main app theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _reviewController,
                decoration: InputDecoration(
                  labelText: "Review",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a review';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text("Rating (1-5 Stars)", style: TextStyle(fontSize: 16)),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String reviewText = _reviewController.text;
                    DateTime timestamp = DateTime.now();

                    // Submit the review
                    await addcustomerreview(CustomerReview(
                      reviewText: reviewText,
                      rating: _rating,
                      timestamp: timestamp,
                    ));

                    onSubmitReview(context, reviewText, _rating);

                    _reviewController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Submit Review"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

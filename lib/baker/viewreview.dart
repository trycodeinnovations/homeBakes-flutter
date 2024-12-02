import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:homebakes/admin/services/admin/adminviewreviewfun.dart';
import 'package:homebakes/admin/services/customers/reviews%20model.dart';

class BakerReviewView extends StatelessWidget {
  const BakerReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Reviews",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300,  // Match homepage AppBar color
        elevation: 0,  // Same elevation as in Bakerhomepage
      ),
      body: Container(
        color: Colors.red.shade50,  // Set background color to a lighter red
        child: FutureBuilder<List<CustomerReview>>(
          future: adminGetReviews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No reviews available."));
            }

            final reviews = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];

                // Safeguard for rating value to avoid range errors
                final rating = (review.rating >= 0 && review.rating <= 5)
                    ? review.rating
                    : 0; // Default to 0 if out of range

                return Card(
                  color: Colors.red.shade100,  // Match Card color to homepage style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review.reviewText),
                        Text("Rating: $rating"), // Displaying the checked rating
                        Text("Posted on: ${formatter.format(review.timestamp.toLocal())}"), // Displaying formatted date
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

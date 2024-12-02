import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/admin/adminviewreviewfun.dart';
import 'package:homebakes/admin/services/customers/reviews%20model.dart';

class AdminReviewView extends StatelessWidget {
  const AdminReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Reviews",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,  // Match the font size from the homepage model
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade300, // Set AppBar color to match the theme
        elevation: 0,  // Removed elevation for a clean look
        automaticallyImplyLeading: false, // Remove the back navigation icon
      ),
      body: FutureBuilder<List<CustomerReview>>(
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
              return Card(
                color: Colors.red.shade100, // Same card color for consistency
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  // title: Text(
                  //   review.bakerName,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.red.shade600, // Set text color to match theme
                  //   ),
                  // ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.reviewText,
                        style: TextStyle(color: Colors.red.shade600), // Review text color
                      ),
                      Text(
                        "Rating: ${review.rating}",
                        style: TextStyle(color: Colors.red.shade600), // Rating text color
                      ),
                      Text(
                        "Posted on: ${review.timestamp.toLocal()}",
                        style: TextStyle(color: Colors.red.shade600), // Timestamp text color
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:homebakes/admin/services/admin/adminapprovebaker.dart';

// class AdminacceptViewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Baker Registrations"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('bakers').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           final bakers = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: bakers.length,
//             itemBuilder: (context, index) {
//               final baker = bakers[index];
//               return ListTile(
//                 title: Text(baker['name']),
//                 subtitle: Text(baker['email']),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.check, color: Colors.green),
//                       onPressed: () async {
//                         await approveBaker(baker.id, true);
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Baker approved!")));
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.close, color: Colors.red),
//                       onPressed: () async {
//                         await approveBaker(baker.id, false);
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Baker rejected!")));
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

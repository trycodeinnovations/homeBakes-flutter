// import 'package:flutter/material.dart';
// import 'package:homebakes/admin/services/customers/customerupdatefun.dart';

// class CustomerUpdateScreen extends StatelessWidget {
//   final  String name;
//   final String place;
//   final String post;
//   final String district;
//    final id;

//    CustomerUpdateScreen({
//      Key? key,
//     required this.name,
//     required this.place,
//     required this.post,
//     required this.district,
//      this.id,
//   });
//  TextEditingController nameController = TextEditingController();
//     TextEditingController placeController = TextEditingController();
//     TextEditingController postController = TextEditingController();
//     TextEditingController districtController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
   
//    nameController.text=name;
//     placeController.text=place;
//     postController.text=post;
// districtController.text=district;
//     return Scaffold(
//       appBar: AppBar(title: Text("Update Customer")),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: "Name"),
//             ),
//             TextField(
//               controller: placeController,
//               decoration: InputDecoration(labelText: "Place"),
//             ),
//             TextField(
//               controller: postController,
//               decoration: InputDecoration(labelText: "Post"),
//             ),
//             TextField(
//               controller: districtController,
//               decoration: InputDecoration(labelText: "District"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async{
//                 print('start');
//                     Map<String, dynamic>   data = {
                      
//                     'name':nameController.text,
//                'place':placeController.text,
//                'post':postController.text,
//                 'district':districtController
//                     };
                
                  
                    
                  
                
//                   await customerupdate (
//                       data,context,id
//                     );
                    
//                 },
//                 child: Text("update"),
        
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

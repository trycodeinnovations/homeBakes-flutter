// import 'package:flutter/material.dart';
// import 'package:homebakes/admin/services/bakerdeletefun.dart';
// import 'package:homebakes/admin/services/bakergetfun.dart';
// import 'package:homebakes/admin/services/bakermodel.dart';
// import 'package:homebakes/admin/services/bakerupdatefun.dart';
// import 'package:homebakes/baker/bakerupdatenew.dart';

// class Customerviewcake extends StatelessWidget {
  
//   Customerviewcake({
//     super.key,
//   });
//   // final baker=Bakerdata;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("menu"),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 2,
//             childAspectRatio: .4),
//         itemCount: Bakerdata.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Container(
//                     height: 50,
//                     color: Colors.amber,
//                     child: Image.network(Bakerdata[index].images),
//                   ),
//                 ),
//                 Text(Bakerdata[index].cakename),
//                 Text(Bakerdata[index].flavour),
//                 Text(Bakerdata[index].price),
//                 Column(
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => updateScreen(
//                                   cakename: Bakerdata[index].cakename,
//                                   flavour: Bakerdata[index].flavour,
//                                   price: Bakerdata[index].price,
//                                   id: Bakerdata[index].id),
//                             ));
//                       },
//                       icon: Icon(Icons.edit),
//                     ),
//                     SizedBox(
//                       width: 150,
//                     ),
//                     IconButton(
//                       onPressed: () async {
//                         await deletebaker(Bakerdata[index].id);
//                         // print("asdf");
//                         await Bakerget();
                        

//                         //
//                         Navigator.pushNamed(context, "customerhomepage");
//                       },
//                       icon: Icon(Icons.delete),
//                     )
//                   ],
//                 ),
//                 // Text(Bakerdata[index].cakename),
//                 // Text(Bakerdata[index].flavour),
//                 // Text(Bakerdata[index].price),
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, "cakeprice");
//                     },
//                     child: Text("ORDER"))
//               ],
//             ),
//             height: 100,
//             color: Colors.black12,
//           );
//         },
//       ),
//     );
//   }
// }

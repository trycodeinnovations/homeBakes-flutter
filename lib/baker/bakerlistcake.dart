
// import 'package:flutter/material.dart';
// import 'package:homebakes/admin/services/Bakers/Bakercakegetfun.dart';
// import 'package:homebakes/admin/services/bakergetfun.dart';
// import 'package:homebakes/admin/services/bakermodel.dart';
// import 'package:homebakes/baker/cakedetailsview.dart';

// class Listcakepage1 extends StatelessWidget {
//   // final Baker=Bakerdata;
//   Listcakepage1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text("cake list"),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: Bakerdata.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               tileColor: Colors.black26,
//               // trailing:
//               // //
//               // ,
//               // title: Text(Bakerdata[index].cakename),
//               // subtitle: Text(Bakerdata[index].flavour),
//               trailing: Column(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               Cakeviewdetails()
//                         ));
//                       },
//                       icon: Icon(Icons.arrow_forward)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

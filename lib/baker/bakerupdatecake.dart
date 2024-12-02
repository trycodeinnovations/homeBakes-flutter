// import 'package:flutter/material.dart';
// import 'package:homebakes/admin/services/addbakerfun.dart';
// import 'package:homebakes/admin/services/bakerdeletefun.dart';
// import 'package:homebakes/admin/services/bakergetfun.dart';
// import 'package:homebakes/admin/services/bakermodel.dart';
// import 'package:homebakes/admin/services/bakerupdatefun.dart';
// import 'package:image_picker/image_picker.dart';

// class Addcakescreen extends StatefulWidget {
//   Addcakescreen({super.key, required this.Bakerdata});

//   final Baker Bakerdata;
//   @override
//   State<Addcakescreen> createState() => _AddcakescreenState();
// }

// class _AddcakescreenState extends State<Addcakescreen> {
//   TextEditingController cakename = TextEditingController();

//   TextEditingController price = TextEditingController();

//   TextEditingController flavour = TextEditingController();

//   final ValueNotifier<XFile?> pickedimage = ValueNotifier<XFile?>(null);
//   ImagePicker picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     cakename.text = widget.Bakerdata.cakename;
//     flavour.text = widget.Bakerdata.flavour;
//     price.text = widget.Bakerdata.price;
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Update cakes",
//             style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           // image: DecorationImage(image: NetworkImage("https://st3.depositphotos.com/1177973/13045/i/450/depositphotos_130456946-stock-photo-tasty-chocolate-cake.jpg"))
//         ),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: cakename,
//               decoration: InputDecoration(
//                   label: Text("Cake name"),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: flavour,
//               decoration: InputDecoration(
//                   label: Text("Flavour"),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: price,
//               decoration: InputDecoration(
//                   label: Text("Price"),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton.icon(
//               onPressed: () async {
//                 pickedimage.value =
//                     await picker.pickImage(source: ImageSource.gallery);
//                 // Implement image picker logic here
//               },
//               icon: Icon(Icons.upload),
//               label: Text('Cake Image'),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   Map<String, dynamic> data = {
//                     'cakename': cakename.text,
//                     'price': price.text,
//                     'flavour': flavour.text
//                   };
//                   await bakerupdate(data, widget.Bakerdata.id, pickedimage);
//                   await Bakerget();
//                await   Navigator.pushNamed(context, "bakerhomepage");
//                 },
//                 child: Text("Edit"))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/bakerupdatefun.dart';
import 'package:image_picker/image_picker.dart';

class updateScreen extends StatelessWidget {
  
  final cakename;
  final flavour;
  final price;
  
  final id;

  updateScreen({
    super.key,
    required this.cakename,
    required this.flavour,
    required this.price,
    this.id, 
  });

  // final ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  TextEditingController cakenameController=TextEditingController();
    TextEditingController flavourController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  
  


  

  @override

//
  Widget build(BuildContext context) {
    cakenameController.text=cakename;
    flavourController.text=flavour;
    priceController.text=price;
    return Scaffold(appBar: AppBar(),
      body: Container(
        // decoration: BoxDecoration(
        //     // image: DecorationImage(
        //     //     image: NetworkImage(""),
        //     //     fit: BoxFit.fill)),
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  image = await picker.pickImage(source: ImageSource.gallery);
                },
                 icon: const Icon(Icons.upload),
              label: const Text('Cake Image'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: cakenameController,
              decoration: InputDecoration(
                  label: const Text("cakename"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: flavourController,
              decoration: InputDecoration(
                  label: const Text("flavour"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                  label: const Text("Price"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
          

            ElevatedButton(
                onPressed: () async {
                  print('start');
                    Map<String, dynamic>   data = {
                      
                    'cakename':cakenameController.text,
               'price':priceController.text,
               'flavour':flavourController.text
                    };
                  if (image != null) {
                    print('notnull');
                    try {
                        final storageref = FirebaseStorage.instance
                        .ref()
                        .child('bakes_images')
                        .child('${image!.name}.jpg');
                    await storageref.putFile(File(image!.path));
                    final imageUrl = await storageref.getDownloadURL();
                  data['image']= imageUrl;
                    } catch (e) {
                      print(e);
                    }
                  
                    
                  }
                
                  await bakerupdate (
                      data,id,context
                    );
                    
                },
                child: const Text("update")),
            
          ],
        ),
      ),
    );
  }
}
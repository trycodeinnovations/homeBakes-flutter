import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/Bakers/Bakercakegetfun.dart';
import 'package:homebakes/admin/services/addbakerfun.dart';
import 'package:homebakes/admin/services/loginfun.dart';
import 'package:image_picker/image_picker.dart';

class Addcakescreen extends StatelessWidget {
  Addcakescreen({super.key});
  TextEditingController cakename = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController flavour = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? pickimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: const Text(
          "Add New Cake",  // Updated heading
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 3.0,
                color: Colors.black45,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.red.shade300,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: const AssetImage('assets/cake vanila.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.9),
              BlendMode.dstATop,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Cake name field
            TextFormField(
              controller: cakename,
              style: TextStyle(color: Colors.red.shade300),
              decoration: InputDecoration(
                labelText: "Cake Name",
                labelStyle: TextStyle(color: Colors.red.shade300),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Flavour field
            TextFormField(
              controller: flavour,
              style: TextStyle(color: Colors.red.shade300),
              decoration: InputDecoration(
                labelText: "Flavour",
                labelStyle: TextStyle(color: Colors.red.shade300),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Price field
            TextFormField(
              controller: price,
              style: TextStyle(color: Colors.red.shade300),
              decoration: InputDecoration(
                labelText: "Price",
                labelStyle: TextStyle(color: Colors.red.shade300),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Upload Cake Image Button
            ElevatedButton.icon(
              onPressed: () async {
                pickimage = await picker.pickImage(source: ImageSource.gallery);
              },
              icon: const Icon(Icons.upload, color: Colors.white),
              label: const Text('Add Cake Image', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
            const SizedBox(height: 16),
            // Submit Button
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> data = {
                  'cakename': cakename.text,
                  'price': price.text,
                  'flavour': flavour.text,
                  'bakerid': bakerid,
                };
                await addbakesfun(data, pickimage);
                await getbakercakefunction();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

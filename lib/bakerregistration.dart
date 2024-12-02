import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/bakerregisterfun.dart';

class BakesRegistration extends StatelessWidget {
  BakesRegistration({super.key});

  // TextEditingController for various input fields
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool obscureText = true;  // For password visibility toggle
  final formkey = GlobalKey<FormState>();  // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Registration",
          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
        )),
        backgroundColor: Colors.red.shade300,  // Match the app bar color
      ),
      body: Container(
        // Set the image as a full-screen background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cakebr.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Name Input Field
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Place Input Field
                  TextFormField(
                    controller: place,
                    decoration: InputDecoration(
                      labelText: "Place",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your place";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // District Input Field
                  TextFormField(
                    controller: district,
                    decoration: InputDecoration(
                      labelText: "District",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your district";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Post Input Field
                  TextFormField(
                    controller: post,
                    decoration: InputDecoration(
                      labelText: "Post",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your post";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Username Input Field
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a username";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Age Input Field
                  TextFormField(
                    controller: age,
                    decoration: InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your age";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Email Input Field
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Password Input Field
                  TextFormField(
                    controller: password,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.red.shade300,
                        ),
                        onPressed: () {
                          // Toggle obscureText here using setState
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  // Confirm Password Input Field
                  TextFormField(
                    controller: confirmpassword,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.red.shade300,
                        ),
                        onPressed: () {
                          // Toggle obscureText here using setState
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != password.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // If all fields are valid, submit registration data
                        Map<String, dynamic> data = {
                          'name': name.text,
                          'place': place.text,
                          'district': district.text,
                          'post': post.text,
                          'username': username.text,
                          'age': age.text,
                          'email': email.text,
                          'password': password.text,
                        };

                        // Call the registration function for baker
                        bakerregisterfun(email.text, password.text, data);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/loginfun.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emaillcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/log.jpeg'), // Replace with your asset image
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  "HEY WELCOME!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.red.shade600, // Red color for the title
                  ),
                ),
                const SizedBox(height: 30),
                // Email TextFormField with styling
                TextFormField(
                  controller: emaillcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.red.shade400), // Red hint color
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red.shade600),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red.shade300),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Password TextFormField with eye icon
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: !_isPasswordVisible, // Toggle password visibility
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.red.shade400), // Red hint color
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red.shade600),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red.shade300),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.red.shade600,
                      ),
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                      },
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // You can add the Forget Password button here if needed
                  ],
                ),
                const SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    login(emaillcontroller.text, passwordcontroller.text, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300, // Button color (Red)
                    foregroundColor: Colors.white, // Text color for the button
                  ),
                  child: const Text("LOGIN"),
                ),
                const SizedBox(height: 10),
                // Text to prompt for registration
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.red.shade600, // Red color for the text
                  ),
                ),
                // Button to navigate to Bakes Registration
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "bakesregistration");
                  },
                  child: Text(
                    "Bakes Registration",
                    style: TextStyle(color: Colors.red.shade600), // Red color for the button
                  ),
                ),
                // Button to navigate to Customer Registration
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "customerregistration");
                  },
                  child: Text(
                    "Customer Registration",
                    style: TextStyle(color: Colors.red.shade600), // Red color for the button
                  ),
                ),
                const SizedBox(width: 180),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

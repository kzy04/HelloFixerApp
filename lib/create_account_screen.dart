import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  String? selectedRole;

  Future<void> createUserWithEmailAndPassword() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = fullNameController.text.trim();
    String address = addressController.text.trim();
    String phone = phoneController.text.trim();
    String nid = nidController.text.trim();

    if (selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a role!")),
      );
      return;
    }

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required!")),
      );
      return;
    }

    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = FirebaseAuth.instance.currentUser!.uid;

      if (selectedRole == "Consumer") {
        if (name.isEmpty || address.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                "Full Name and Address are required for Consumer accounts!")),
          );
          return;
        }

        final user = await FirebaseFirestore.instance.collection('users').add({
          "Email": email,
          "UserId": uid,
          "Role": selectedRole,
          "Name": name,
          "Number": phone,
          "Address": address,
        });
      }
      if (selectedRole == "Provider") {
        if (name.isEmpty || address.isEmpty || nid.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                "Full Name, Address, and NID are required for Provider accounts!")),
          );
          return;
        }

        final user = await FirebaseFirestore.instance.collection('users').add({
          "Email": email,
          "UserId": uid,
          "Role": selectedRole,
          "Name": name,
          "Number": phone,
          "Address": address,
          "NID": nid,
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account created successfully!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "An error occurred!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Create Your Account", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              DropdownButtonFormField<String>(
                value: selectedRole,
                hint: Text("Select Role"),
                items: ["Consumer", "Provider"].map((role) {
                  return DropdownMenuItem(value: role, child: Text(role));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                ),
              ),
              SizedBox(height: 16),
              if (selectedRole == "Consumer") ...[
                TextField(controller: fullNameController, decoration: InputDecoration(labelText: "Full Name")),
                SizedBox(height: 16),
                TextField(controller: addressController, decoration: InputDecoration(labelText: "Home Address")),

              ] else if (selectedRole == "Provider") ...[
                TextField(controller: fullNameController, decoration: InputDecoration(labelText: "Full Name")),
                SizedBox(height: 16),
                TextField(controller: addressController, decoration: InputDecoration(labelText: "Home Address")),
                SizedBox(height: 16),
                TextField(controller: nidController, decoration: InputDecoration(labelText: "NID Number")),
              ],
              SizedBox(height: 16),
              TextField(controller: emailController, decoration: InputDecoration(labelText: "Email Address")),
              SizedBox(height: 16),
              TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone Number")),
              SizedBox(height: 16),
              TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: createUserWithEmailAndPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("Create Account", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

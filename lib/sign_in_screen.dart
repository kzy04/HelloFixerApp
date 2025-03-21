import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellofixerapp/home_screen.dart';
import 'create_account_screen.dart';
import 'forgot_password_screen.dart';
import 'provider/provider_homepage.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUserWithEmailAndPassword(BuildContext context) async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signed in successfully!")),
      );

      if (userCredential.user != null) {

        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .where("UserId", isEqualTo: userCredential.user!.uid)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          String role = userSnapshot.docs.first["Role"];


          if (role == "Provider") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NewsFeedScreen()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        }
      }
    } on FirebaseAuthException catch(e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "An error occurred!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  await loginUserWithEmailAndPassword(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Sign In", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

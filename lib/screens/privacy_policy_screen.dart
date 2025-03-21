import 'package:flutter/material.dart';
class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Privacy Policy")),
      body: Center(child: Text("Privacy Policy Screen")),
    );
  }
}
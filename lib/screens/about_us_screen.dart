import 'package:flutter/material.dart';
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("About Us")),
      body: Center(child: Text("About Us Screen")),
    );
  }
}
import 'package:flutter/material.dart';
class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("FAQs")),
      body: Center(child: Text("FAQ Screen")),
    );
  }
}
import 'package:flutter/material.dart';
class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Help & Support")),
      body: Center(child: Text("Help & Support Screen")),
    );
  }
}
import 'package:flutter/material.dart';
class ServiceAreaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Service Area")),
      body: Center(child: Text("Service Area Screen")),
    );
  }
}
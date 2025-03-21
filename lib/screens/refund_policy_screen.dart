import 'package:flutter/material.dart';
class RefundPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Refund Policy")),
      body: Center(child: Text("Refund Policy Screen")),
    );
  }
}
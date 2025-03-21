import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Terms & Conditions"),
      ),
      body: Center(child: Text("Terms & Conditions Screen")),
    );
  }
}

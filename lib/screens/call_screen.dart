import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Salim Rahaman Dipu", "phone": "01738794482"},
    {"name": "Kazi Junaid", "phone": "01327667045"},
    {"name": "Tanha Ahmned Nijhum", "phone": "01600446955"},
  ];

  void _makeCall(String phoneNumber) async {
    final Uri url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Support"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Tap a number to call",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.green, size: 30),
                      title: Text(contact["name"]!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(contact["phone"]!),
                      trailing: Icon(Icons.call, color: Colors.blue),
                      onTap: () => _makeCall(contact["phone"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
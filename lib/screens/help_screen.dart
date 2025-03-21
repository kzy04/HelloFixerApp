import 'package:flutter/material.dart';
import '../home_screen.dart'; // Ensure correct path
import '../screens/chatlive_screen.dart'; // New chat screen for live chat
import '../screens/call_screen.dart'; // New screen for calling support
import '../screens/service_request_screen.dart'; // New screen for service request

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/helpcenter.png',
                    height: 150,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Tell us how we can help you?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We are here 24/7 only to serve you. Please call us at 16516 or chat with us for any kind of query.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildHelpOption(
              context,
              icon: Icons.chat,
              title: "Let's Chat",
              subtitle: "Start conversation now!",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatLiveScreen()),
                );
              },
            ),
            _buildHelpOption(
              context,
              icon: Icons.call,
              title: "Let's Call",
              subtitle: "Talk with an expert!",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallScreen()),
                );
              },
            ),
            _buildHelpOption(
              context,
              icon: Icons.support_agent,
              title: "Service Request",
              subtitle: "Send us your desired service!",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServiceRequestScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpOption(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.pink, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

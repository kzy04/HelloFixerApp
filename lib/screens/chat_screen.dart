import 'package:flutter/material.dart';
import '../home_screen.dart'; // Ensure correct path

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()), // Go to HomeScreen on back press
            );
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.pink,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "Campaigns"),
            Tab(text: "Notifications"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEmptyState(
              imagePath: "assets/campaigns.png",
              title: "Look out for exciting campaigns here!",
              subtitle: "Currently there are no available campaigns for you."
          ),
          _buildEmptyState(
              imagePath: "assets/notification.png",
              title: "Are you waiting for something to happen?",
              subtitle: "We will notify you when something exciting and new happens!"
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState({required String imagePath, required String title, required String subtitle}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 200),
            SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

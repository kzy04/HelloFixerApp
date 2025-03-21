import 'package:flutter/material.dart';

class ChatLiveScreen extends StatefulWidget {
  @override
  _ChatLiveScreenState createState() => _ChatLiveScreenState();
}

class _ChatLiveScreenState extends State<ChatLiveScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Chat"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/livechat.png', // Ensure you have an appropriate image asset
                    height: 150,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Start a conversation now!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  ),
                ],
              ),
            )
                : ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _messages[_messages.length - 1 - index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.pink),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

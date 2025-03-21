import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyPostsScreen extends StatefulWidget {
  @override
  _MyPostsScreenState createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Map<String, bool> minimizedStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("My Posts"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .where('userId', isEqualTo: uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No posts available"));
          }

          var posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[index].data() as Map<String, dynamic>;
              String postId = posts[index].id;
              bool isMinimized = minimizedStates[postId] ?? false;

              String title = post["title"] ?? "No Title";
              String description = post["description"] ?? "No Description";
              String status = post["status"] ?? "Pending";
              // Extract first image URL from Firestore array
              String? imageUrl;
              if (post["imageUrls"] is List && (post["imageUrls"] as List).isNotEmpty) {
                imageUrl = post["imageUrls"][0]; // Get first image
              }

              // String imageUrl =
              // "https://firebasestorage.googleapis.com/v0/b/hellofixer-5d4d6.firebasestorage.app/o/post_images%2FmwAOKij3l7of7sXcrl7U-0.jpg?alt=media&token=edb23f60-a0c5-4778-ba11-47171007f12a";

              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, spreadRadius: 1),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: Icon(isMinimized ? Icons.expand_more : Icons
                              .expand_less),
                          onPressed: () {
                            setState(() {
                              minimizedStates[postId] = !isMinimized;
                            });
                          },
                        ),
                      ],
                    ),
                    if (!isMinimized) ...[
                      const SizedBox(height: 5),
                      Text(description, style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 5),
                      _loadImage(imageUrl), // Load image from Firebase Storage
                      const SizedBox(height: 5),
                      _statusProgress(status),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }


  /// Widget to load image dynamically using FutureBuilder
  Widget _loadImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return _placeholderImage(); // Show placeholder if no image
    }

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: imageUrl.isNotEmpty
            ? DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            print("Image load error: $exception");
            print("Stack trace: $stackTrace");
          },
        )
            : null,
        color: imageUrl == null || imageUrl.isEmpty ? Colors.grey[300] : null,
      ),
      child: imageUrl == null || imageUrl.isEmpty
          ? _placeholderImage2()
          : null,
    );
  }


  Widget _placeholderImage() {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.grey[300],
      child: const Icon(Icons.broken_image, size: 50),
    );
  }

  Widget _placeholderImage2() {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.grey[300],
      child: const Icon(Icons.image_not_supported, size: 50),
    );
  }



  /// Widget to display task progress dynamically
  Widget _statusProgress(String status) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centered buttons
          children: [
            _statusButton("Pending", status == "Pending", Colors.orange, 14.0),
            _arrowIndicator(),
            _statusButton("In Progress", status == "In Progress", Colors.blue, 14.0),
            _arrowIndicator(),
            _statusButton("Completed", status == "Completed", Colors.green, 14.0),
            _arrowIndicator(),
            _statusButton("Cancelled", status == "Cancelled", Colors.red, 14.0),
          ],
        ),
      ),
    );
  }

  /// Creates a centered status button with a slightly bigger size
  Widget _statusButton(String label, bool isActive, Color color, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4), // Added spacing
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? color : Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Increased padding
          minimumSize: const Size(90, 35), // Slightly bigger size
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold), // Bolder text
        ),
      ),
    );
  }

  /// Creates a smaller arrow indicator
  Widget _arrowIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4), // Added spacing for clarity
      child: Icon(Icons.arrow_forward, size: 18, color: Colors.grey), // Slightly bigger icon
    );
  }

}
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'user': {'name': 'Salim Rahaman Dipu', 'image': 'assets/Salim.jpg'},
      'service': {'title': 'AC Repair Service', 'category': 'Air Conditioner'},
      'description': 'Professional AC repair service with 5 years experience. Specialized in all major brands.',
      'images': ['assets/icons/air-conditioner.png', 'assets/air-conditioner.JPG'],
      'bids': [
        {'name': 'Rahim Khan', 'image': 'assets/junaid.jpg', 'amount': 1250.00},
        {'name': 'Arif Hossain', 'image': 'assets/ayan.JPG', 'amount': 1300.00},
        {'name': 'Sadia Rahman', 'image': 'assets/tanha.jpg', 'amount': 1280.00},
      ],
      'newBid': '',
      'isMinimized': false,
    },
    {
      'user': {'name': 'Kazi Junaid', 'image': 'assets/junaid.jpg'},
      'service': {'title': 'Home Cleaning', 'category': 'Cleaning'},
      'description': 'Complete home cleaning service including kitchen, bathroom, and living areas.',
      'images': ['assets/maidservice.JPG', 'assets/repairingwoodenitems.png'],
      'bids': [
        {'name': 'Farzana Karim', 'image': 'assets/tanha.jpg', 'amount': 820.00},
        {'name': 'Riyad Hasan', 'image': 'assets/ayan.JPG', 'amount': 850.00},
        {'name': 'Mahin Ahmed', 'image': 'assets/Salim.jpg', 'amount': 810.00},
      ],
      'newBid': '',
      'isMinimized': false,
    },
    {
      'user': {'name': 'Tanha Ahmed', 'image': 'assets/tanha.jpg'},
      'service': {'title': 'Plumbing Service', 'category': 'Plumbing'},
      'description': '24/7 emergency plumbing services. Fix leaks, pipe installation, and drainage problems.',
      'images': ['assets/Plumber Repairs & Installation.png', 'assets/icons/carpenter.png'],
      'bids': [
        {'name': 'Sajid Islam', 'image': 'assets/Salim.jpg', 'amount': 1520.00},
        {'name': 'Nabila Khan', 'image': 'assets/ayan.JPG', 'amount': 1550.00},
        {'name': 'Mehedi Hasan', 'image': 'assets/Salim.jpg', 'amount': 1530.00},
      ],
      'newBid': '',
      'isMinimized': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: const Text("Technician News Feed"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add notification action
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add settings action
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostContainer(posts[index], index);
        },
      ),
    );
  }

  Widget _buildPostContainer(Map<String, dynamic> post, int index) {
    TextEditingController bidController = TextEditingController();

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceHeader(post['service']),
                    IconButton(
                      icon: Icon(post['isMinimized'] ? Icons.expand_more : Icons.expand_less),
                      onPressed: () {
                        setState(() {
                          post['isMinimized'] = !post['isMinimized'];
                        });
                      },
                    ),
                  ],
                ),
                if (!post['isMinimized']) ...[
                  const SizedBox(height: 12),
                  _buildDescription(post['description']),
                  const SizedBox(height: 12),
                  _buildUserProfile(post['user']),
                  const SizedBox(height: 12),
                  _buildImageGrid(post['images']),
                  const SizedBox(height: 16),
                  _buildBidSection(post, index, bidController, setState),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserProfile(Map<String, dynamic> user) {
    return Row(
      children: [
        CircleAvatar(radius: 25, backgroundImage: AssetImage(user['image'])),
        const SizedBox(width: 12),
        Text(user['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildServiceHeader(Map<String, dynamic> service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(service['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text('Category: ${service['category']}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Text(description, style: const TextStyle(fontSize: 14, height: 1.4));
  }

  Widget _buildImageGrid(List<String> images) {
    return images.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBidSection(Map<String, dynamic> post, int index, TextEditingController bidController, StateSetter setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Top Bids:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
        const SizedBox(height: 8),
        Column(
          children: post['bids'].map<Widget>((bid) {
            return ListTile(
              leading: CircleAvatar(radius: 20, backgroundImage: AssetImage(bid['image'])),
              title: Text(bid['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('BDT ${bid['amount'].toStringAsFixed(2)}', style: const TextStyle(color: Colors.blue)),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: bidController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Enter Your Bid",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            prefixIcon: const Icon(Icons.attach_money),
          ),
        ),
        const SizedBox(height: 8),
        Center(  // Centering the button
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,  // Standard color (blue)
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40), // Size adjustment
            ),
            onPressed: () {
              if (bidController.text.isNotEmpty) {
                double newBidAmount = double.parse(bidController.text);

                setState(() {
                  post['bids'].add({
                    'name': 'Me',  // Replace with actual user name
                    'image': 'assets/your_profile.jpg', // Replace with user's actual image
                    'amount': newBidAmount,
                  });
                  bidController.clear();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Bid placed successfully: BDT $newBidAmount")),
                );
              }
            },
            child: const Text(
              'Place Bid',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,  // Appropriate text size
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, title: const Text("Profile")),
      body: Center(child: const Text("Profile details go here")),
    );
  }
}

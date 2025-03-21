import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellofixerapp/sign_in_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/terms_conditions_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/refund_policy_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/service_area_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/my_posts_screen.dart';
import 'screens/refer_earn_screen.dart';
import 'screens/about_us_screen.dart';
import 'provider/provider_homepage.dart';

class AppDrawer extends StatelessWidget {

  Future<String> getUserName() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    if (uid.isEmpty) return "Guest";

    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection("users").where("UserId", isEqualTo: uid).get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first["Name"] ?? "Unknown User";
    } else {
      return "Unknown User";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.redAccent), // Changed to redAccent
            child: FutureBuilder<String>(
                future: getUserName(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error loading user");
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/Salim.jpg'),
                          radius: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          snapshot.data ?? "Unknown User",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ],
                    );
                  }
                }
            ),
          ),
          ..._buildDrawer(context), // FIX: Now using the correct method
        ],
      ),
    );
  }

  List<Widget> _buildDrawer(BuildContext context) {
    List<Map<String, dynamic>> drawerItems = [
      {"icon": Icons.person, "title": "Profile", "color": Colors.blue},
      {"icon": Icons.language, "title": "Language", "color": Colors.orange},
      {"icon": Icons.settings, "title": "Settings", "color": Colors.purple},
      {"icon": Icons.post_add, "title": "My Posts & Coupons", "color": Colors.red},
      {"icon": Icons.newspaper, "title": "News Feed", "color": Colors.red}, // Updated the title here
      {"icon": Icons.card_giftcard, "title": "Refer & Earn", "color": Colors.teal},
      {"icon": Icons.info, "title": "About Us", "color": Colors.indigo},
      {"icon": Icons.description, "title": "Terms & Conditions", "color": Colors.brown},
      {"icon": Icons.privacy_tip, "title": "Privacy Policy", "color": Colors.deepOrange},
      {"icon": Icons.monetization_on, "title": "Refund Policy", "color": Colors.amber},
      {"icon": Icons.help, "title": "Help & Support", "color": Colors.cyan},
      {"icon": Icons.map, "title": "Service Area", "color": Colors.pink},
      {"icon": Icons.question_answer, "title": "FAQs", "color": Colors.pink},
      {"icon": Icons.login, "title": "Sign Out", "color": Colors.red},
    ];

    return drawerItems.map((item) => _buildDrawerItem(item, context)).toList();
  }

  Widget _buildDrawerItem(Map<String, dynamic> item, BuildContext context) {
    return ListTile(
      leading: Icon(item['icon'], color: item['color']),
      title: Text(item['title']),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      // Arrow on the right
      onTap: () async {
        Navigator.pop(context); // Close the drawer first

        if (item['title'] == "Profile") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        } else if (item['title'] == "Settings") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        } else if (item['title'] == "My Posts & Coupons") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyPostsScreen()),
          );
        }
        else if (item['title'] == "News Feed") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsFeedScreen()),
          );
        }

        else if (item['title'] == "Refer & Earn") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReferEarnScreen()),
          );
        } else if (item['title'] == "About Us") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUsScreen()),
          );
        } else if (item['title'] == "Terms & Conditions") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TermsConditionsScreen()),
          );
        } else if (item['title'] == "Privacy Policy") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
          );
        } else if (item['title'] == "Refund Policy") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RefundPolicyScreen()),
          );
        } else if (item['title'] == "Help & Support") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpSupportScreen()),
          );
        } else if (item['title'] == "Service Area") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServiceAreaScreen()),
          );
        } else if (item['title'] == "FAQs") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQScreen()),
          );
        } else if (item['title'] == "Sign Out") {
          // Handle sign-out logic
          await FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()), // Replace with your sign-in screen widget
                (route) => false, // This removes all previous routes
          );
        }
      },
    );
  }
}

// Dummy screens for navigation
class ProfileScreen extends StatelessWidget {
  final String profileImage = 'assets/Salim.jpg';

  Future<Map<String, dynamic>> getUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    if (uid.isEmpty) return {};

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("UserId", isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent, // Changed to redAccent
        title: Text("Profile"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No user data found"));
          }

          Map<String, dynamic> userData = snapshot.data!;
          List<Map<String, String>> profileInfo = [
            {"label": "Full Name", "value": userData["Name"] ?? "Unknown"},
            {"label": "Email Address", "value": userData["Email"] ?? "Unknown"},
            {"label": "Address", "value": userData["Address"] ?? "Not Added"},
            {"label": "Phone Number", "value": userData["Number"] ?? "Not Added"},
          ];

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImage),
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: profileInfo.length,
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Text(
                            "${profileInfo[index]['label']}: ${profileInfo[index]['value']}",
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importing for phone call functionality
import 'drawer.dart';
import 'category_grid.dart';
import 'screens/accounts_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/help_screen.dart';
import 'screens/orders_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _textStyleAnimation;
  late Animation<Color?> _colorAnimation;

  late PageController _pageController;
  int _currentPage = 0;
  int _selectedIndex = 0;
  late Timer _timer;

  final List<String> _images = [
    'assets/images/image01.png',
    'assets/images/air-conditioner.JPG',
    'assets/images/category02.JPG',
    'assets/images/category-03.jpg',
  ];

  final List<Widget> _pages = [
    Container(color: Colors.green),
    AccountsScreen(),
    ChatScreen(),
    HelpScreen(),
    OrdersScreen(),
  ];

  // Contacts list
  final List<Map<String, String>> contacts = [
    {"name": "Salim Rahaman Dipu", "phone": "01738794482"},
    {"name": "Kazi Junaid", "phone": "01327667045"},
    {"name": "Tanha Ahmned Nijhum", "phone": "01600446955"},
  ];

  // To show contact details after "Call Now" is clicked
  bool _isContactVisible = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _textStyleAnimation = TextStyleTween(
      begin: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      end: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.yellow),
    ).animate(_controller);

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.orangeAccent,
    ).animate(_controller);

    _controller.forward();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (mounted) {  // Check if the widget is still mounted
        if (_currentPage < _images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _timer.cancel();  // Cancel the timer
    super.dispose();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/Salim.jpg'),
            ),
          ),
        ],
      ),
      body: _selectedIndex == 0 ? _buildHomeContent() : _pages[_selectedIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.7),
              Colors.purple.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _getSelectedColor(_selectedIndex),
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30, color: _getIconColor(0)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, size: 30, color: _getIconColor(1)),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.indeterminate_check_box, size: 30, color: _getIconColor(2)),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_center, size: 30, color: _getIconColor(3)),
              label: 'Help',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt, size: 30, color: _getIconColor(4)),
              label: 'Orders',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildGreetingSection(),
            SizedBox(height: 20),
            CategoryGrid(),
            SizedBox(height: 20),
            // Ramadan Special Section
            Text(
              "Ramadan Special",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Displaying the Ramadan Special images in a grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,  // 2 images per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            // Special Image and "Call Now" Button Section
            Stack(
              alignment: Alignment.center,
              children: [
                // Special Image at the bottom
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/callnow1.jpg',  // Replace with the path to your image
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,  // Adjust the height here
                  ),
                ),
                // "Call Now" Button
                Positioned(
                  bottom: 80,  // Move the button a bit higher by adjusting this value
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isContactVisible = !_isContactVisible;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Call Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                // Show contact details if visible
                // Inside the Stack's Positioned widget for contacts
                if (_isContactVisible)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(10),
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add close button row here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    _isContactVisible = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          // Existing contacts list (modified)
                          ...contacts.asMap().map((index, contact) {
                            Color contactColor = _getContactColor(index);
                            return MapEntry(
                              index,
                              ListTile(
                                title: Text(
                                  contact['name']!,
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  contact['phone']!,
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Removed trailing IconButton
                                tileColor: contactColor,
                                onTap: () async {
                                  final url = 'tel:${contact['phone']}';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not call ${contact['phone']}';
                                  }
                                },
                              ),
                            );
                          }).values.toList(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search services...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Text(
                      "Hi! Salim Rahaman Dipu",
                      style: _textStyleAnimation.value,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Text(
                      "What service do you need?",
                      style: TextStyle(
                        fontSize: 16,
                        color: _colorAnimation.value,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getSelectedColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];
    return colors[index];
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index ? _getSelectedColor(index) : Colors.grey[400]!;
  }

  Color _getContactColor(int index) {
    List<Color> contactColors = [
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
    ];
    return contactColors[index % contactColors.length];
  }
}

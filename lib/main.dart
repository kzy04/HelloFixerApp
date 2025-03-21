import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hellofixerapp/home_screen.dart';

import 'firebase_options.dart';
import 'create_account_screen.dart';
import 'home_screen.dart';
import 'sign_in_screen.dart';
import 'package:flutter/material.dart';
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



void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool isBlue = true;

  @override
  void initState() {
    super.initState();

    // Animation controller for fade effect
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward(); // Start fade-in animation

    // Cycle text color dynamically
    Future.delayed(Duration(seconds: 1), _toggleColor);
  }

  void _toggleColor() {
    setState(() {
      isBlue = !isBlue;
    });
    Future.delayed(Duration(seconds: 1), _toggleColor);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated Logo
              AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/logo01.png',
                  key: ValueKey<int>(isBlue ? 1 : 2),
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),

              // Animated Text with smooth color transition
              AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                child: Text(
                  "HelloFixer",
                  key: ValueKey<int>(isBlue ? 1 : 2),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: isBlue ? Colors.blue : Colors.red,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),

              // Sign In Text Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text(
                  "Already a member? Sign In",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Get your home appliances fixed quickly and efficiently",
      "description": "Success isn't always about greatness. It's about consistency. Consistent hard work gains success.",
      "image": "assets/images/image01.png"
    },
    {
      "title": "We provide the Best Services of superior technical support",
      "description": "We provide the best technical support while ensuring customer satisfaction.",
      "image": "assets/CCTV Camera Servicing.png"
    },
    {
      "title": "HelloFixer - Trusted by Customers",
      "description": "Our skilled technicians provide top-quality service at your doorstep.",
      "image": "assets/images/Outside Home Cleaning.png"
    }
  ];

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateAccountScreen()),
      );
    }
  }

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        onboardingData[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        onboardingData[index]["image"]!,
                        width: 250,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 15),
                      Text(
                        onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Dot indicators (Clickable)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
                  (dotIndex) => GestureDetector(
                onTap: () => _goToPage(dotIndex),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: _currentIndex == dotIndex ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == dotIndex ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                _currentIndex == onboardingData.length - 1 ? "Get Started" : "Continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}




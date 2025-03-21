import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'package:hellofixerapp/screens/category_detail.dart';
import 'package:hellofixerapp/screens/categories/air_conditioner.dart';
import 'package:hellofixerapp/screens/categories/television_led.dart';
import 'package:hellofixerapp/screens/categories/car_repairing.dart';
import 'package:hellofixerapp/screens/categories/cleaning.dart';
import 'package:hellofixerapp/screens/categories/plumbing.dart';
import 'package:hellofixerapp/screens/categories/electrician.dart';
import 'package:hellofixerapp/screens/categories/interior_design.dart';
import 'package:hellofixerapp/screens/categories/carpentry.dart';
import 'package:hellofixerapp/screens/categories/water_purifier.dart';
import 'package:hellofixerapp/screens/categories/driver_service.dart';
import 'package:hellofixerapp/screens/categories/maid_service.dart';
import 'package:hellofixerapp/screens/categories/shifting.dart';
import 'package:hellofixerapp/screens/categories/welding.dart';
import 'package:hellofixerapp/screens/categories/hot_deal.dart';
import 'package:hellofixerapp/screens/categories/cctv_service.dart';
import '../home_screen.dart'; // Ensure correct path

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
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
        title: const Text(
            "My Orders", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen()), // Navigate to HomeScreen
            );
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.pink,
          tabs: const [
            Tab(text: "Ongoing"),
            Tab(text: "History"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOngoingOrders(),
          _buildOrderHistory(),
        ],
      ),
    );
  }

  Widget _buildOngoingOrders() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/bookservice.png', height: 150),
          const SizedBox(height: 20),
          const Text("Let us help you!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Choose your Service and let us make your life easy.",
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ServicesListScreen(
                          categories: CategoryService.categories),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("View all Services"),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistory() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildOrderCard(
            "Special Cleaning Combo Package", "Cancelled", "Dec 4, 2024",
            "From HelloFixer"),
      ],
    );
  }

  Widget _buildOrderCard(String title, String status, String date,
      String provider) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Chip(
              label: Text(status, style: const TextStyle(color: Colors.white)),
              // Set the text color to white
              backgroundColor: Colors.red,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(date),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.business, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(provider),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

  class ServicesListScreen extends StatelessWidget {
  final List<Category> categories;

  const ServicesListScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Services")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _getCategoryPage(categories[index]),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                leading: Image.asset(categories[index].icon, width: 50, height: 50),
                title: Text(
                  categories[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getCategoryPage(Category category) {
    switch (category.title) {
      case "Air-Conditioner":
        return AirConditionerPage(category: category);
      case "Television & LED":
        return TelevisionLedPage(category: category);
      case "Car Repairing":
        return CarRepairingPage(category: category);
      case "Cleaning":
        return CleaningPage(category: category);
      case "Plumbing":
        return PlumbingPage(category: category);
      case "Electrician":
        return ElectricianPage(category: category);
      case "Interior Design":
        return InteriorDesignPage(category: category);
      case "Carpentry":
        return CarpentryPage(category: category);
      case "Water Purifier":
        return WaterPurifierPage(category: category);
      case "Driver Service":
        return DriverServicePage(category: category);
      case "Maid Service":
        return MaidServicePage(category: category);
      case "Shifting":
        return ShiftingPage(category: category);
      case "Welding":
        return WeldingPage(category: category);
      case "CCTV Service":
        return CCTVServicePage(category: category);
      case "Hot Deal":
        return HotDealPage(category: category);
      default:
        return CategoryDetailPage(category: category); // Fallback for undefined categories
    }
  }
}

class CategoryService {
  static List<Category> categories = [
    Category(title: "Air-Conditioner", icon: "assets/icons/air-conditioner.png"),
    Category(title: "Television & LED", icon: "assets/icons/tv.png"),
    Category(title: "Car Repairing", icon: "assets/icons/car.png"),
    Category(title: "Cleaning", icon: "assets/icons/cleaning.png"),
    Category(title: "Plumbing", icon: "assets/icons/plumber.png"),
    Category(title: "Electrician", icon: "assets/icons/electrician.png"),
    Category(title: "Interior Design", icon: "assets/icons/interior-design.png"),
    Category(title: "Carpentry", icon: "assets/icons/carpenter.png"),
    Category(title: "Water Purifier", icon: "assets/icons/water-filter.png"),
    Category(title: "Driver Service", icon: "assets/icons/driver.png"),
    Category(title: "Maid Service", icon: "assets/icons/cleaner.png"),
    Category(title: "Shifting", icon: "assets/icons/van.png"),
    Category(title: "Welding", icon: "assets/icons/welder.png"),
    Category(title: "CCTV Service", icon: "assets/icons/video.png"),
    Category(title: "Hot Deal", icon: "assets/icons/hot-deal.png"),
  ];
}


import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class DriverServicePage extends StatelessWidget {
  final Category category;

  const DriverServicePage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "On Demand Driver",
      icon: "assets/icons/driver.png",
      image: "assets/driver.JPG",
      description: "Get a driver whenever you need for your car or transportation.",
      features: ["Hourly Booking", "Airport Pickup", "City Travel"],
    ),
    SubCategory(
      title: "Driver for Weddings",
      icon: "assets/icons/driver.png",
      image: "assets/driver.JPG",
      description: "Specialized driver services for weddings and events.",
      features: ["Wedding Car Service", "Event Chauffeur", "VIP Travel"],
    ),
    SubCategory(
      title: "Driver for Tours",
      icon: "assets/icons/driver.png",
      image: "assets/driver.JPG",
      description: "Professional drivers for guided tours and trips.",
      features: ["Tourist Guidance", "Sightseeing Trips", "Custom Itinerary"],
    ),
    SubCategory(
      title: "Corporate Driver Services",
      icon: "assets/icons/driver.png",
      image: "assets/driver.JPG",
      description: "Dedicated drivers for corporate events and business needs.",
      features: ["Office Commute", "Client Pickup", "Business Trips"],
    ),
    SubCategory(
      title: "Night-Time Driver",
      icon: "assets/icons/driver.png",
      image: "assets/driver.JPG",
      description: "Driver services available for night-time travel.",
      features: ["Late-Night Pickup", "Safe Travel", "24/7 Availability"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: subCategories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final subCategory = subCategories[index];
          return _buildSubCategoryCard(context, subCategory);
        },
      ),
    );
  }

  Widget _buildSubCategoryCard(BuildContext context, SubCategory subCategory) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () => _navigateToDetail(context, subCategory),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Image.asset(subCategory.icon, width: 50, height: 50),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subCategory.title,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(subCategory.description,
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, SubCategory subCategory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubCategoryDetailPage(subCategory: subCategory),
      ),
    );
  }
}

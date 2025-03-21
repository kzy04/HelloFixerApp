import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';


class AirConditionerPage extends StatelessWidget {
  final Category category;

  const AirConditionerPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "AC Doctor",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Professional diagnosis and repair services for all AC issues.",
      features: ["Leakage Detection", "Filter Cleaning", "Thermostat Repair"
      ],
    ),
    SubCategory(
      title: "AC Servicing",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Complete maintenance packages.",
      features: [
        "General Cleaning",
        "Gas Pressure Check",
        "Cooling Optimization",
      ],
    ),
    SubCategory(
      title: "AC Combo Package",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Combo service packages for both AC servicing and installation.",
      features: [
        "Servicing + Installation",
        "Yearly Maintenance",
        "Discounted Rates",
      ],
    ),
    SubCategory(
      title: "AC Cooling Problem",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Troubleshoot cooling problems with your air conditioner.",
      features: [
        "Insufficient Cooling",
        "Temperature Fluctuation Fix",
        "System Calibration",
      ],
    ),
    SubCategory(
      title: "AC Installation and Uninstallation",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Efficient installation and uninstallation of all AC units.",
      features: [
        "Quick Installation",
        "Safe Uninstallation",
        "Expert Setup",
      ],
    ),
    SubCategory(
      title: "VRF AC Service",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Professional VRF air conditioning service for large systems.",
      features: [
        "System Analysis",
        "Energy Efficiency Optimization",
        "Troubleshooting & Repairs",
      ],
    ),
    SubCategory(
      title: "AC Exchange Note",
      icon: "assets/icons/air-conditioner.png",
      image: "assets/images/air-conditioner.JPG",
      description: "Exchange your old AC with new models at discounted prices.",
      features: [
        "Old AC Exchange",
        "Discount on New Purchases",
        "Free Evaluation",
      ],
    ),
    // Add other subcategories...
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
                    Text(subCategory.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(subCategory.description, style: TextStyle(fontSize: 12, color: Colors.grey[700]), maxLines: 2, overflow: TextOverflow.ellipsis),
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
      MaterialPageRoute(builder: (context) => SubCategoryDetailPage(subCategory: subCategory)),
    );
  }
}
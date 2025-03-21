import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class CarRepairingPage extends StatelessWidget {
  final Category category;

  const CarRepairingPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Car Wash Service",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Professional interior and exterior cleaning services.",
      features: ["Exterior Wash", "Interior Vacuuming", "Polish & Waxing"],
    ),
    SubCategory(
      title: "Car Engine Repair",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Complete engine diagnostics and repair solutions.",
      features: ["Engine Tuning", "Overhaul Services", "Performance Check"],
    ),
    SubCategory(
      title: "Car Shocker",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Shock absorber repair and replacement services.",
      features: ["Suspension Check", "Shock Replacement", "Alignment Service"],
    ),
    SubCategory(
      title: "Car Body Maker",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Professional body shaping and customization.",
      features: ["Body Restoration", "Custom Fabrication", "Frame Repair"],
    ),
    SubCategory(
      title: "Car Denting And Painting",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Dent removal and premium painting services.",
      features: ["Paint Matching", "Dent Removal", "Rust Treatment"],
    ),
    SubCategory(
      title: "Tyre Repairing",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Complete tyre maintenance and replacement.",
      features: ["Puncture Repair", "Wheel Alignment", "Tyre Balancing"],
    ),
    SubCategory(
      title: "Car Seat Cover",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Custom seat cover installation services.",
      features: ["Material Selection", "Custom Fit", "Leather Care"],
    ),
    SubCategory(
      title: "Car Window Shield",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Window repair and replacement services.",
      features: ["Glass Replacement", "Tinting Services", "Seal Repair"],
    ),
    SubCategory(
      title: "Bumper Repair",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Bumper restoration and replacement.",
      features: ["Crack Repair", "Paint Matching", "Alignment Fix"],
    ),
    SubCategory(
      title: "Car Not Start",
      icon: "assets/icons/car.png",
      image: "assets/Car Engine Repair.png",
      description: "Troubleshooting and repair for starting issues.",
      features: ["Battery Check", "Starter Motor Repair", "Ignition Service"],
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
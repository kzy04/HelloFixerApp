import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class MaidServicePage extends StatelessWidget {
  final Category category;

  const MaidServicePage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Hourly Maid Service",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Flexible cleaning services by the hour.",
      features: ["General Cleaning", "Vacuuming", "Dusting"],
    ),
    SubCategory(
      title: "Monthly Maid Service",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Comprehensive cleaning services on a monthly basis.",
      features: ["Deep Cleaning", "Window Washing", "Organizing Services"],
    ),
    SubCategory(
      title: "Post-Construction Cleaning",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Cleaning after construction or renovation projects.",
      features: ["Dust Removal", "Debris Cleaning", "Final Touch-Up"],
    ),
    SubCategory(
      title: "Spring Cleaning",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Thorough seasonal cleaning for your home.",
      features: ["Detailed Scrubbing", "Furniture Polishing", "Carpet Cleaning"],
    ),
    SubCategory(
      title: "Move-In/Move-Out Cleaning",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Cleaning before or after moving into a home.",
      features: ["Kitchen & Bathroom Sanitizing", "Cabinet Cleaning", "Floor Care"],
    ),
    SubCategory(
      title: "Eco-Friendly Cleaning",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Green cleaning using eco-friendly products.",
      features: ["Non-Toxic Products", "Sustainable Practices", "Pet-Friendly"],
    ),
    SubCategory(
      title: "Office Cleaning",
      icon: "assets/icons/cleaner.png",
      image: "assets/maidservice.JPG",
      description: "Cleaning services for offices and workspaces.",
      features: ["Desk Cleaning", "Floor Sweeping", "Trash Removal"],
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

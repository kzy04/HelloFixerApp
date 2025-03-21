import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class ElectricianPage extends StatelessWidget {
  final Category category;

  const ElectricianPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Electronic Items Repairing Servicing",
      icon: "assets/icons/electrician.png",
      image: "assets/electronic_items_repairing_servicing.png",
      description: "Repair and servicing for various electronic items.",
      features: ["TV Repair", "Home Appliances", "Computer Fixing"],
    ),
    SubCategory(
      title: "Wiring Services",
      icon: "assets/icons/electrician.png",
      image: "assets/electronic_items_repairing_servicing.png",
      description: "Professional wiring installation and repair services.",
      features: ["New Wiring Installation", "Rewiring", "Electrical Inspections"],
    ),
    SubCategory(
      title: "Lighting Installation",
      icon: "assets/icons/electrician.png",
      image: "assets/electronic_items_repairing_servicing.png",
      description: "Expert lighting installation services for homes and offices.",
      features: ["LED Lighting", "Chandeliers", "Outdoor Lighting"],
    ),
    SubCategory(
      title: "Circuit Breaker Repair",
      icon: "assets/icons/electrician.png",
      image: "assets/electronic_items_repairing_servicing.png",
      description: "Repair and replacement of faulty circuit breakers.",
      features: ["Breaker Replacement", "Circuit Inspection", "Overload Protection"],
    ),
    SubCategory(
      title: "Generator Repair",
      icon: "assets/icons/electrician.png",
      image: "assets/electronic_items_repairing_servicing.png",
      description: "Fixing and maintenance of home and industrial generators.",
      features: ["Generator Maintenance", "Fuel System Repair", "Electrical Testing"],
    ),
    SubCategory(
      title: "Surge Protector Installation",
      icon: "assets/icons/electrician.png",
      image: "assets/electronic_items_repairing_servicing.png",
      description: "Install and maintain surge protectors for your appliances.",
      features: ["Surge Protection Setup", "Electrical Safety", "Home Protection"],
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

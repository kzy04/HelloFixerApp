import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class CCTVServicePage extends StatelessWidget {


  final Category category;

  const CCTVServicePage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "CCTV Camera Repairing",
      icon: "assets/icons/video.png",
      image: "assets/CCTV Camera Installation1.png",
      description: "Expert repair services for CCTV cameras.",
      features: ["Camera Diagnostics", "Lens Repair", "Wiring Fixes"],
    ),
    SubCategory(
      title: "CCTV Camera Servicing",
      icon: "assets/icons/video.png",
      image: "assets/CCTV Camera Installation1.png",
      description: "Comprehensive servicing and maintenance for CCTV cameras.",
      features: ["Camera Cleaning", "System Calibration", "Software Updates"],
    ),
    SubCategory(
      title: "CCTV Camera Installation",
      icon: "assets/icons/video.png",
      image: "assets/CCTV Camera Installation1.png",
      description: "Professional CCTV camera installation services.",
      features: ["Camera Setup", "Wiring Installation", "System Integration"],
    ),
    SubCategory(
      title: "CCTV Camera Uninstallation",
      icon: "assets/icons/video.png",
      image: "assets/CCTV Camera Installation1.png",
      description: "Safe removal and uninstallation of CCTV cameras.",
      features: ["Disconnection", "Equipment Removal", "System Reset"],
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


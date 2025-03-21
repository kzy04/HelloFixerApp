import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class WeldingPage extends StatelessWidget {
  final Category category;

  const WeldingPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Welding for Metal Fabrication",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Expert welding services for all types of metal fabrication.",
      features: ["MIG Welding", "TIG Welding", "Arc Welding"],
    ),
    SubCategory(
      title: "Pipe Welding Services",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Specialized welding for pipes and tubing in various materials.",
      features: ["Stainless Steel Welding", "Aluminum Pipe Welding", "Leak Fixing"],
    ),
    SubCategory(
      title: "Welding for Automotive Repairs",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Welding solutions for automotive body repairs and modifications.",
      features: ["Frame Welding", "Chassis Repair", "Exhaust System Fixes"],
    ),
    SubCategory(
      title: "Structural Steel Welding",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "High-strength welding for structural steel construction.",
      features: ["Building Frames", "Bridges", "Heavy Equipment Support"],
    ),
    SubCategory(
      title: "Welding for Furniture",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Custom metal welding for furniture design and repairs.",
      features: ["Table Frame Welding", "Chair Reinforcement", "Metal Work Customization"],
    ),
    SubCategory(
      title: "Aluminum Welding",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Precision welding services for aluminum materials.",
      features: ["Aluminum Alloy Welding", "Heat Treatment", "Custom Aluminum Products"],
    ),
    SubCategory(
      title: "Stainless Steel Welding",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Welding of stainless steel for high-durability applications.",
      features: ["Corrosion Resistance", "TIG Welding", "Food Grade Equipment Welding"],
    ),
    SubCategory(
      title: "Welding for Home Repairs",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Reliable welding for home appliances and fixtures.",
      features: ["Gate Welding", "Door Frame Repair", "Appliance Repair"],
    ),
    SubCategory(
      title: "Welding for Metal Art",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Creative metal welding for art pieces and sculptures.",
      features: ["Custom Sculptures", "Metal Art Pieces", "Creative Design Welding"],
    ),
    SubCategory(
      title: "Welding for Tanks & Containers",
      icon: "assets/icons/welder.png",
      image: "assets/Welding.JPG",
      description: "Tank and container welding for industrial use.",
      features: ["Storage Tank Repair", "Container Sealing", "Pressure Vessel Welding"],
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

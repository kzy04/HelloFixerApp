import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class ShiftingPage extends StatelessWidget {
  final Category category;

  const ShiftingPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "House Shifting Service",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Professional house shifting services for all your moving needs.",
      features: ["Packing", "Transporting", "Unpacking"],
    ),
    SubCategory(
      title: "Commercial Shifting Service",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Reliable commercial shifting for businesses and offices.",
      features: ["Office Equipment", "Furniture Transport", "Disassembly & Reassembly"],
    ),
    SubCategory(
      title: "Pickup & Truck Rental",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Rent a pickup truck for your moving and transport needs.",
      features: ["Pickup Rental", "Truck Hire", "Flexible Hours"],
    ),
    SubCategory(
      title: "Furniture Assembly",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Professional assembly and disassembly of furniture.",
      features: ["Sofa Assembly", "Bed Frame Setup", "Cabinet Assembly"],
    ),
    SubCategory(
      title: "Packing Materials",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "High-quality packing materials for safe moving.",
      features: ["Bubble Wrap", "Packing Tape", "Moving Boxes"],
    ),
    SubCategory(
      title: "Storage Services",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Secure storage options for your belongings during relocation.",
      features: ["Short-term Storage", "Long-term Storage", "Climate Control"],
    ),
    SubCategory(
      title: "Local Shifting",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Affordable local shifting services within the city.",
      features: ["Short-distance Moves", "Efficient Loading", "Cost-effective"],
    ),
    SubCategory(
      title: "International Shifting",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "International relocation services for those moving abroad.",
      features: ["Customs Assistance", "International Transport", "Packing Services"],
    ),
    SubCategory(
      title: "Vehicle Transport",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Transport your vehicle safely to your new destination.",
      features: ["Car Shipping", "Bike Transport", "Vehicle Insurance"],
    ),
    SubCategory(
      title: "Storage & Pickup",
      icon: "assets/icons/van.png",
      image: "assets/shifting.JPG",
      description: "Pickup services for items to be stored or transported.",
      features: ["On-demand Pickup", "Secure Storage", "Flexible Schedules"],
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

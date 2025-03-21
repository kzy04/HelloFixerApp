import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class WaterPurifierPage extends StatelessWidget {
  final Category category;

  const WaterPurifierPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "All Type of RO Servicing",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Complete servicing for all types of RO water purifiers.",
      features: ["Filter Replacement", "Cleaning & Maintenance", "System Check"],
    ),
    SubCategory(
      title: "All Type of RO Repairing",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Expert repair services for all models of RO water purifiers.",
      features: ["Leak Repair", "Pump Replacement", "Circuit Board Repair"],
    ),
    SubCategory(
      title: "All Type of RO Purchase Enquiry",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Inquire about various models and brands of RO water purifiers.",
      features: ["Brand Comparison", "Model Selection", "Pricing Enquiry"],
    ),
    SubCategory(
      title: "RO Filter Installation",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Installation services for RO water purifier filters.",
      features: ["Filter Fitting", "System Setup", "Leak Check"],
    ),
    SubCategory(
      title: "RO Water Quality Testing",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Test the quality of your water before and after purification.",
      features: ["TDS Measurement", "Chemical Contaminants Test", "pH Test"],
    ),
    SubCategory(
      title: "RO Membrane Replacement",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Membrane replacement service for your RO purifier.",
      features: ["Membrane Cleaning", "Membrane Replacement", "System Performance Check"],
    ),
    SubCategory(
      title: "RO Filter Sales",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Purchase RO filters for various purifier models.",
      features: ["Different Brands", "Affordable Prices", "Free Delivery"],
    ),
    SubCategory(
      title: "RO Annual Maintenance Contract (AMC)",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Annual maintenance contract services for your RO water purifier.",
      features: ["Regular Servicing", "Filter Replacement", "Priority Support"],
    ),
    SubCategory(
      title: "Water Purifier Installation",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Complete installation services for water purifiers.",
      features: ["Installation", "Initial Setup", "Functionality Check"],
    ),
    SubCategory(
      title: "RO Troubleshooting",
      icon: "assets/icons/water-filter.png",
      image: "assets/waterpurifierservice.JPG",
      description: "Troubleshooting for any issues with your RO system.",
      features: ["Flow Rate Issues", "No Water Output", "Noise Problems"],
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

import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class TelevisionLedPage extends StatelessWidget {
  final Category category;

  const TelevisionLedPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "LCD & LED Repairing",
      icon: "assets/icons/tv.png",
      image: "assets/display_screen.png",
      description: "Professional repair services for LCD and LED televisions.",
      features: ["Screen Repair", "Panel Replacement", "Backlight Repair"],
    ),
    SubCategory(
      title: "Display/Screen",
      icon: "assets/icons/tv.png",
      image: "assets/display_screen.png",
      description: "Display screen replacement and repair services.",
      features: ["Cracked Screen Fix", "Display Calibration", "Panel Replacement"],
    ),
    SubCategory(
      title: "Speaker/Sound",
      icon: "assets/icons/tv.png",
      image: "assets/display_screen.png",
      description: "Sound system troubleshooting and speaker repair.",
      features: ["Sound Distortion Fix", "Speaker Replacement", "Audio Settings"],
    ),
    SubCategory(
      title: "Power Supply/Tv Dead",
      icon: "assets/icons/tv.png",
      image: "assets/display_screen.png",
      description: "Power supply repair services for dead TVs.",
      features: ["Power Board Repair", "Fuse Replacement", "Power Cable Check"],
    ),
    SubCategory(
      title: "Installation & Uninstallation",
      icon: "assets/icons/tv.png",
      image: "assets/display_screen.png",
      description: "TV installation and uninstallation services.",
      features: ["Wall Mount Installation", "Uninstallation", "Cable Management"],
    ),
    SubCategory(
      title: "Not Sure",
      icon: "assets/icons/tv.png",
      image: "assets/display_screen.png",
      description: "Not sure what the issue is? Let us check it for you.",
      features: ["Diagnostic Service", "Tech Support", "Problem Analysis"],
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

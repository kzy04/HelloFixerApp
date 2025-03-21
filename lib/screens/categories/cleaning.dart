import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class CleaningPage extends StatelessWidget {
  final Category category;

  const CleaningPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Bathroom Cleaning",
      icon: "assets/icons/cleaning.png",
      image: "assets/Cleaning.JPG",
      description: "Professional cleaning services for your bathroom.",
      features: ["Tile Scrubbing", "Shower Cleaning", "Sink & Mirror Cleaning"],
    ),
    SubCategory(
      title: "Kitchen Cleaning",
      icon: "assets/icons/cleaning.png",
      image: "assets/Cleaning.JPG",
      description: "Comprehensive cleaning for kitchens, including appliances.",
      features: ["Countertop Cleaning", "Appliance Wipe", "Floor Scrubbing"],
    ),
    SubCategory(
      title: "Room Cleaning",
      icon: "assets/icons/cleaning.png",
      image: "assets/Cleaning.JPG",
      description: "Detailed cleaning for living rooms and bedrooms.",
      features: ["Dusting", "Floor Polishing", "Furniture Care"],
    ),
    SubCategory(
      title: "Outside Home Cleaning",
      icon: "assets/icons/cleaning.png",
      image: "assets/Cleaning.JPG",
      description: "Exterior cleaning for your home including windows and driveways.",
      features: ["Window Washing", "Pressure Washing", "Driveway Cleaning"],
    ),
    SubCategory(
      title: "Flat Cleaning Services",
      icon: "assets/icons/cleaning.png",
      image: "assets/Cleaning.JPG",
      description: "End-to-end cleaning services for flats and apartments.",
      features: ["Full Home Cleaning", "Balcony Cleaning", "Floor Washing"],
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

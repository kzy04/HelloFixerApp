import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class CarpentryPage extends StatelessWidget {
  final Category category;

  const CarpentryPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Drill And Hanging",
      icon: "assets/icons/carpenter.png",
      image: "assets/repairingwoodenitems.png",
      description: "Professional drilling and hanging services for home décor.",
      features: ["Wall Mounting", "Shelf Installation", "Picture Hanging"],
    ),
    SubCategory(
      title: "Designing Wooden Items",
      icon: "assets/icons/carpenter.png",
      image: "assets/repairingwoodenitems.png",
      description: "Custom design services for wooden furniture and items.",
      features: ["Furniture Design", "Wooden Sculptures", "Custom Woodwork"],
    ),
    SubCategory(
      title: "Repairing Wooden Items",
      icon: "assets/icons/carpenter.png",
      image: "assets/repairingwoodenitems.png",
      description: "Repair and restoration services for wooden furniture.",
      features: ["Furniture Restoration", "Wood Polishing", "Wooden Item Repair"],
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

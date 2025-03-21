import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class InteriorDesignPage extends StatelessWidget {
  final Category category;

  const InteriorDesignPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Home Decor",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Stylish and personalized home interior designing services.",
      features: ["Living Room Decor", "Bedroom Setup", "Wall Art Design"],
    ),
    SubCategory(
      title: "Office Decor",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Modern office interior designing to enhance productivity.",
      features: ["Office Furniture", "Workspace Layout", "Lighting Design"],
    ),
    SubCategory(
      title: "Kitchen Design",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Functional and aesthetic kitchen layout and design services.",
      features: ["Modular Kitchens", "Storage Solutions", "Countertop Installation"],
    ),
    SubCategory(
      title: "Bathroom Design",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Elegant and space-saving bathroom renovation and design.",
      features: ["Shower Installation", "Vanity Design", "Tiles & Flooring"],
    ),
    SubCategory(
      title: "Living Room Setup",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Customizing your living room for comfort and style.",
      features: ["Sofa Arrangement", "Decorative Lighting", "Flooring Design"],
    ),
    SubCategory(
      title: "Wall Art & Paintings",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Personalized wall art to match your home decor.",
      features: ["Custom Art", "Framing Services", "Murals & Paintings"],
    ),
    SubCategory(
      title: "Furniture Design",
      icon: "assets/icons/interior-design.png",
      image: "assets/Interior.JPG",
      description: "Tailor-made furniture pieces for a unique touch.",
      features: ["Sofa Design", "Coffee Tables", "Cabinetry Work"],
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

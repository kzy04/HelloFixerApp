import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class PlumbingPage extends StatelessWidget {
  final Category category;

  const PlumbingPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Plumber Repairs & Installation",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Expert plumbing repairs and installation services.",
      features: ["Pipe Repair", "Faucet Installation", "Water Heater Setup"],
    ),
    SubCategory(
      title: "Basin & Sink",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Basin and sink installation and repairs.",
      features: ["Sink Installation", "Leak Fixing", "Clog Removal"],
    ),
    SubCategory(
      title: "Bath Fittings",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "High-quality bath fittings for your bathroom.",
      features: ["Shower Installations", "Bathtubs", "Waterproofing"],
    ),
    SubCategory(
      title: "Drainage Pipes",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Drainage pipe installations and maintenance.",
      features: ["Clog Removal", "Pipe Replacements", "Leak Repairs"],
    ),
    SubCategory(
      title: "Tap & Mixer",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Tap and mixer installation and repairs.",
      features: ["Tap Fixing", "Water Flow Optimization", "New Installations"],
    ),
    SubCategory(
      title: "Water Tank",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Water tank installation and maintenance services.",
      features: ["Tank Installation", "Cleaning", "Repairs"],
    ),
    SubCategory(
      title: "Motor Service",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Motor services for water pumping systems.",
      features: ["Motor Repair", "New Installation", "Troubleshooting"],
    ),
    SubCategory(
      title: "Toilet Cleaning",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Complete toilet cleaning and maintenance.",
      features: ["Sanitization", "Clogging Solutions", "Leak Fixing"],
    ),
    SubCategory(
      title: "Water Pipe Connections",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Expert connections and installations for water pipes.",
      features: ["Pipe Connections", "Leak Repairs", "Pipe Replacements"],
    ),
    SubCategory(
      title: "Looking For Something Else?",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "If you have a unique plumbing need, let us know!",
      features: ["Custom Requests", "Consultations", "Other Services"],
    ),
    SubCategory(
      title: "Water Filtration Systems",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Water filtration and purification services.",
      features: ["System Installation", "Maintenance", "Replacement Filters"],
    ),
    SubCategory(
      title: "Leak Detection & Repair",
      icon: "assets/icons/plumber.png",
      image: "assets/Plumber Repairs & Installation.png",
      description: "Specialized leak detection and repair services.",
      features: ["Leak Inspection", "Pipe Fixes", "Water Loss Prevention"],
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

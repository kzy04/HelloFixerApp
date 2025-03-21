import 'package:flutter/material.dart';
import 'package:hellofixerapp/booking_form.dart';


class SubCategory {
  final String title;
  final String icon;
  final String image;
  final String description;
  final List<String> features;

  const SubCategory({
    required this.title,
    required this.icon,
    required this.image,
    this.description = '',
    this.features = const [],
  });
}

class SubCategoryDetailPage extends StatelessWidget {
  final SubCategory subCategory;

  const SubCategoryDetailPage({required this.subCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subCategory.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroImage(),
            const SizedBox(height: 24),
            _buildDescriptionSection(),
            const SizedBox(height: 24),
            _buildFeaturesSection(),
            const SizedBox(height: 32),
            _buildActionButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(subCategory.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Text(subCategory.description, style: const TextStyle(fontSize: 16, height: 1.5));
  }

  Widget _buildFeaturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Service Features:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...subCategory.features.map((feature) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
              const SizedBox(width: 12),
              Expanded(child: Text(feature)),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _showBookingPage(context),
        child: const Text("Book Now", style: TextStyle(fontSize: 16)),
      ),
    );
  }

  void _showBookingPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingFormPage(serviceTitle: subCategory.title),
      ),
    );
  }
}

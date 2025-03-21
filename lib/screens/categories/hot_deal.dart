import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'sub_category_detail_page.dart';

class HotDealPage extends StatelessWidget {
  final Category category;

  const HotDealPage({required this.category, Key? key}) : super(key: key);

  final List<SubCategory> subCategories = const [
    SubCategory(
      title: "Basic Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Access to limited services with basic benefits.",
      features: ["Discounted Rates", "Priority Support", "Free Consultation"],
    ),
    SubCategory(
      title: "Premium Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Enjoy premium services and priority booking.",
      features: ["Extended Service Hours", "Free Diagnostics", "Special Offers"],
    ),
    SubCategory(
      title: "VIP Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Exclusive offers for VIP members with personalized services.",
      features: ["Unlimited Services", "Complimentary Services", "Dedicated Support"],
    ),
    SubCategory(
      title: "Family Plan",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "A family-friendly plan that covers multiple members.",
      features: ["Multiple Member Coverage", "Special Family Discounts", "Priority Appointments"],
    ),
    SubCategory(
      title: "Annual Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Get the best value with an annual membership plan.",
      features: ["Full Year Coverage", "Exclusive Discounts", "Free Upgrades"],
    ),
    SubCategory(
      title: "Business Plan",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Tailored for businesses to access bulk services.",
      features: ["Bulk Service Discounts", "Priority Business Support", "Customized Solutions"],
    ),
    SubCategory(
      title: "Student Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Discounted services for students to help manage their budgets.",
      features: ["Student Discounts", "Flexible Payment Plans", "Exclusive Access to Deals"],
    ),
    SubCategory(
      title: "Early Bird Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Get early access to new services and products.",
      features: ["Early Access", "Exclusive Notifications", "Special Discounts"],
    ),
    SubCategory(
      title: "Referral Program",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Refer friends and earn rewards with HelloFixer.",
      features: ["Referral Bonuses", "Service Vouchers", "Discounted Upgrades"],
    ),
    SubCategory(
      title: "Customized Membership",
      icon: "assets/icons/hot-deal.png",
      image: "assets/hotdeal.JPG",
      description: "Create a personalized membership plan to suit your needs.",
      features: ["Tailored Benefits", "Flexible Terms", "Exclusive Offers"],
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

import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';
import 'package:hellofixerapp/screens/category_detail.dart';
import 'package:hellofixerapp/screens/categories/air_conditioner.dart';
import 'package:hellofixerapp/screens/categories/television_led.dart';
import 'package:hellofixerapp/screens/categories/car_repairing.dart';
import 'package:hellofixerapp/screens/categories/cleaning.dart';
import 'package:hellofixerapp/screens/categories/plumbing.dart';
import 'package:hellofixerapp/screens/categories/electrician.dart';
import 'package:hellofixerapp/screens/categories/interior_design.dart';
import 'package:hellofixerapp/screens/categories/carpentry.dart';
import 'package:hellofixerapp/screens/categories/water_purifier.dart';
import 'package:hellofixerapp/screens/categories/driver_service.dart';
import 'package:hellofixerapp/screens/categories/maid_service.dart';
import 'package:hellofixerapp/screens/categories/shifting.dart';
import 'package:hellofixerapp/screens/categories/welding.dart';
import 'package:hellofixerapp/screens/categories/hot_deal.dart';
import 'package:hellofixerapp/screens/categories/cctv_service.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories = [
    Category(title: "Air-Conditioner", icon: "assets/icons/air-conditioner.png"),
    Category(title: "Television & LED", icon: "assets/icons/tv.png"),
    Category(title: "Car Repairing", icon: "assets/icons/car.png"),
    Category(title: "Cleaning", icon: "assets/icons/cleaning.png"),
    Category(title: "Plumbing", icon: "assets/icons/plumber.png"),
    Category(title: "Electrician", icon: "assets/icons/electrician.png"),
    Category(title: "Interior Design", icon: "assets/icons/interior-design.png"),
    Category(title: "Carpentry", icon: "assets/icons/carpenter.png"),
    Category(title: "Water Purifier", icon: "assets/icons/water-filter.png"),
    Category(title: "Driver Service", icon: "assets/icons/driver.png"),
    Category(title: "Maid Service", icon: "assets/icons/cleaner.png"),
    Category(title: "Shifting", icon: "assets/icons/van.png"),
    Category(title: "Welding", icon: "assets/icons/welder.png"),
    Category(title: "CCTV Service", icon: "assets/icons/video.png"),
    Category(title: "Hot Deal", icon: "assets/icons/hot-deal.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.9,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryItem(context, categories[index]);
      },
    );
  }

  Widget _buildCategoryItem(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {
        Widget page;

        switch (category.title) {
          case "Air-Conditioner":
            page = AirConditionerPage(category: category);
            break;
          case "Television & LED":
            page = TelevisionLedPage(category: category);
            break;
          case "Car Repairing":
            page = CarRepairingPage(category: category);
            break;
          case "Cleaning":
            page = CleaningPage(category: category);
            break;
          case "Plumbing":
            page = PlumbingPage(category: category);
            break;
          case "Electrician":
            page = ElectricianPage(category: category);
            break;
          case "Interior Design":
            page = InteriorDesignPage(category: category);
            break;
          case "Carpentry":
            page = CarpentryPage(category: category);
            break;
          case "Water Purifier":
            page = WaterPurifierPage(category: category);
            break;
          case "Driver Service":
            page = DriverServicePage(category: category);
            break;
          case "Maid Service":
            page = MaidServicePage(category: category);
            break;
          case "Shifting":
            page = ShiftingPage(category: category);
            break;
          case "Welding":
            page = WeldingPage(category: category);
            break;
          case "CCTV Service":
            page = CCTVServicePage(category: category);
            break;
          case "Hot Deal":
            page = HotDealPage(category: category);
            break;
          default:
            page = CategoryDetailPage(category: category); // Fallback for undefined categories
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView( // Wrap the Column inside SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  category.icon,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain, // Ensure the image doesn't overflow
                ),
                SizedBox(height: 8),
                Text(
                  category.title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

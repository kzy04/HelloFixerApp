import 'package:flutter/material.dart';
import 'package:hellofixerapp/models/category_model.dart';


class CategoryDetailPage extends StatelessWidget {
  final Category category;

  const CategoryDetailPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.icon, width: 100, height: 100),
            SizedBox(height: 20),
            Text(category.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            category.subcategories != null
                ? Expanded(
              child: ListView.builder(
                itemCount: category.subcategories!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(category.subcategories![index]),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  );
                },
              ),
            )
                : Text("No additional services available."),
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../widgets/Category_item.dart';
import '../app_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 7 / 8),
      children: Categories_data.map((CategoryData) => CategoryItem(
            CategoryData.id,
            CategoryData.title,
            CategoryData.imageUrl,
          )).toList(),
    );
  }
}

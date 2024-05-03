
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data (1).dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,  required this.availableMeals});

  final List<Meal>availableMeals;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
        children: [
          for(final category in availableCategories)
          CategoryGridItem(category: category,  availableMeals: availableMeals,),
        ],

    );
  }
}
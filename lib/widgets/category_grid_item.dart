import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category,  required this.availableMeals});

  final Category category;
  final List<Meal>availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(//GestureDetector
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      onTap: (){
       final List<Meal> filteredMeal =  availableMeals.where((meal) =>
           meal.categories.contains(category.id),).toList();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx)=> MealsScreen(
            title: category.title,
            meals: filteredMeal,
          ),)
        );
      },
      child: Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.54),
            category.color.withOpacity(0.9),
          ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        padding: const EdgeInsets.all(16),child:
      Text(category.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      ),
    );
  }
}
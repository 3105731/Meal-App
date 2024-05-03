import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/providers/nav_bar_provider.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/meal_drawer.dart';

import '../models/meal.dart';
import 'category_screen.dart';


class   TabScreen extends ConsumerWidget {   //state management .reviarpod
  const TabScreen({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    final selectedPageIndex = ref.watch(navBarProvider);
    Widget activePage = CategoriesScreen( availableMeals: availableMeals,);
    var activePageTitle = 'Pick your category';
    if(selectedPageIndex == 1){
     final List<Meal> favMeal= ref.watch(favoritesMealsProvider);    //state management .reviarpod
      activePage = MealsScreen(meals: favMeal);
       activePageTitle = 'Favorites';
    }

    return Scaffold(
      drawer: MealDrawer(onSelectScreen: (String identifier){
        Navigator.of(context).pop();
        if (identifier == 'filters') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const FiltersScreen(),),
          );
        }
      },),
      appBar: AppBar(title: Text(activePageTitle),),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap:  ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
        ] ,
      ),

    );
  }
}

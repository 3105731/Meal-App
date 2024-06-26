import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorites_provider.dart';

import '../models/meal.dart';

class MealDetailScreen extends ConsumerWidget {         //state management .reviarpod
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final List<Meal> favoriteMeals =  ref.watch(favoritesMealsProvider);         //state management .reviarpod
   final bool isFavorite = favoriteMeals.contains(meal);

  return Scaffold(
      appBar: AppBar(title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
           final wasAdded = ref.read(favoritesMealsProvider.notifier).toggleFavMeal(meal); //state management .reviarpod
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
            Text(wasAdded? 'Marked as favorite': 'Meal is no longer a favorite' ),),);
          },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),

            Text(
              "Ingredients",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 14,),
            for(final ingredients in meal.ingredients)
              Text(

                ingredients,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),),

            const SizedBox(height: 40,),

            Text("Steps",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 14,),
            for(final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                child: Text(
                  textAlign: TextAlign.center,
                  steps,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              ),
          ],
        ),
      ),
    );
  }
}
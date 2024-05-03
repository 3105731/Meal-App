import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';


class FavMealsNotifier extends StateNotifier<List<Meal>>{
  FavMealsNotifier():super([]);

  bool toggleFavMeal(Meal meal){
    final isExist = state.contains(meal);

    if(isExist){
      state =  state.where((element) => element.id != meal.id).toList();
      return false;         //remove
    }else {
      state = [...state,meal];
      return true;                  //add
    }
  }
}



final favoritesMealsProvider =
StateNotifierProvider<FavMealsNotifier,List<Meal>>
  ((ref) =>FavMealsNotifier() );
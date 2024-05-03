import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'meals_provider.dart';

enum Filters{
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree
}

class FilterMealsNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterMealsNotifier() :super({
    Filters.vegetarianFree: false,
    Filters.veganFree: false,
    Filters.lactoseFree: false,
    Filters.glutenFree: false,
  });
  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;

  }
  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};

  }

}

  final filtersProvider =
  StateNotifierProvider<FilterMealsNotifier, Map<Filters, bool>>
    ((ref) =>FilterMealsNotifier() );



final filteredMealsProvider = Provider((ref)  {
  final meals = ref.watch(mealsProvider);
  final Map<Filters, bool> activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if(activeFilters[Filters.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filters.veganFree]! && !meal.isVegan){
      return false;
    }
    if(activeFilters[Filters.vegetarianFree]! && !meal. isVegetarian){
      return false;
    }
    return true;
  }).toList();
});
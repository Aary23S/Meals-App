import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shpoing_app/screens/provider/meals_provider.dart';

enum Filters {
  glutenFree,
  vegetarian,
  vegan,
  lactoseFree,
}

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
          Filters.lactoseFree: false,
        });

  void setAllFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>((ref) {
  return FilterNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);

  return meals.where((meal) {
    if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
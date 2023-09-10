import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
// import 'package:meals_app/screens/filters_screen.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

const kInitialFilters = {};

class FiltersNotifer extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifer()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive, // will override the previous filter of the same name
    };
  }

  void setAllFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifer, Map<Filter, bool>>((ref) {
  return FiltersNotifer();
});

final filteredMealsProvider = Provider((ref) {
  final mealsList = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return mealsList.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

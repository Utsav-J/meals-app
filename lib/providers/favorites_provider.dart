import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

//optimized for data that can change

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier()
      : super(
            []); // at the begininning the initial data is an empty list // we cant edit this list but we can only replace it with a new set of data

  bool toggleMealFavoriteStatus(Meal meal) {
    //state is a variable that connects to the initial value of the list
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false; // false if removed
    } else {
      state = [
        ...state,
        meal
      ]; // pulling out all the old favs and adding our new meal there with a comma
      return true; // true if added
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

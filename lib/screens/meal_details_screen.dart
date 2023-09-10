import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavorite,
  });
  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? "Added to Favorites"
                      : "Removed from Favorites"),
                ),
              );
            },
            icon: AnimatedSwitcher(
              // switches between two values and its upto us about what animation to play between the two states
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.2).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? CupertinoIcons.star_fill : CupertinoIcons.star,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal
                  .id, // same meal id between two widget files, this one and meal_item.dart , look for the hero tag
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients:",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
          ],
        ),
      ),
    );
  }
}

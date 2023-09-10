import 'package:flutter/material.dart';
// import 'package:meals_app/main.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    // required this.onToggleFavorite
  });
  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "UH, OH, Nothing here",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Try selecting a different category",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return mainContent;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
        ),
        body: mainContent,
      );
    }
  }
}

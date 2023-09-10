import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer_child.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: const MainDrawerChild(),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen("Meals");
            },
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen("Filters");
            },
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

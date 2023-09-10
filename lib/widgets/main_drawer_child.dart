import 'package:flutter/material.dart';

class MainDrawerChild extends StatelessWidget {
  const MainDrawerChild({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.fastfood,
          size: 40,
        ),
        const SizedBox(
          width: 18,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EZMeals',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              'Developed by Utsav',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w100),
            ),
          ],
        )
      ],
    );
  }
}

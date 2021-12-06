import 'package:flutter/material.dart';
import 'package:my_recipes/widgets/no_data.dart';

import '../models/category.dart';
import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];

    if (category == null) return const NoData(title: 'Category');

    final meals = mealList
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: Color(category.color),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            key: ValueKey(meals[index].id),
            meal: meals[index],
            category: category,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}

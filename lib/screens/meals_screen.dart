import 'package:flutter/material.dart';

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
    final meals = mealList
        .where((meal) => meal.categories.contains(category?.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category != null ? category.title : 'Meals'),
        backgroundColor: category != null ? Color(category.color) : null,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            key: ValueKey(meals[index].id),
            meal: meals[index],
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}

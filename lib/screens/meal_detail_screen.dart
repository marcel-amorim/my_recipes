import 'package:flutter/material.dart';
import 'package:my_recipes/widgets/no_data.dart';

import '../models/meal.dart';
import '../models/category.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    final category = routeArgs['category'] as Category?;
    final meal = routeArgs['meal'] as Meal?;

    if (category == null || meal == null) return const NoData(title: 'Meal');

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: Color(category.color),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('#${index + 1}'),
                    backgroundColor: Color(category.color),
                  ),
                  title: Text(meal.steps[index]),
                ),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

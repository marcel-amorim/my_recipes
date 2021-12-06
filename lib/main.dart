import 'package:flutter/material.dart';
import 'package:my_recipes/screens/tabs_screen.dart';

import './constants/routes.dart';
import 'screens/categories_screen.dart';
import 'screens/meals_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Raleway',
      canvasColor: const Color(0xFFFFFEE5),
    );

    return MaterialApp(
      title: 'My Recipes',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.teal,
          secondary: Colors.pink,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color(0xff143333),
              ),
              bodyText2: const TextStyle(
                color: Color(0xff143333),
              ),
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              headline2: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      routes: {
        Routes.home: (ctx) => const TabScreen(),
        Routes.meals: (ctx) => const MealsScreen(),
        Routes.mealDetail: (ctx) => const MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}

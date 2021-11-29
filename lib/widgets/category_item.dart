import 'package:flutter/material.dart';

import '../constants/routes.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(Routes.meals, arguments: {'category': category});
  }

  @override
  Widget build(BuildContext context) {
    var color = Color(category.color);

    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(category.title,
              style: Theme.of(context).textTheme.headline1),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

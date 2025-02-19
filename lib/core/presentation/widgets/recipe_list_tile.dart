import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_entity.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile ({super.key, required this.recipe});

  final RecipeEntity recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO Сделать через репозиторий, а так как сейчас - это тестовое
          Text(recipe.name),
          Text(recipe.tags.join(' ')),
        ],
      ),
    );
  }
}
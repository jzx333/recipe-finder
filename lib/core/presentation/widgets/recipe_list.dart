import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list_tile.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.borderRadius,
    this.scrollController,
    required this.recipes,
    required this.onRecipePressed,
  });

  final double borderRadius;
  final ScrollController? scrollController;
  final List<RecipePreviewEntity> recipes;
  final Function(RecipePreviewEntity recipe) onRecipePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius),
        ),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 450,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          mainAxisExtent: 260,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: theme.horizontalPadding,
        ),
        controller: scrollController,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeListTile(
            recipe: recipes[index],
            onTap: () {
              onRecipePressed(recipe);
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_entity.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list_tile.dart';

final recipes = [
  const RecipeEntity(name: "blini", tags: ["asdlf", "sldfj"]),
  const RecipeEntity(name: "lapsha", tags: ["lyti", "haip"]),
  const RecipeEntity(name: "yaic", tags: ["sometag"]),
  const RecipeEntity(name: "blini", tags: ["asdlf", "sldfj"]),
  const RecipeEntity(name: "lapsha", tags: ["lyti", "haip"]),
  const RecipeEntity(name: "yaic", tags: ["sometag"]),
  const RecipeEntity(name: "blini", tags: ["asdlf", "sldfj"]),
  const RecipeEntity(name: "lapsha", tags: ["lyti", "haip"]),
  const RecipeEntity(name: "yaic", tags: ["sometag"]),
];

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.borderRadius,
    required this.scrollController,
  });

  final double borderRadius;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        controller: scrollController,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeListTile(
            recipe: recipes[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}

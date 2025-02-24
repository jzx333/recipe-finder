import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list_tile.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';

final recipes = <RecipePreviewEntity>[
  RecipePreviewEntity(
    id: 1,
    name: "name",
    time: "time",
    budget: "budget",
    tags: [],
    imgSrc: "imgSrc",
  ),
//   const RecipeEntity(name: "blini", tags: ["asdlf", "sldfj"]),
//   const RecipeEntity(name: "lapsha", tags: ["lyti", "haip"]),
//   const RecipeEntity(name: "yaic", tags: ["sometag"]),
//   const RecipeEntity(name: "blini", tags: ["asdlf", "sldfj"]),
//   const RecipeEntity(name: "lapsha", tags: ["lyti", "haip"]),
//   const RecipeEntity(name: "yaic", tags: ["sometag"]),
//   const RecipeEntity(name: "blini", tags: ["asdlf", "sldfj"]),
//   const RecipeEntity(name: "lapsha", tags: ["lyti", "haip"]),
//   const RecipeEntity(name: "yaic", tags: ["sometag"]),
];

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.borderRadius,
    this.scrollController,
  });

  final double borderRadius;
  final ScrollController? scrollController;

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
          return RecipeListTile(
            recipe: recipes[index],
          );
        },
      ),
    );
  }
}

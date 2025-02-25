import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/small_tag.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  final RecipePreviewEntity recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(33),
        onTap: onTap,
        child: Ink(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        recipe.imgSrc,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(recipe.name, style: theme.textTheme.titleMedium),
                          const SizedBox(width: 10),
                          for (final tag in recipe.tags) ...[
                            SmallTag(tag: tag),
                            const SizedBox(width: 6),
                          ]
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        "Время приготовления ~${recipe.time} минут",
                        style: theme.textTheme.displayMedium,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

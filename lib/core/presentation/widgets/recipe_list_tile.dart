import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/small_tag.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({super.key, required this.recipe});

  final RecipeDetailsEntity recipe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(33),
        onTap: () {},
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
                        "https://prostokvashino.ru/upload/resize_cache/iblock/d62/800_800_0/d6269fa359b8595e632183c2c267c4ec.jpg",
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
                          Text("Блины", style: theme.textTheme.titleMedium),
                          const SizedBox(width: 10),
                          const SmallTag(text: "Из муки"),
                          const SizedBox(width: 6),
                          const SmallTag(text: "Жаренное"),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        "Время приготовления ~30 минут",
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

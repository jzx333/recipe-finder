import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/ingredient_entity.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
    required this.ingredients,
  });

  final List<IngredientEntity> ingredients;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: ingredients.map((i) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  "- ${i.name}",
                  style: theme.textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(i.quantity, style: theme.textTheme.bodyLarge)
            ],
          );
        }).toList(),
      ),
    );
  }
}

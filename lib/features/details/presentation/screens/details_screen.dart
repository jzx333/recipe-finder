import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/features/details/presentation/notifier/details_notifier.dart';
import 'package:recipe_finder_demo/features/details/presentation/widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.recipePreview,
  });

  final RecipePreviewEntity recipePreview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) =>
            DetailsNotifier(recipePreview: recipePreview)..init(),
        child: const DetailsBody(),
      ),
    );
  }
}

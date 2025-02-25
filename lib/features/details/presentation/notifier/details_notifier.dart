import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';
import 'package:recipe_finder_demo/di.dart';
import 'package:recipe_finder_demo/features/details/presentation/notifier/details_state.dart';

class DetailsNotifier extends ChangeNotifier {
  final RecipePreviewEntity _recipePreview;

  DetailsNotifier({
    required RecipePreviewEntity recipePreview,
  }) : _recipePreview = recipePreview;

  DetailsState state = DetailsStateLoading();

  final _recipeRepository = getIt<RecipeRepository>();

  void init() async {
    final recipeResult = await _recipeRepository.getRecipeDetails();

    if (recipeResult.err != null || recipeResult.recipeDetails == null) {
      state = DetailsStateError(err: recipeResult.err);
      notifyListeners();
      return;
    }

    state = DetailsStateLoaded(recipe: recipeResult.recipeDetails!);
    notifyListeners();
  }
}

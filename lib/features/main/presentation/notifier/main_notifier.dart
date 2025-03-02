import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';
import 'package:recipe_finder_demo/di.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_state.dart';

class MainNotifier extends ChangeNotifier {
  MainState state = MainStateLoading();

  final _recipeRepository = getIt<RecipeRepository>();

  void init() async {
    await refresh();
  }

  Future<void> refresh() async {
    // state = MainStateLoading();
    // notifyListeners();

    final tagsResult = await _recipeRepository.getTags();
    final recipesResult = await _recipeRepository.getRecipePreviews();

    if (tagsResult.err != null || recipesResult.err != null) {
      state = MainStateError(err: tagsResult.err ?? recipesResult.err);
      notifyListeners();
      return;
    }

    state = MainStateLoaded(
      tags: tagsResult.tags,
      recipes: recipesResult.recipePreviews,
    );

    notifyListeners();
  }
}

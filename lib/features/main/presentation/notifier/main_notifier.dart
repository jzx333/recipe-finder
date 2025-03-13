import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';
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
    late List<TagEntity> filterTags;

    if (state is MainStateLoaded) {
      filterTags = (state as MainStateLoaded).filterTags;
    } else {
      filterTags = [];
    }

    final tagsResult = await _recipeRepository.getTags();
    final recipesResult = await _recipeRepository.getRecipePreviews(
      filterTags: filterTags,
    );

    if (tagsResult.err != null || recipesResult.err != null) {
      state = MainStateError(err: tagsResult.err ?? recipesResult.err);
      notifyListeners();
      return;
    }

    state = MainStateLoaded(
      tags: tagsResult.tags,
      recipes: recipesResult.recipePreviews,
      filterTags: filterTags,
    );

    notifyListeners();
  }

  void toggleFilterTag(TagEntity tag) {
    if (state is! MainStateLoaded) return;

    final loadedState = state as MainStateLoaded;
    final filterTags = loadedState.filterTags.toList();

    if (filterTags.contains(tag)) {
      filterTags.remove(tag);
    } else {
      filterTags.add(tag);
    }

    state = loadedState.copyWith(filterTags: filterTags);
    notifyListeners();
    refresh();
  }
}

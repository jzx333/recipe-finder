import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';
import 'package:recipe_finder_demo/di.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_state.dart';

class FindNotifier extends ChangeNotifier {
  FindState state = FindStateLoading();

  final _recipeRepository = getIt<RecipeRepository>();

  void init() async {
    await refresh();
  }

  void toggleFilterTag(TagEntity tag) {
    if (state is! FindStateLoaded) return;

    final loadedState = state as FindStateLoaded;
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

  void setBudget(int? budget) {
    if (state is! FindStateLoaded) return;

    final loadedState = state as FindStateLoaded;
    final filterTags = loadedState.filterTags.toList();
    final recipes = loadedState.recipes.toList();
    final tags = loadedState.tags.toList();
    final calories = loadedState.calories;
    final time = loadedState.time;
    final name = loadedState.name;

    state = FindStateLoaded(
      tags: tags,
      recipes: recipes,
      budget: budget,
      calories: calories,
      time: time,
      name: name,
      filterTags: filterTags,
    );

    notifyListeners();
    refresh();
  }

  void setTime(int? time) {
    if (state is! FindStateLoaded) return;

    final loadedState = state as FindStateLoaded;
    final filterTags = loadedState.filterTags.toList();
    final recipes = loadedState.recipes.toList();
    final tags = loadedState.tags.toList();
    final calories = loadedState.calories;
    final budget = loadedState.budget;
    final name = loadedState.name;

    state = FindStateLoaded(
      tags: tags,
      recipes: recipes,
      budget: budget,
      calories: calories,
      time: time,
      name: name,
      filterTags: filterTags,
    );

    notifyListeners();
    refresh();
  }

  void setCalories(int? calories) {
    if (state is! FindStateLoaded) return;

    final loadedState = state as FindStateLoaded;
    final filterTags = loadedState.filterTags.toList();
    final recipes = loadedState.recipes.toList();
    final tags = loadedState.tags.toList();
    final time = loadedState.time;
    final budget = loadedState.budget;
    final name = loadedState.name;

    state = FindStateLoaded(
      tags: tags,
      recipes: recipes,
      budget: budget,
      calories: calories,
      time: time,
      name: name,
      filterTags: filterTags,
    );

    notifyListeners();
    refresh();
  }

  void setName(String? name) {
    if (state is! FindStateLoaded) return;

    final loadedState = state as FindStateLoaded;
    final filterTags = loadedState.filterTags.toList();
    final recipes = loadedState.recipes.toList();
    final tags = loadedState.tags.toList();
    final calories = loadedState.calories;
    final budget = loadedState.budget;
    final time = loadedState.time;

    state = FindStateLoaded(
      tags: tags,
      recipes: recipes,
      budget: budget,
      calories: calories,
      time: time,
      name: name,
      filterTags: filterTags,
    );

    notifyListeners();
    refresh();
  }

  Future<void> refresh() async {
    late List<TagEntity> filterTags;
    late int? budget;
    late int? calories;
    late int? time;
    late String? name;

    if (state is FindStateLoaded) {
      filterTags = (state as FindStateLoaded).filterTags;
      budget = (state as FindStateLoaded).budget;
      calories = (state as FindStateLoaded).calories;
      time = (state as FindStateLoaded).time;
      name = (state as FindStateLoaded).name;
    } else {
      filterTags = [];
      budget = null;
      calories = null;
      time = null;
      name = null;
    }

    final tagsResult = await _recipeRepository.getTags();
    final recipesResult = await _recipeRepository.getRecipePreviews(
      filterTags: filterTags,
      budget: budget,
      calories: calories,
      time: time,
      name: name,
    );

    if (tagsResult.err != null || recipesResult.err != null) {
      state = FindStateError(err: tagsResult.err ?? recipesResult.err);
      notifyListeners();
      return;
    }

    state = FindStateLoaded(
      tags: tagsResult.tags,
      recipes: recipesResult.recipePreviews,
      filterTags: filterTags,
      budget: budget,
      calories: calories,
      time: time,
      name: name,
    );

    notifyListeners();
  }
}

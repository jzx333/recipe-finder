import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

sealed class FindState {}

class FindStateLoading extends FindState {}

class FindStateLoaded extends FindState {
  final List<TagEntity> tags;
  final List<RecipePreviewEntity> recipes;

  final List<TagEntity> filterTags;
  final int? budget;
  final int? calories;
  final int? time;
  final String? name;

  FindStateLoaded({
    required this.tags,
    required this.recipes,
    this.filterTags = const [],
    required this.budget,
    required this.calories,
    required this.time,
    required this.name,
  });

  FindStateLoaded copyWith({
    List<TagEntity>? tags,
    List<RecipePreviewEntity>? recipes,
    List<TagEntity>? filterTags,
    int? budget,
    int? calories,
    int? time,
    String? name,
  }) {
    return FindStateLoaded(
      tags: tags ?? this.tags,
      recipes: recipes ?? this.recipes,
      filterTags: filterTags ?? this.filterTags,
      budget: budget ?? this.budget,
      calories: calories ?? this.calories,
      time: time ?? this.time,
      name: name ?? this.name,
    );
  }
}

class FindStateError extends FindState {
  final Object? err;

  FindStateError({
    required this.err,
  });
}

import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

sealed class MainState {}

class MainStateLoading extends MainState {}

class MainStateLoaded extends MainState {
  final List<TagEntity> tags;
  final List<RecipePreviewEntity> recipes;

  final List<TagEntity> filterTags;

  MainStateLoaded({
    required this.tags,
    required this.recipes,
    this.filterTags = const [],
  });

  MainStateLoaded copyWith({
    List<TagEntity>? tags,
    List<RecipePreviewEntity>? recipes,
    List<TagEntity>? filterTags,
  }) {
    return MainStateLoaded(
      tags: tags ?? this.tags,
      recipes: recipes ?? this.recipes,
      filterTags: filterTags ?? this.filterTags,
    );
  }
}

class MainStateError extends MainState {
  final Object? err;

  MainStateError({
    required this.err,
  });
}

import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';

sealed class DetailsState {}

class DetailsStateLoading extends DetailsState {}

class DetailsStateLoaded extends DetailsState {
  final RecipeDetailsEntity recipe;

  DetailsStateLoaded({
    required this.recipe,
  });
}

class DetailsStateError extends DetailsState {
  final Object? err;

  DetailsStateError({
    this.err,
  });
}
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

abstract interface class RecipeRepository {
  Future<({List<TagEntity> tags, Object? err})> getTags();

  Future<({List<RecipePreviewEntity> recipePreviews, Object? err})>
      getRecipePreviews(
          {List<TagEntity>? filterTags, String? name, int? budget});

  Future<({RecipeDetailsEntity? recipeDetails, Object? err})> getRecipeDetails(
      {required int id});

  void dispose();
}

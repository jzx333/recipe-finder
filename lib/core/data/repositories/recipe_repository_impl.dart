import 'package:recipe_finder_demo/core/data/data_source/recipe_data_source.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource recipeDataSource;

  const RecipeRepositoryImpl({
    required this.recipeDataSource,
  });

  @override
  Future<({List<TagEntity> tags, Object? err})> getTags() async {
    final r = await recipeDataSource.getTags();
    return (tags: r.tags.map((model) => model.toEntity()).toList(), err: r.err);
  }

  @override
  Future<({List<RecipePreviewEntity> recipePreviews, Object? err})>
      getRecipePreviews() async {
    final r = await recipeDataSource.getRecipePreviews();
    return (
      recipePreviews:
          r.recipePreviews.map((recipe) => recipe.toEntity()).toList(),
      err: r.err,
    );
  }

  @override
  Future<({RecipeDetailsEntity? recipeDetails, Object? err})>
      getRecipeDetails() async {
    final r = await recipeDataSource.getRecipeDetails();
    return (
      recipeDetails: r.recipeDetails?.toEntity(),
      err: r.err,
    );
  }

  @override
  void dispose() {
    recipeDataSource.dispose();
  }
}

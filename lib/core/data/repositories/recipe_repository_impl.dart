import 'package:recipe_finder_demo/core/data/data_source/recipe_data_source.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';
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
      getRecipePreviews(
  {List<TagEntity>? filterTags, String? name, int? budget}) async {

    final r = await recipeDataSource.getRecipePreviews(
      filterTags:  filterTags != null
          ? filterTags.map((e) => TagModel.fromEntity(e)).toList()
          : [],
      name: name,
      budget: budget,
    );

    return (
      recipePreviews:
          r.recipePreviews.map((recipe) => recipe.toEntity()).toList(),
      err: r.err,
    );
  }

  @override
  Future<({RecipeDetailsEntity? recipeDetails, Object? err})> getRecipeDetails(
      {required int id}) async {
    final r = await recipeDataSource.getRecipeDetails(id: id);
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

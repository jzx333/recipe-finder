import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:recipe_finder_demo/core/data/models/recipe_details_model.dart';
import 'package:recipe_finder_demo/core/data/models/recipe_preview_model.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';

abstract interface class RecipeDataSource {
  Future<({List<TagModel> tags, Object? err})> getTags();

  Future<({List<RecipePreviewModel> recipePreviews, Object? err})>
      getRecipePreviews();

  Future<({RecipeDetailsModel? recipeDetails, Object? err})> getRecipeDetails();

  void dispose();
}

class RecipeDataSourceImpl implements RecipeDataSource {
  final http.Client client;

  final ip = "http://100.78.133.102:8080";

  const RecipeDataSourceImpl({
    required this.client,
  });

  @override
  Future<({List<TagModel> tags, Object? err})> getTags() async {
    try {
      final response = await client.get(Uri.parse("$ip/tags"));
      final list = (jsonDecode(response.body) as List)
          .map((json) => TagModel.fromJson(json))
          .toList();
      return (tags: list, err: null);
    } catch (err, st) {
      log("Exception in getTags",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (tags: <TagModel>[], err: err);
    }
  }

  @override
  Future<({List<RecipePreviewModel> recipePreviews, Object? err})>
      getRecipePreviews() async {
    try {
      final response = await client.get(Uri.parse("$ip/small"));
      final list = (jsonDecode(response.body) as List)
          .map((json) => RecipePreviewModel.fromJson(json))
          .toList();
      return (recipePreviews: list, err: null);
    } catch (err, st) {
      log("Exception in getRecipePreviews",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (recipePreviews: <RecipePreviewModel>[], err: err);
    }
  }

  @override
  Future<({RecipeDetailsModel? recipeDetails, Object? err})>
      getRecipeDetails() async {
    try {
      final response = await client.get(Uri.parse("$ip/full"));
      final details = RecipeDetailsModel.fromJson(jsonDecode(response.body));
      return (recipeDetails: details, err: null);
    } catch (err, st) {
      log("Exception in getRecipeDetails",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (recipeDetails: null, err: err);
    }
  }

  @override
  void dispose() {
    client.close();
  }
}

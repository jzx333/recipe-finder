import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:recipe_finder_demo/core/data/models/recipe_details_model.dart';
import 'package:recipe_finder_demo/core/data/models/recipe_preview_model.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';

abstract interface class RecipeDataSource {
  Future<({List<TagModel> tags, Object? err})> getTags();

  Future<({List<RecipePreviewModel> recipePreviews, Object? err})>
      getRecipePreviews({
    List<TagModel> filterTags,
    String? name,
    int? budget,
    int? calories,
    int? time,
  });

  Future<({RecipeDetailsModel? recipeDetails, Object? err})> getRecipeDetails({
    required int id,
  });

  void dispose();
}

class RecipeDataSourceImpl implements RecipeDataSource {
  final http.Client client;

  final ip = "100.78.133.102";
  final port = 8080;

  late final String address;

  RecipeDataSourceImpl({
    required this.client,
  }) {
    address = "http://$ip:$port";
  }

  @override
  Future<({List<TagModel> tags, Object? err})> getTags() async {
    log("getTags", name: runtimeType.toString());
    try {
      final response = await client.get(Uri.parse("$address/tags"));
      final list = (jsonDecode(response.body) as List)
          .map((json) => TagModel.fromJson(json))
          .toList();
      return (tags: list, err: null);

      // return (
      //   tags: [
      //     const TagModel(id: 1, name: "Жареное", emoji: "🔥"),
      //     const TagModel(id: 2, name: "яйца", emoji: "🥚")
      //   ],
      //   err: null,
      // );
    } catch (err, st) {
      log("Exception in getTags",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (tags: <TagModel>[], err: err);
    }
  }

  @override
  Future<({List<RecipePreviewModel> recipePreviews, Object? err})>
      getRecipePreviews({
    List<TagModel>? filterTags,
    String? name,
    int? budget,
    int? calories,
    int? time,
  }) async {
    log("getRecipePreviews", name: runtimeType.toString());
    try {
      final queryParams = <String, dynamic>{};

      if (name != null) {
        queryParams["name"] = name;
      }

      if (budget != null) {
        queryParams["budget"] = budget.toString();
      }

      if (calories != null) {
        queryParams["calories"] = calories.toString();
      }

      if (time != null) {
        queryParams["time"] = time.toString();
      }

      final uri = Uri.http(
        '$ip:$port',
        '/previews',
        queryParams,
      );

      final queryTags = [
        for (final tag in filterTags ?? [])
          'tag=${Uri.encodeQueryComponent(tag.id.toString())}'
      ].join('&');

      var path =
          "${uri.toString()}${queryTags.isNotEmpty ? '&$queryTags' : ''}";

      //return (recipePreviews: <RecipePreviewModel>[], err: null);

      final response = await client.get(Uri.parse(path));
      final list = (jsonDecode(response.body) as List)
          .map((json) => RecipePreviewModel.fromJson(json))
          .toList();
      return (recipePreviews: list, err: null);

      // return (
      //   recipePreviews: [
      //     const RecipePreviewModel(
      //       id: 1,
      //       name: "Паста карбонара",
      //       time: 5,
      //       budget: 60,
      //       tags: "Быстрое",
      //       imgSrc:
      //           "https://upload.wikimedia.org/wikipedia/ru/4/49/%D0%94%D0%BE%D1%88%D0%B8%D1%80%D0%B0%D0%BA_%D0%BB%D0%B0%D0%BF%D1%88%D0%B0.jpg",
      //     ),
      //   ],
      //   err: null,
      // );
    } catch (err, st) {
      log("Exception in getRecipePreviews",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (recipePreviews: <RecipePreviewModel>[], err: err);
    }
  }

  @override
  Future<({RecipeDetailsModel? recipeDetails, Object? err})> getRecipeDetails(
      {required int id}) async {
    log("getRecipeDetails", name: runtimeType.toString());
    try {
      final response = await client.get(Uri.parse("$address/previews/$id"));
      final details = RecipeDetailsModel.fromJson(jsonDecode(response.body));
      return (recipeDetails: details, err: null);
      // return (
      //   recipeDetails: const RecipeDetailsModel(
      //     id: 1,
      //     name: "Дошик",
      //     time: "5",
      //     calories: "200",
      //     budget: "30 руб.",
      //     tags: [
      //       TagModel(name: "Жареное", emoji: "🔥"),
      //     ],
      //     steps: [
      //       StepModel(number: 1, step: "завари бля дошик хуле тут делать"),
      //       StepModel(number: 2, step: "схавай"),
      //       StepModel(number: 3, step: "схавай"),
      //     ],
      //     ingredients: [
      //       IngredientModel(name: "вода", quantity: "5 л.")
      //     ],
      //     imgSrc: "https://upload.wikimedia.org/wikipedia/ru/4/49/%D0%94%D0%BE%D1%88%D0%B8%D1%80%D0%B0%D0%BA_%D0%BB%D0%B0%D0%BF%D1%88%D0%B0.jpg",
      //   ),
      //   err: null,
      // );
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

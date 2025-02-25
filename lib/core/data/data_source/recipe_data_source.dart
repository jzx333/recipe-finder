import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:recipe_finder_demo/core/data/models/ingredient_model.dart';
import 'package:recipe_finder_demo/core/data/models/recipe_details_model.dart';
import 'package:recipe_finder_demo/core/data/models/recipe_preview_model.dart';
import 'package:recipe_finder_demo/core/data/models/step_model.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';

abstract interface class RecipeDataSource {
  Future<({List<TagModel> tags, Object? err})> getTags();

  Future<({List<RecipePreviewModel> recipePreviews, Object? err})>
      getRecipePreviews();

  Future<({RecipeDetailsModel? recipeDetails, Object? err})> getRecipeDetails();

  void dispose();
}

class RecipeDataSourceImpl implements RecipeDataSource {
  final http.Client client;

  final address = "http://100.78.133.102:8080";

  const RecipeDataSourceImpl({
    required this.client,
  });

  @override
  Future<({List<TagModel> tags, Object? err})> getTags() async {
    print("tags");
    try {
      // final response = await client.get(Uri.parse("$address/tags"));
      // final list = (jsonDecode(response.body) as List)
      //     .map((json) => TagModel.fromJson(json))
      //     .toList();
      // return (tags: list, err: null);

      return (
        tags: [
          const TagModel(name: "Жареное", emoji: "🔥"),
          const TagModel(name: "яйца", emoji: "🥚")
        ],
        err: null,
      );
    } catch (err, st) {
      log("Exception in getTags",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (tags: <TagModel>[], err: err);
    }
  }

  @override
  Future<({List<RecipePreviewModel> recipePreviews, Object? err})>
      getRecipePreviews() async {
    print("getRecipePreviews");
    try {
      // final response = await client.get(Uri.parse("$address/small"));
      // final list = (jsonDecode(response.body) as List)
      //     .map((json) => RecipePreviewModel.fromJson(json))
      //     .toList();
      // return (recipePreviews: list, err: null);
      return (
        recipePreviews: [
          const RecipePreviewModel(
            id: 1,
            name: "дошик",
            time: "5",
            budget: "30 руб.",
            tags: [
              TagModel(name: "Жареное", emoji: "🔥"),
            ],
            imgSrc:
                "https://upload.wikimedia.org/wikipedia/ru/4/49/%D0%94%D0%BE%D1%88%D0%B8%D1%80%D0%B0%D0%BA_%D0%BB%D0%B0%D0%BF%D1%88%D0%B0.jpg",
          ),
        ],
        err: null,
      );
    } catch (err, st) {
      log("Exception in getRecipePreviews",
          name: runtimeType.toString(), error: err, stackTrace: st);
      return (recipePreviews: <RecipePreviewModel>[], err: err);
    }
  }

  @override
  Future<({RecipeDetailsModel? recipeDetails, Object? err})>
      getRecipeDetails() async {
    print("getRecipeDetails");
    try {
      // final response = await client.get(Uri.parse("$address/full"));
      // final details = RecipeDetailsModel.fromJson(jsonDecode(response.body));
      // return (recipeDetails: details, err: null);
      return (
        recipeDetails: const RecipeDetailsModel(
          id: 1,
          name: "Дошик",
          time: "5",
          calories: "200",
          budget: "30 руб.",
          tags: [
            TagModel(name: "Жареное", emoji: "🔥"),
          ],
          steps: [
            StepModel(number: 1, step: "завари бля дошик хуле тут делать"),
            StepModel(number: 2, step: "схавай"),
            StepModel(number: 3, step: "схавай"),
          ],
          ingredients: [
            IngredientModel(name: "вода", quantity: "5 л.")
          ],
          imgSrc: "https://upload.wikimedia.org/wikipedia/ru/4/49/%D0%94%D0%BE%D1%88%D0%B8%D1%80%D0%B0%D0%BA_%D0%BB%D0%B0%D0%BF%D1%88%D0%B0.jpg",
        ),
        err: null,
      );
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

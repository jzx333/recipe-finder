import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/data/models/ingredient_model.dart';
import 'package:recipe_finder_demo/core/data/models/step_model.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_details_entity.dart';

part 'recipe_details_model.g.dart';

@JsonSerializable()
class RecipeDetailsModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "calories")
  final String calories;

  @JsonKey(name: "time")
  final String time;

  @JsonKey(name: "budget")
  final String budget;

  @JsonKey(name: "tags")
  final List<TagModel> tags;

  @JsonKey(name: "ingredients")
  final List<IngredientModel> ingredients;

  @JsonKey(name: "steps")
  final List<StepModel> steps;

  @JsonKey(name: "imgsrc")
  final String imgSrc;

  const RecipeDetailsModel({
    required this.id,
    required this.name,
    required this.calories,
    required this.time,
    required this.budget,
    required this.tags,
    required this.ingredients,
    required this.steps,
    required this.imgSrc,
  });

  RecipeDetailsEntity toEntity() {
    return RecipeDetailsEntity(
      id: id,
      name: name,
      calories: calories,
      time: time,
      budget: budget,
      tags: tags.map((tag) => tag.toEntity()).toList(),
      ingredients: ingredients.map((ing) => ing.toEntity()).toList(),
      steps: steps.map((step) => step.toEntity()).toList(),
      imgSrc: imgSrc,
    );
  }

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsModelFromJson(json);
}

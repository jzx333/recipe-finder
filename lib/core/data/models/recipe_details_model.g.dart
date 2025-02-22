// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailsModel _$RecipeDetailsModelFromJson(Map<String, dynamic> json) =>
    RecipeDetailsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      calories: json['calories'] as String,
      time: json['time'] as String,
      budget: json['budget'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => StepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imgSrc: json['imgsrc'] as String,
    );

Map<String, dynamic> _$RecipeDetailsModelToJson(RecipeDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calories': instance.calories,
      'time': instance.time,
      'budget': instance.budget,
      'tags': instance.tags,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'imgsrc': instance.imgSrc,
    };

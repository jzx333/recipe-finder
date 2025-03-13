// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipePreviewModel _$RecipePreviewModelFromJson(Map<String, dynamic> json) =>
    RecipePreviewModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      time: (json['time'] as num).toInt(),
      budget: (json['budget'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imgSrc: json['imgsrc'] as String,
    );

Map<String, dynamic> _$RecipePreviewModelToJson(RecipePreviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.time,
      'budget': instance.budget,
      'tags': instance.tags,
      'imgsrc': instance.imgSrc,
    };

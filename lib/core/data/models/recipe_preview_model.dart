import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

part 'recipe_preview_model.g.dart';

@JsonSerializable()
class RecipePreviewModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "time")
  final int time;

  @JsonKey(name: "budget")
  final int budget;

  @JsonKey(name: "tags")
  final String tags;

  @JsonKey(name: "imgsrc")
  final String imgSrc;

  const RecipePreviewModel({
    required this.id,
    required this.name,
    required this.time,
    required this.budget,
    required this.tags,
    required this.imgSrc,
  });

  RecipePreviewEntity toEntity() {
    return RecipePreviewEntity(
      id: id,
      name: name,
      time: time,
      budget: budget,
      tags: tags.split(", ").map((name) => TagEntity(id: 0, name: name, emoji: "")).toList(),
      imgSrc: imgSrc,
    );
  }

  factory RecipePreviewModel.fromJson(Map<String, dynamic> json) =>
      _$RecipePreviewModelFromJson(json);
}

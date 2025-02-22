import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/data/models/tag_model.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';

part 'recipe_preview_model.g.dart';

@JsonSerializable()
class RecipePreviewModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "time")
  final String time;

  @JsonKey(name: "budget")
  final String budget;

  @JsonKey(name: "tags")
  final List<TagModel> tags;

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
      tags: tags.map((tag) => tag.toEntity()).toList(),
      imgSrc: imgSrc,
    );
  }

  factory RecipePreviewModel.fromJson(Map<String, dynamic> json) =>
      _$RecipePreviewModelFromJson(json);
}

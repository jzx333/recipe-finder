import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

part 'tag_model.g.dart';

@JsonSerializable()
class TagModel {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "emoji")
  final String emoji;

  const TagModel({
    required this.name,
    required this.emoji,
  });

  TagEntity toEntity() {
    return TagEntity(
      name: name,
      emoji: emoji,
    );
  }

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}

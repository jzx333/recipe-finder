import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

class RecipePreviewEntity {
  final int id;
  final String name;
  final String time;
  final String budget;
  final List<TagEntity> tags;
  final String imgSrc;

  const RecipePreviewEntity({
    required this.id,
    required this.name,
    required this.time,
    required this.budget,
    required this.tags,
    required this.imgSrc,
  });

  @override
  String toString() {
    return 'RecipePreviewEntity{id: $id, name: $name, time: $time, budget: $budget, tags: $tags, imgSrc: $imgSrc}';
  }
}

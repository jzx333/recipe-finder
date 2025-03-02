import 'package:recipe_finder_demo/core/domain/entities/ingredient_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/step_entity.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

class RecipeDetailsEntity {
  final int id;
  final String name;
  final int calories;
  final int time;
  final int budget;
  final List<TagEntity> tags;
  final List<IngredientEntity> ingredients;
  final List<StepEntity> steps;
  final String imgSrc;

  const RecipeDetailsEntity({
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

  @override
  String toString() {
    return 'RecipeDetailsEntity{id: $id, name: $name, calories: $calories, time: $time, budget: $budget, tags: $tags, ingredients: $ingredients, steps: $steps, imgSrc: $imgSrc}';
  }
}

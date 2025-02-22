import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/domain/entities/ingredient_entity.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "quantity")
  final String quantity;

  const IngredientModel({
    required this.name,
    required this.quantity,
  });

  IngredientEntity toEntity() {
    return IngredientEntity(
      name: name,
      quantity: quantity,
    );
  }

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
}

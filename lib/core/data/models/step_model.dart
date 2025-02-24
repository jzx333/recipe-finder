import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/domain/entities/step_entity.dart';

part 'step_model.g.dart';

@JsonSerializable()
class StepModel {
  @JsonKey(name: "id")
  final int number;

  @JsonKey(name: "step")
  final String step;

  const StepModel({
    required this.number,
    required this.step,
  });

  StepEntity toEntity() {
    return StepEntity(number: number, step: step);
  }

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);
}

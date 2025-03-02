import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder_demo/core/domain/entities/step_entity.dart';

part 'step_model.g.dart';

@JsonSerializable()
class StepModel {
  @JsonKey(name: "step")
  final int step;

  @JsonKey(name: "text")
  final String text;

  const StepModel({
    required this.step,
    required this.text,
  });

  StepEntity toEntity() {
    return StepEntity(step: step, text: text);
  }

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);
}

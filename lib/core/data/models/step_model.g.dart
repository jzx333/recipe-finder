// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepModel _$StepModelFromJson(Map<String, dynamic> json) => StepModel(
      step: (json['step'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$StepModelToJson(StepModel instance) => <String, dynamic>{
      'step': instance.step,
      'text': instance.text,
    };

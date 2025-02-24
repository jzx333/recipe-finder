// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepModel _$StepModelFromJson(Map<String, dynamic> json) => StepModel(
      number: (json['id'] as num).toInt(),
      step: json['step'] as String,
    );

Map<String, dynamic> _$StepModelToJson(StepModel instance) => <String, dynamic>{
      'id': instance.number,
      'step': instance.step,
    };

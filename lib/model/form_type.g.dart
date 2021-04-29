// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormType _$FormTypeFromJson(Map<String, dynamic> json) {
  return FormType(
    id: json['id'] as int,
    name: json['name'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$FormTypeToJson(FormType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
    };

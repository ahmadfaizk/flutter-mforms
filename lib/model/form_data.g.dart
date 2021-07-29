// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    label: json['label'] as String,
    key: json['key'] as String,
    value: json['value'],
  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
      'label': instance.label,
      'key': instance.key,
      'value': instance.value,
    };

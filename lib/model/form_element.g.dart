// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormElement _$FormElementFromJson(Map<String, dynamic> json) {
  return FormElement(
    id: json['id'] as int,
    label: json['label'] as String,
    key: json['key'] as String,
    placeholder: json['placeholder'] as String?,
    required: json['required'] as bool,
    items: (json['items'] as List<dynamic>)
        .map((e) => Source.fromJson(e as Map<String, dynamic>))
        .toList(),
    formType: FormType.fromJson(json['form_type'] as Map<String, dynamic>),
    maxLength: json['max_length'] as int?,
    minLength: json['min_length'] as int?,
  );
}

Map<String, dynamic> _$FormElementToJson(FormElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'key': instance.key,
      'placeholder': instance.placeholder,
      'required': instance.required,
      'max_length': instance.maxLength,
      'min_length': instance.minLength,
      'items': instance.items,
      'form_type': instance.formType,
    };

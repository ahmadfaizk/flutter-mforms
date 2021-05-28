// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormElement _$ElementFromJson(Map<String, dynamic> json) {
  return FormElement(
    id: json['id'] as int,
    label: json['label'] as String,
    key: json['key'] as String,
    placeholder: json['placeholder'] as String,
    required: json['required'] as bool,
    items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    formType: FormType.fromJson(json['form_type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ElementToJson(FormElement instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'key': instance.key,
      'placeholder': instance.placeholder,
      'required': instance.required,
      'items': instance.items,
      'form_type': instance.formType,
    };

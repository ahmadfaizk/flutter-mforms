// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormDynamic _$FormDynamicFromJson(Map<String, dynamic> json) {
  return FormDynamic(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    canEdit: json['can_edit'] as bool,
    canExpired: json['can_expired'] as bool,
    expiredAt: json['expired_at'] as String?,
    elements: (json['elements'] as List<dynamic>?)
        ?.map((e) => FormElement.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FormDynamicToJson(FormDynamic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'can_edit': instance.canEdit,
      'can_expired': instance.canExpired,
      'expired_at': instance.expiredAt,
      'elements': instance.elements,
    };

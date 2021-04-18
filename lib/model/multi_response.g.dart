// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiResponse<T> _$MultiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return MultiResponse<T>(
    success: json['success'] as bool,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  );
}

Map<String, dynamic> _$MultiResponseToJson<T>(
  MultiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.map(toJsonT).toList(),
    };

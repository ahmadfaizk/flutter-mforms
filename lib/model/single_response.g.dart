// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleResponse<T> _$SingleResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return SingleResponse<T>(
    success: json['success'] as bool,
    message: json['message'] as String,
    data: _$nullableGenericFromJson(json['data'], fromJsonT),
  );
}

Map<String, dynamic> _$SingleResponseToJson<T>(
  SingleResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

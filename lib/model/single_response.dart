import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingleResponse<T> extends Equatable {
  final bool success;
  final String message;
  final T? data;

  const SingleResponse({
    required this.success,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [success, message];

  factory SingleResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJson) =>
      _$SingleResponseFromJson<T>(json, fromJson);

  Map<String, dynamic> toJson(Object? Function(T value) toJson) =>
      _$SingleResponseToJson(this, toJson);
}

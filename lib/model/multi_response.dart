import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'multi_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MultiResponse<T> extends Equatable {
  final bool success;
  final String message;
  final List<T>? data;

  const MultiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [success, message];

  factory MultiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJson) =>
      _$MultiResponseFromJson<T>(json, fromJson);
}

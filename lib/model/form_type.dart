import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_type.g.dart';

@JsonSerializable()
class FormType extends Equatable {
  final int id;
  final String name;
  final String label;

  const FormType({required this.id, required this.name, required this.label});

  @override
  List<Object?> get props => [id];

  factory FormType.fromJson(Map<String, dynamic> json) =>
      _$FormTypeFromJson(json);
}

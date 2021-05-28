import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mforms/model/form_type.dart';

part 'element.g.dart';

@JsonSerializable()
class FormElement extends Equatable {
  final int id;
  final String label;
  final String key;
  final String placeholder;
  final bool required;
  final List<String> items;
  @JsonKey(name: 'form_type')
  final FormType formType;

  const FormElement({
    required this.id,
    required this.label,
    required this.key,
    required this.placeholder,
    required this.required,
    required this.items,
    required this.formType,
  });

  @override
  List<Object?> get props => [id];

  factory FormElement.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

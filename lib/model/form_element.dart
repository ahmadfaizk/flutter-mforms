import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mforms/model/form_type.dart';
import 'package:mforms/model/source.dart';

part 'form_element.g.dart';

@JsonSerializable()
class FormElement extends Equatable {
  final int id;
  final String label;
  final String key;
  final String? placeholder;
  final bool required;
  @JsonKey(name: 'max_length')
  final int? maxLength;
  @JsonKey(name: 'min_length')
  final int? minLength;
  final List<Source> items;
  @JsonKey(name: 'form_type')
  final FormType formType;

  const FormElement({
    required this.id,
    required this.label,
    required this.key,
    this.placeholder,
    required this.required,
    required this.items,
    required this.formType,
    this.maxLength,
    this.minLength,
  });

  @override
  List<Object?> get props => [id];

  factory FormElement.fromJson(Map<String, dynamic> json) =>
      _$FormElementFromJson(json);
}

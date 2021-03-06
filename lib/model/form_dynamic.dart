import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mforms/model/form_data.dart';
import 'package:mforms/model/form_element.dart';

part 'form_dynamic.g.dart';

@JsonSerializable()
class FormDynamic extends Equatable {
  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'can_edit')
  final bool canEdit;
  @JsonKey(name: 'can_expired')
  final bool canExpired;
  @JsonKey(name: 'expired_at')
  final String? expiredAt;
  final List<FormElement>? elements;
  final List<FormData>? data;

  const FormDynamic({
    required this.id,
    required this.name,
    required this.description,
    required this.canEdit,
    required this.canExpired,
    this.expiredAt,
    this.elements,
    this.data,
  });

  @override
  List<Object?> get props => [id];

  factory FormDynamic.fromJson(Map<String, dynamic> json) =>
      _$FormDynamicFromJson(json);
}

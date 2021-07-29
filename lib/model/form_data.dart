import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_data.g.dart';

@JsonSerializable()
class FormData extends Equatable {
  final String label;
  final String key;
  dynamic value;

  FormData({required this.label, required this.key, this.value});

  @override
  List<Object?> get props => [];

  // Map<String, dynamic> toJson() {
  //   return {'label': label, 'key': key, 'value': value};
  // }

  factory FormData.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}

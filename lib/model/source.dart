import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends Equatable {
  final String label;
  final String value;

  const Source({
    required this.label,
    required this.value,
  });

  @override
  List<Object?> get props => [value];

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

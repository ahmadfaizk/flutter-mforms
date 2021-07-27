import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mforms/model/models.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Equatable {
  final int id;
  final String name;
  final String description;
  final User? author;

  const Group({
    required this.id,
    required this.name,
    required this.description,
    required this.author,
  });

  @override
  List<Object?> get props => [id];

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mforms/model/user.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends Equatable {
  final String token;
  final User user;

  const Token({required this.token, required this.user});

  @override
  List<Object?> get props => [token];

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

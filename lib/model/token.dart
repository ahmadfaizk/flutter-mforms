import 'package:equatable/equatable.dart';
import 'package:mforms/model/user.dart';

class Token extends Equatable {
  final String token;
  final User user;

  const Token({required this.token, required this.user});

  @override
  List<Object?> get props => [token];

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token'], user: User.fromJson(json['user']));
  }
}

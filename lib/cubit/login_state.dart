part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Token? token;
  const LoginSuccess({this.token});

  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});

  @override
  List<Object> get props => [message];
}

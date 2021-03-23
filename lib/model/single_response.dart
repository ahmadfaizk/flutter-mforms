import 'package:equatable/equatable.dart';

class SingleResponse<T> extends Equatable {
  final bool success;
  final String message;
  final T? data;

  const SingleResponse({
    required this.success,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [success, message];

  factory SingleResponse.fromJson(Map<String, dynamic> json) {
    return SingleResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FormData extends Equatable {
  final String label;
  final String key;
  dynamic value;

  FormData({required this.label, required this.key, this.value});

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'FormData{label: $label, key: $key, value: $value}';
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'key': key, 'value': value};
  }
}

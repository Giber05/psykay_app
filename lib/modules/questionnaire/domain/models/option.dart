import 'package:equatable/equatable.dart';

class Option extends Equatable {
  final String text;
  final int value;

  Option({
    required this.text,
    required this.value,
  });

  @override
  List<Object?> get props => [text, value];
}
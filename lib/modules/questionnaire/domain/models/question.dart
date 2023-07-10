import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String text;
  final String category;
  final int answer;

  Question({
    required this.text,
    required this.category,
    required this.answer,
  });

  @override
  List<Object?> get props => [text, category, answer];
}

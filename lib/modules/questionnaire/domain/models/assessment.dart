import 'package:equatable/equatable.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/option.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/question.dart';

class Assessment extends Equatable {
  final String fullName;
  final List<Question> questions;
  final List<Option> options;
  final int anxietyScore;
  final int depressionScore;

  Assessment({
    required this.fullName,
    required this.questions,
    required this.options,
    required this.anxietyScore,
    required this.depressionScore,
  });

  @override
  List<Object?> get props => [
        fullName,
        questions,
        options,
        anxietyScore,
        depressionScore,
      ];
}



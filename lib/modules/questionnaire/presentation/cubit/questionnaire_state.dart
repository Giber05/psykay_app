// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'questionnaire_cubit.dart';

abstract class QuestionnaireState extends Equatable {
  const QuestionnaireState();

  @override
  List<Object> get props => [];
}

class QuestionnaireInitial extends QuestionnaireState {}

class QuestionnaireLoading extends QuestionnaireState {}

class QuestionnaireLoaded extends QuestionnaireState {
  final Assessment assessment;
  QuestionnaireLoaded({
    required this.assessment,
  });
}

class QuestionnaireFailed extends QuestionnaireState {
  final String message;
  QuestionnaireFailed({
    required this.message,
  });
}

class SaveAssessmentLoading extends QuestionnaireLoaded {
  SaveAssessmentLoading({required super.assessment});
}
class SaveAssessmentSuccess extends QuestionnaireLoaded {
  SaveAssessmentSuccess({required super.assessment});
}

class SaveAssessmentFailed extends QuestionnaireLoaded {
  final String message;
  SaveAssessmentFailed({required super.assessment, required this.message});
}

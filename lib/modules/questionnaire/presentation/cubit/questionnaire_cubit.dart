// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/architecutre/use_case.dart';
import 'package:psykay_app/infrastructure/types/exceptions/base_exception.dart';
import 'package:psykay_app/infrastructure/types/resource.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';

import 'package:psykay_app/modules/questionnaire/domain/usecases/get_questionnaire.dart';
import 'package:psykay_app/modules/questionnaire/domain/usecases/save_assessment.dart';

part 'questionnaire_state.dart';

@injectable
class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  QuestionnaireCubit(
    this._getQuestionnaire,
    this._saveAssessment,
  ) : super(QuestionnaireInitial());
  final GetQuestionnaire _getQuestionnaire;
  final SaveAssessment _saveAssessment;

  void getQuestionnaire() async {
    emit(QuestionnaireLoading());
    final result = await _getQuestionnaire();
    switch (result) {
      case Success(data: Assessment data):
        emit(QuestionnaireLoaded(assessment: data));
        break;
      case Error(exception: BaseException exception):
        emit(QuestionnaireFailed(message: exception.message));
    }
  }

  void saveAssessment(Assessment assessment) async {
    final currentState = state;
    if (currentState is QuestionnaireLoaded) {
      emit(SaveAssessmentLoading(assessment: currentState.assessment));
      final result =
          await _saveAssessment(SaveAssessmentParams(assessment: assessment));

      switch (result) {
        case Success():
          emit(SaveAssessmentSuccess(assessment: currentState.assessment));
          break;
        case Error(exception: BaseException exception):
          emit(SaveAssessmentFailed(
              message: exception.message, assessment: currentState.assessment));
      }
    }
  }
}

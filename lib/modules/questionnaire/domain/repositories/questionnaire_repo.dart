import 'package:psykay_app/infrastructure/types/nothing.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';

abstract class QuestionnaireRepo {
    Future<Assessment> getQuestionnaire();
  Future<Nothing> saveAssessment(Assessment assessment);
}
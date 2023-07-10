import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/architecutre/use_case.dart';
import 'package:psykay_app/infrastructure/types/nothing.dart';
import 'package:psykay_app/infrastructure/types/resource.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';
import 'package:psykay_app/modules/questionnaire/domain/repositories/questionnaire_repo.dart';

class SaveAssessmentParams {
  final Assessment assessment;

  SaveAssessmentParams({required this.assessment});
}

@injectable
class SaveAssessment extends Usecase<SaveAssessmentParams, Nothing> {
  final QuestionnaireRepo _questionnaireRepo;

  SaveAssessment(this._questionnaireRepo);

  @override
  Future<Resource<Nothing>> execute(SaveAssessmentParams params) =>
      _questionnaireRepo
          .saveAssessment(params.assessment)
          .asResource;
}

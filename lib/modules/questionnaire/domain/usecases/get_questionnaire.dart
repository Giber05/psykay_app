import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/architecutre/use_case.dart';
import 'package:psykay_app/infrastructure/types/resource.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';
import 'package:psykay_app/modules/questionnaire/domain/repositories/questionnaire_repo.dart';

@injectable
class GetQuestionnaire extends UsecaseNoParams<Assessment> {
  final QuestionnaireRepo _questionnaireRepo;

  GetQuestionnaire(this._questionnaireRepo);

  @override
  Future<Resource<Assessment>> execute() async =>
      _questionnaireRepo.getQuestionnaire().asResource;
}

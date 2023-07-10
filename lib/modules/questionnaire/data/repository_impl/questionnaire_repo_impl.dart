import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/client/api_client.dart';
import 'package:psykay_app/infrastructure/types/nothing.dart';
import 'package:psykay_app/modules/questionnaire/data/datasource/remote/questionnaire_remote_dts.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';
import 'package:psykay_app/modules/questionnaire/domain/repositories/questionnaire_repo.dart';

@Injectable(as: QuestionnaireRepo)
class QuestionnaireRepoImpl implements QuestionnaireRepo {
  final QuestionnaireRemoteDts _questionnaireRemoteDts;

  QuestionnaireRepoImpl(this._questionnaireRemoteDts);
  @override
  Future<Assessment> getQuestionnaire() async =>
      _questionnaireRemoteDts.getQuestionnaire().futureData;

  @override
  Future<Nothing> saveAssessment(Assessment assessment) async =>
      _questionnaireRemoteDts.saveAssessment(assessment).futureData;
}

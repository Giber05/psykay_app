import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/client/api_client.dart';
import 'package:psykay_app/infrastructure/types/nothing.dart';
import 'package:psykay_app/modules/questionnaire/data/mapper/remote/response/assessment_remote_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';

abstract class QuestionnaireRemoteDts {
  Future<APIResult<Assessment>> getQuestionnaire();
  Future<APIResult<Nothing>> saveAssessment(Assessment assessment);
}

@Injectable(as: QuestionnaireRemoteDts)
class QuestionnaireRemoteDtsImpl implements QuestionnaireRemoteDts {
  final APIClient _client;
  final AssessmentRemoteResMapper _assessmentMapper =
      AssessmentRemoteResMapper();

  QuestionnaireRemoteDtsImpl(this._client);
  @override
  Future<APIResult<Assessment>> getQuestionnaire() async {
    return await _client.get(
      path: '/check-mental-health',
      mapper: (json) => _assessmentMapper.toModel(json),
      shouldPrint: true,
    );
  }

  @override
  Future<APIResult<Nothing>> saveAssessment(Assessment assessment) async {
    return await _client.post(
      path: '/check-mental-health/save',
      mapper: (json) => const Nothing(),
      shouldPrint: true,
    );
  }
}

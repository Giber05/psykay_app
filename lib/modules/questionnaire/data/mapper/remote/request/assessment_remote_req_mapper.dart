import 'package:psykay_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:psykay_app/modules/questionnaire/data/mapper/remote/request/option_remote_req_mapper.dart';
import 'package:psykay_app/modules/questionnaire/data/mapper/remote/request/question_remote_req_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';

class AssessmentRemoteReqMapper extends ToJSONMapper<Assessment> {
  AssessmentRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {
      "fullName": data.fullName,
      "questions": data.questions.map((e) => QuestionRemoteReqMapper(e).toJSON()).toList(),
      "options": data.options.map((e) => OptionRemoteReqMapper(e).toJSON()).toList(),
      "anxietyScore": data.anxietyScore,
      "depressionScore": data.depressionScore,
    };
  }
}

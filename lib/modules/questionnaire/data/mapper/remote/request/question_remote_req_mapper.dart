import 'package:psykay_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/question.dart';

class QuestionRemoteReqMapper extends ToJSONMapper<Question> {
  QuestionRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {"text": data.text, "category": data.category, "answer": data.answer};
  }
}

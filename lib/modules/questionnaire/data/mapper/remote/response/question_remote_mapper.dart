import 'package:psykay_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/question.dart';

class QuestionRemoteResMapper implements FromJSONMapper<Question> {
  @override
  Question toModel(json) {
    return Question(
        text: json['text'], category: json['category'], answer: json['answer']);
  }
}

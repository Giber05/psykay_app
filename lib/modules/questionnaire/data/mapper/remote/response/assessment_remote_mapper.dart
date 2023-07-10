import 'package:psykay_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:psykay_app/modules/questionnaire/data/mapper/remote/response/option_remote_mapper.dart';
import 'package:psykay_app/modules/questionnaire/data/mapper/remote/response/question_remote_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';

class AssessmentRemoteResMapper implements FromJSONMapper<Assessment> {
  @override
  Assessment toModel(json) {
    final questionsJSON = json['questions'] as List<dynamic>;
    final questions = questionsJSON
        .map((question) => QuestionRemoteResMapper().toModel(question))
        .toList();
    final optionsJSON = json['options'] as List<dynamic>;
    final options = optionsJSON
        .map((option) => OptionRemoteResMapper().toModel(option))
        .toList();

    return Assessment(
        fullName: json['fullName'],
        questions: questions,
        options: options,
        anxietyScore: json['anxietyScore'],
        depressionScore: json['depressionScore']);
  }
}

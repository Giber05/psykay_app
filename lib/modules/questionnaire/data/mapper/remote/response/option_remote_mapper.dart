import 'package:psykay_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/option.dart';

class OptionRemoteResMapper implements FromJSONMapper<Option> {
  @override
  Option toModel(json) {
    return Option(text: json['text'], value: json['value']);
  }
}

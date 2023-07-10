import 'package:psykay_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/option.dart';

class OptionRemoteReqMapper extends ToJSONMapper<Option> {
  OptionRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {"text": data.text, "value": data.value};
  }
}

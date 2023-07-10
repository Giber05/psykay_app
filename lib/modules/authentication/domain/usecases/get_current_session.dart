import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/architecutre/use_case.dart';
import 'package:psykay_app/infrastructure/types/resource.dart';
import 'package:psykay_app/modules/authentication/domain/model/user_session.dart';
import 'package:psykay_app/modules/authentication/domain/repositories/authentication_repo.dart';

@injectable
class GetCurrentSession extends UsecaseNoParams<UserSession?> {
  final AuthenticationRepo _authenticationRepo;

  GetCurrentSession(this._authenticationRepo);

  @override
  Future<Resource<UserSession?>> execute() =>
      _authenticationRepo.getLastLoggedInUser().asResource;
}

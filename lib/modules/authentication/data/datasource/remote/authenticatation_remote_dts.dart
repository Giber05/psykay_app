import 'package:injectable/injectable.dart';
import 'package:psykay_app/infrastructure/client/api_client.dart';
import 'package:psykay_app/modules/authentication/data/mapper/remote/request/login_request_mapper.dart';
import 'package:psykay_app/modules/authentication/data/mapper/remote/response/user_session_remote_mapper.dart';
import 'package:psykay_app/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRemoteDTS {
  Future<APIResult<UserSession>> login(
      {required String username, required String password});

  Future<APIResult<int>> logout(
      {required String username, required String token});
}

@Injectable(as: AuthenticationRemoteDTS)
class AuthenticationRemoteDTSImpl implements AuthenticationRemoteDTS {
  final APIClient _client;

  AuthenticationRemoteDTSImpl(this._client);

  @override
  Future<APIResult<UserSession>> login(
          {required String username, required String password}) =>
      _client.post(
          path: '/Account/Login',
          shouldPrint: true,
          body: LoginRemoteReqMapper((password: password, username: username))
              .toJSON(),
          mapper: (json) => UserSessionRemoteResMapper().toModel(json["data"]));

  @override
  Future<APIResult<int>> logout(
          {required String username, required String token}) =>
      _client.post(
        path: '/logout',
        token: token,
        body: {"username": username},
        mapper: (json) => json["data"]["logoutStatus"],
      );
}

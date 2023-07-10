// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/authentication/data/datasource/local/authentication_local_dts.dart'
    as _i12;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i4;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i14;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i13;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i15;
import '../../modules/authentication/domain/usecases/login.dart' as _i17;
import '../../modules/authentication/domain/usecases/logout.dart' as _i19;
import '../../modules/authentication/presentation/screens/login/cubit/login_cubit.dart'
    as _i18;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i22;
import '../../modules/questionnaire/data/datasource/remote/questionnaire_remote_dts.dart'
    as _i7;
import '../../modules/questionnaire/data/repository_impl/questionnaire_repo_impl.dart'
    as _i9;
import '../../modules/questionnaire/domain/repositories/questionnaire_repo.dart'
    as _i8;
import '../../modules/questionnaire/domain/usecases/get_questionnaire.dart'
    as _i16;
import '../../modules/questionnaire/domain/usecases/save_assessment.dart'
    as _i10;
import '../../modules/questionnaire/presentation/cubit/questionnaire_cubit.dart'
    as _i20;
import '../architecutre/cubits/messenger/messenger_cubit.dart' as _i6;
import '../architecutre/cubits/session/session_cubit.dart' as _i21;
import '../client/api_client.dart' as _i3;
import '../local_storage/secure_storage/secure_storage.dart' as _i11;
import 'modules/core_module.dart' as _i23;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModules = _$CoreModules();
    gh.lazySingleton<_i3.APIClient>(() => _i3.PsykayClient());
    gh.factory<_i4.AuthenticationRemoteDTS>(
        () => _i4.AuthenticationRemoteDTSImpl(gh<_i3.APIClient>()));
    gh.factory<_i5.FlutterSecureStorage>(
        () => coreModules.getFlutterSecureStorage());
    gh.lazySingleton<_i6.MessengerCubit>(() => _i6.MessengerCubit());
    gh.factory<_i7.QuestionnaireRemoteDts>(
        () => _i7.QuestionnaireRemoteDtsImpl(gh<_i3.APIClient>()));
    gh.factory<_i8.QuestionnaireRepo>(
        () => _i9.QuestionnaireRepoImpl(gh<_i7.QuestionnaireRemoteDts>()));
    gh.factory<_i10.SaveAssessment>(
        () => _i10.SaveAssessment(gh<_i8.QuestionnaireRepo>()));
    gh.factory<_i11.SecureStorage>(
        () => _i11.SecureStorageImpl(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i12.AuthenticationLocalDTS>(
        () => _i12.AuthLocalDTSImpl(gh<_i11.SecureStorage>()));
    gh.factory<_i13.AuthenticationRepo>(() => _i14.AuthenticationRepoImpl(
          gh<_i4.AuthenticationRemoteDTS>(),
          gh<_i12.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i15.GetCurrentSession>(
        () => _i15.GetCurrentSession(gh<_i13.AuthenticationRepo>()));
    gh.factory<_i16.GetQuestionnaire>(
        () => _i16.GetQuestionnaire(gh<_i8.QuestionnaireRepo>()));
    gh.factory<_i17.Login>(() => _i17.Login(gh<_i13.AuthenticationRepo>()));
    gh.factory<_i18.LoginCubit>(() => _i18.LoginCubit(gh<_i17.Login>()));
    gh.factory<_i19.Logout>(() => _i19.Logout(gh<_i13.AuthenticationRepo>()));
    gh.factory<_i20.QuestionnaireCubit>(() => _i20.QuestionnaireCubit(
          gh<_i16.GetQuestionnaire>(),
          gh<_i10.SaveAssessment>(),
        ));
    gh.lazySingleton<_i21.SessionCubit>(
        () => _i21.SessionCubit(gh<_i19.Logout>()));
    gh.factory<_i22.SplashCubit>(
        () => _i22.SplashCubit(gh<_i15.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i23.CoreModules {}

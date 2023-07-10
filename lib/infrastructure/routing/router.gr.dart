// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:psykay_app/modules/authentication/presentation/screens/login/login_screen.dart'
    as _i1;
import 'package:psykay_app/modules/authentication/presentation/screens/splash/splash_screen.dart'
    as _i2;
import 'package:psykay_app/modules/home/presentation/screens/home/home_screen.dart'
    as _i3;
import 'package:psykay_app/modules/questionnaire/presentation/questionnaire_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    QuestionnaireRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionnaireRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.QuestionnaireScreen(
          key: args.key,
          name: args.name,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.QuestionnaireScreen]
class QuestionnaireRoute extends _i5.PageRouteInfo<QuestionnaireRouteArgs> {
  QuestionnaireRoute({
    _i6.Key? key,
    required String name,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          QuestionnaireRoute.name,
          args: QuestionnaireRouteArgs(
            key: key,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'QuestionnaireRoute';

  static const _i5.PageInfo<QuestionnaireRouteArgs> page =
      _i5.PageInfo<QuestionnaireRouteArgs>(name);
}

class QuestionnaireRouteArgs {
  const QuestionnaireRouteArgs({
    this.key,
    required this.name,
  });

  final _i6.Key? key;

  final String name;

  @override
  String toString() {
    return 'QuestionnaireRouteArgs{key: $key, name: $name}';
  }
}

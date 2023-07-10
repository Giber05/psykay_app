import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: SplashRoute.page, path: '/splash', initial: false),
        AutoRoute(page: HomeRoute.page, path: '/home', initial: true),
        AutoRoute(
            page: QuestionnaireRoute.page, path: '/questionare', initial: false),
        AutoRoute(
            page: SummaryRoute.page, path: '/summary', initial: false)
      ];
}

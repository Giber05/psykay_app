import 'package:flutter/material.dart';
import 'package:psykay_app/app.dart';
import 'package:psykay_app/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:psykay_app/infrastructure/env/env.dart';
import 'package:psykay_app/infrastructure/routing/router.dart';
import 'package:psykay_app/infrastructure/service_locator/service_locator.dart';

void main() async {
  await configureDependencies();
  PsykayGlobalErrorHandler.setUpErrorHandler();
  ENV.setEnv(ENV.dev);
  runApp(PsykayApp(
    appRouter: AppRouter(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:psykay_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:psykay_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:psykay_app/infrastructure/architecutre/error_handler/global_errror_catcher.dart';
import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/routing/router.dart';
import 'package:psykay_app/infrastructure/service_locator/service_locator.dart';
import 'package:psykay_app/infrastructure/styles/color.dart';
import 'package:psykay_app/infrastructure/styles/text.dart';

class PsykayApp extends StatelessWidget {
  final AppRouter appRouter;
  const PsykayApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessengerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SessionCubit>(),
        ),
      ],
      child: Sizer(builder: (context, _, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          builder: (context, child) {
            return GlobalErrorCatcher(
              child: PsykayMessengerListener(
                child: child,
              ),
              onSessionExpire: () {
                context.messenger.showErrorSnackbar("Session Expired");
                context.logout();
              },
            );
          },
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: ThemeData(
            textTheme: PsykayTextTheme.textTheme,
            colorScheme: PsykayTheme.lightScheme,
          ),
        );
      }),
    );
  }
}

class PsykayMessengerListener extends StatelessWidget {
  final Widget? child;
  const PsykayMessengerListener({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessengerCubit, MessengerState>(
      listener: (context, state) {
        if (state is MessengerIdle) return;
        if (state is MessengerSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: state.backgroundColor(context),
          ));
        }
        context.read<MessengerCubit>().idle();
      },
      child: child,
    );
  }
}

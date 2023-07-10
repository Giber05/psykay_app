import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psykay_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/routing/router.gr.dart';
import 'package:psykay_app/infrastructure/service_locator/service_locator.dart';
import 'package:psykay_app/modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..getLastSession(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccess) {
              context.read<SessionCubit>().setCurrenetUser(state.userSession);
              final route = state.userSession != null
                  ? const HomeRoute()
                  : const LoginRoute();
              context.router.replace(route);
            }
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: double.infinity,
            child: const _PsykayIcon(),
          ),
        ),
      ),
    );
  }
}

class _PsykayIcon extends StatelessWidget {
  const _PsykayIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: context.color.primary,
    );
  }
}

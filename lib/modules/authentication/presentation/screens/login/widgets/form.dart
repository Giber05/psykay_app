part of '../login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              0.verticalSpace,
              const _PsykayIcon(),
              48.verticalSpace,
              Text(
                "Welcome Back",
                style: context.text.titleLarge
                    ?.copyWith(color: context.color.primary, fontSize: 24),
              ),
              34.verticalSpace,
              PsykayTextField(
                controller: cubit.email,
                label: "Email",
              ),
              23.verticalSpace,
              PsykayTextField(
                controller: cubit.password,
                label: "Password",
              ),
              33.verticalSpace,
              PsykayElevatedButton(
                label: "Sign In",
                fillParent: true,
                onPressed: () {
                  context.read<LoginCubit>().login();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PsykayIcon extends StatelessWidget {
  const _PsykayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      color: context.color.primary,
    );
  }
}

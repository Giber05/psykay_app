import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/ext/double_ext.dart';
import 'package:psykay_app/infrastructure/routing/router.gr.dart';
import 'package:psykay_app/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:psykay_app/infrastructure/widgets/form/text_field.dart';
import 'package:psykay_app/modules/authentication/presentation/widgets/logged_in_wrapper.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _HomeScreenContent();
  }
}

class _HomeScreenContent extends StatelessWidget {
  _HomeScreenContent({
    super.key,
  });
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Cek Kesehatan Mentalmu",
              style: context.text.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "Lengkapi informasi dibawah ini",
              style: context.text.bodyMedium,
            ),
            30.verticalSpace,
            PsykayTextField(
              label: 'Nama',
              controller: _controller,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nama Wajib Diisi!' : null,
            ),
            30.verticalSpace,
            PsykayElevatedButton(
              label: "Mulai",
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  context.router
                      .push(QuestionnaireRoute(name: _controller.text));
                }
              },
              fillParent: true,
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/ext/double_ext.dart';
import 'package:psykay_app/infrastructure/routing/router.gr.dart';
import 'package:psykay_app/infrastructure/service_locator/service_locator.dart';
import 'package:psykay_app/infrastructure/widgets/buttons/elevated_button.dart';

import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';
import 'package:psykay_app/modules/questionnaire/presentation/cubit/questionnaire_cubit.dart';

@RoutePage()
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    Key? key,
    required this.assessment,
  }) : super(key: key);
  final Assessment assessment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuestionnaireCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.color.primary,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Halo, ${assessment.fullName}',
                  )
                ],
              ),
            )
          ],
        ),
        body: BlocListener<QuestionnaireCubit, QuestionnaireState>(
          listener: (context, state) {
            if (state is SaveAssessmentSuccess) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        child: Text('Success Save Data'),
                      ),
                    );
                  });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Angka Kecemasan',
                          style: context.text.bodyLarge,
                        ),
                        Card(
                          child: Text(
                            '${assessment.anxietyScore}',
                            style: context.text.titleLarge,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Angka Depresi',
                          style: context.text.bodyLarge,
                        ),
                        Card(
                          child: Text(
                            '${assessment.depressionScore}',
                            style: context.text.titleLarge,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                20.verticalSpace,
                PsykayElevatedButton(
                  label: 'Simpan',
                  fillParent: true,
                  onPressed: () {
                    context
                        .read<QuestionnaireCubit>()
                        .saveAssessment(assessment);
                  },
                ),
                16.verticalSpace,
                PsykayElevatedButton(
                  label: 'Keluar',
                  fillParent: true,
                  onPressed: () {
                    context.router.replaceAll([const HomeRoute()]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

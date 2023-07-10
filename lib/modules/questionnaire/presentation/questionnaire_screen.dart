// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/ext/double_ext.dart';
import 'package:psykay_app/infrastructure/service_locator/service_locator.dart';
import 'package:psykay_app/infrastructure/widgets/loading/circular.dart';
import 'package:psykay_app/modules/questionnaire/presentation/cubit/questionnaire_cubit.dart';
import 'package:psykay_app/modules/questionnaire/presentation/form/step_form.dart';

@RoutePage()
class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuestionnaireCubit>()..getQuestionnaire(),
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
                    'Halo, $name',
                  )
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
            builder: (context, state) {
          if (state is QuestionnaireLoading) {
            return const Center(
              child: PsykayCircularLoading(),
            );
          }
          if (state is QuestionnaireFailed) {
            Center(
              child: Column(
                children: [
                  Text(
                    state.message,
                  ),
                  20.verticalSpace,
                  OutlinedButton(
                      onPressed: () {
                        context.read<QuestionnaireCubit>().getQuestionnaire();
                      },
                      child: const Text('Refresh'))
                ],
              ),
            );
          }
          if (state is QuestionnaireLoaded) {
            return FormStep(assessment: state.assessment,);
          }
         return  const SizedBox();
        },
        
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/ext/double_ext.dart';
import 'package:psykay_app/infrastructure/routing/router.gr.dart';
import 'package:psykay_app/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:psykay_app/infrastructure/widgets/buttons/outlined_button.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/option.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/question.dart';

class FormStep extends StatefulWidget {
  final Assessment assessment;
  final String name;
  const FormStep({
    Key? key,
    required this.assessment,
    required this.name,
  }) : super(key: key);
  @override
  _FormStepState createState() => _FormStepState();
}

class _FormStepState extends State<FormStep> {
  int currentStep = 0;

  List<Question> questions = [];
  List<Option> options = [];
  List<int> selectedChoices = [];

  List<Question> answeredQuestion() {
    // Mengumpulkan jawaban yang dipilih dari setiap langkah
    List<Question> selectedAnswers = [];
    for (int i = 0; i < questions.length; i++) {
      selectedAnswers.add(Question(
          text: questions[i].text,
          category: questions[i].category,
          answer: selectedChoices[i]));
    }

    // Mencetak jawaban yang dipilih ke konsol atau lakukan tindakan lainnya
    print(selectedAnswers);
    return selectedAnswers;

    // Atau jika Anda ingin membersihkan state dan mengulang form setelah submit
  }

  void nextStep() {
    if (currentStep < questions.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void selectChoice(int choice) {
    setState(() {
      selectedChoices[currentStep] = choice;
    });
  }

  @override
  void initState() {
    super.initState();
    questions = widget.assessment.questions;
    options = widget.assessment.options;
    selectedChoices = List<int>.filled(questions.length, 0);
  }

  Score calculateScores() {
    final answeredQuestionList = answeredQuestion();
    int anxietyScore = 0;
    int depressionScore = 0;

    for (int i = 0; i < answeredQuestionList.length; i++) {
      final question = answeredQuestionList[i];
      final answerValue = answeredQuestionList[i].answer;

      if (question.category == 'Kecemasan') {
        anxietyScore += answerValue;
      } else if (question.category == 'Depresi') {
        depressionScore += answerValue;
      }
    }
    return Score(anxietyScore: anxietyScore, depressionScore: depressionScore);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Pertanyaan ${currentStep + 1}/${questions.length}',
            style: context.text.bodyLarge,
          ),
          20.verticalSpace,
          Text(
            questions[currentStep].category,
            style:
                context.text.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.assessment.questions[currentStep].text,
              style: context.text.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var choice in options)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ChoiceButton(
                    text: choice.text,
                    isSelected: selectedChoices[currentStep] == choice.value,
                    onPressed: () => selectChoice(choice.value),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: previousStep,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: context.color.primary,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: context.color.background,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (currentStep == questions.length - 1) {
                    final answeredQ = answeredQuestion();
                    final score = calculateScores();
                    print('Score $score');
                    final assessment = Assessment(
                      fullName: widget.name,
                      questions: answeredQ,
                      options: options,
                      anxietyScore: score.anxietyScore,
                      depressionScore: score.depressionScore,
                    );
                    print('assessment');
                    print(assessment);
                    context.router.push(SummaryRoute(assessment: assessment));
                  }
                  nextStep();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: context.color.primary,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: context.color.background,
                  ),
                ),
              ),
            ],
          ),
          if (currentStep == questions.length - 1)
            PsykayElevatedButton(
              onPressed: answeredQuestion,
              label: 'Simpan',
            )
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  ChoiceButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PsykayElevatedButton(
      onPressed: onPressed,
      backgroundColor: isSelected ? context.color.primary : Colors.grey,
      label: text,
      fillParent: true,
    );
  }
}

class Score {
  final int anxietyScore;
  final int depressionScore;
  Score({
    required this.anxietyScore,
    required this.depressionScore,
  });
}

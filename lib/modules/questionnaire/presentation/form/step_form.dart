// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:psykay_app/infrastructure/ext/ctx_ext.dart';
import 'package:psykay_app/infrastructure/ext/double_ext.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/assessment.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/option.dart';
import 'package:psykay_app/modules/questionnaire/domain/models/question.dart';

class FormStep extends StatefulWidget {
  final Assessment assessment;
  const FormStep({
    Key? key,
    required this.assessment,
  }) : super(key: key);
  @override
  _FormStepState createState() => _FormStepState();
}

class _FormStepState extends State<FormStep> {
  int currentStep = 0;
  List<Map<String, dynamic>> formSteps = [
    {
      'question': 'Pertanyaan 1',
      'choices': ['Pilihan A', 'Pilihan B', 'Pilihan C'],
    },
    {
      'question': 'Pertanyaan 2',
      'choices': ['Pilihan D', 'Pilihan E', 'Pilihan F'],
    },
    {
      'question': 'Pertanyaan 3',
      'choices': ['Pilihan G', 'Pilihan H', 'Pilihan I'],
    },
  ];

  List<Question> questions = [];
  List<Option> options = [];
  List<int> selectedChoices = [];

  void submitForm() {
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
                ChoiceButton(
                  text: choice.text,
                  isSelected: selectedChoices[currentStep] == choice.value,
                  onPressed: () => selectChoice(choice.value),
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
                onTap: nextStep,
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
            ElevatedButton(
              onPressed: submitForm,
              child: Text('Submit'),
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
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}

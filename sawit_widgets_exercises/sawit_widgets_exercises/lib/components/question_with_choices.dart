// AI DOCUMENTATION
// - I don't use any AI tools
// - I use list create for see grid view 2 x 2 example from slide flutter widget part4
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-12

import 'package:flutter/material.dart';
import 'question_choice.dart';

class QuestionWithChoices extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title section
        Expanded(
          flex: 0,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(height: 80.0),
        // Image section
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 3.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // Choices section
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  2,
                  (index) => QuestionChoice(
                    name: choices[index].name,
                    bgColor: choices[index].bgColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  2,
                  (index) => QuestionChoice(
                    name: choices[index + 2].name,
                    bgColor: choices[index + 2].bgColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
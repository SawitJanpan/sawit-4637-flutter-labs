// AI DOCUMENTATION
// - I use chatgpt go tools for research any widget for see example how use GridView.builder
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-01-30

import 'package:flutter/material.dart';
import 'question_choice.dart';
import '../utils/responsive.dart';

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
    return Padding(
      padding: Responsive.getScreenPadding(context),
      child: Column(
        children: [

          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20.0),

          Expanded(
            flex: 1,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20.0),

          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: Responsive.getChildAspectRatio(context),
              ),
              itemCount: choices.length,
              itemBuilder: (context, index) {
                return QuestionChoice(
                  name: choices[index].name,
                  bgColor: choices[index].bgColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
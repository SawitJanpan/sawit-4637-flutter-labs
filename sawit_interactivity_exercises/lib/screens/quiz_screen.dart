// AI DOCUMENTATION
// - I use doccument hint from lab7 for create structure quiz app screen
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widget, state , GridView.builder, LayoutBuilder, and AlertDialog
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';
import '../models/question.dart';
import '../components/question_choice_card.dart';
import 'package:sawit_widgets_exercises/utils/responsive_feed.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<bool>? onAnswer;
  final bool showNextButton;
  final VoidCallback? onNext;

  const QuizScreen({
    super.key,
    required this.question,
    this.onAnswer,
    required this.showNextButton,
    this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;
  bool selectionMade = false;

  void _handleChoiceSelected(int index) {
    if (selectionMade) return;

    final isCorrect = widget.question.choices[index].isCorrect;

    setState(() {
      selectedIndex = index;
      selectionMade = true;
    });

    widget.onAnswer?.call(isCorrect);
  }

  EdgeInsets _getScreenPadding(double width) {
    if (Responsive.isMobile(width)) {
      return const EdgeInsets.all(12);
    } else if (Responsive.isTablet(width)) {
      return const EdgeInsets.all(20);
    } else {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 20);
    }
  }

  Widget _buildPortraitLayout(BuildContext context, double screenWidth) {
    final q = widget.question;

    return Column(
      children: [
        Text(
          q.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        Expanded(
          flex: 1,
          child: Image.asset(
            q.imagePath,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          flex: 2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: q.choices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.0,
            ),
            itemBuilder: (context, index) {
              final choice = q.choices[index];

              return QuestionChoiceCard(
                choice: choice,
                isSelected: selectedIndex == index,
                canSelect: !selectionMade,
                onSelected: () => _handleChoiceSelected(index),
              );
            },
          ),
        ),

        if (selectionMade && widget.showNextButton)
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: ElevatedButton(
              onPressed: widget.onNext,
              child: const Text("Next"),
            ),
          ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, double screenWidth) {
    final q = widget.question;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final availableWidth = constraints.maxWidth;

        const titleHeight = 30.0;
        const spacing = 8.0;

        final contentHeight = availableHeight - titleHeight - spacing * 2;

        final imageHeight = contentHeight * 0.35;
        final choicesHeight = contentHeight - imageHeight;

        const gridPadding = 8.0;
        const gridSpacing = 8.0;

        final cellWidth =
            (availableWidth - gridPadding * 2 - gridSpacing) / 2;
        final cellHeight =
            (choicesHeight - gridPadding * 2 - gridSpacing) / 2;

        final aspectRatio =
            cellHeight > 0 ? cellWidth / cellHeight : 2.0;

        return Column(
          children: [
            SizedBox(
              height: titleHeight,
              child: Center(
                child: Text(
                  q.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: spacing),

            SizedBox(
              height: imageHeight,
              child: Image.asset(
                q.imagePath,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: spacing),

            SizedBox(
              height: choicesHeight,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(gridPadding),
                itemCount: q.choices.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: gridSpacing,
                  crossAxisSpacing: gridSpacing,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) {
                  final choice = q.choices[index];

                  return QuestionChoiceCard(
                    choice: choice,
                    isSelected: selectedIndex == index,
                    canSelect: !selectionMade,
                    onSelected: () => _handleChoiceSelected(index),
                  );
                },
              ),
            ),

            if (selectionMade && widget.showNextButton)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: widget.onNext,
                  child: const Text("Next"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Padding(
      padding: _getScreenPadding(screenWidth),
      child: orientation == Orientation.portrait
          ? _buildPortraitLayout(context, screenWidth)
          : _buildLandscapeLayout(context, screenWidth),
    );
  }
}

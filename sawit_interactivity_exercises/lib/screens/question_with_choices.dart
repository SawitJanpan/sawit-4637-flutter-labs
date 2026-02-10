// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widget, state , GridView.builder, LayoutBuilder, and AlertDialog
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';
import 'package:sawit_widgets_exercises/utils/responsive_feed.dart';
import '../components/question_choice.dart';

class ChoiceData {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final bool correct;

  const ChoiceData({
    required this.name,
    required this.bgColor,
    required this.fgColor,
    this.correct = false,
  });
}

class QuestionWithChoices extends StatefulWidget {
  final String title;
  final String imagePath;
  final List<ChoiceData> choices;

  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
  });

  @override
  State<QuestionWithChoices> createState() => _QuestionWithChoicesState();
}

class _QuestionWithChoicesState extends State<QuestionWithChoices> {
  int _score = 0;

  void _onAnswerSelected(bool isCorrect, String choiceName) {
    setState(() {
      _score = 0;
      if (isCorrect) {
        _score++;
      }
    });

    _showResultDialog(isCorrect, choiceName);
  }

  void _showResultDialog(bool isCorrect, String choiceName) {
    final colorScheme = Theme.of(context).colorScheme;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isCorrect ? 'Correct!' : 'Incorrect!',
                  style: TextStyle(
                    color: isCorrect ? Colors.green : colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      'Your score is $_score',
                      style: TextStyle(
                        color: colorScheme.onPrimaryContainer,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  EdgeInsets _getScreenPadding(double width) {
    if (Responsive.isMobile(width)) {
      return const EdgeInsets.all(12.0);
    } else if (Responsive.isTablet(width)) {
      return const EdgeInsets.all(20.0);
    } else {
      return const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0);
    }
  }

  Widget _buildPortraitLayout(BuildContext context, double screenWidth) {
    return Column(
      children: [
        Center(
          child: Text(
            widget.title,
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
            widget.imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20.0),

        Expanded(
          flex: 2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.0,
            ),
            itemCount: widget.choices.length,
            itemBuilder: (context, index) {
              final choice = widget.choices[index];
              return QuestionChoice(
                name: choice.name,
                bgColor: choice.bgColor,
                fgColor: choice.fgColor,
                correct: choice.correct,
                onAnswerSelected: (isCorrect) {
                  _onAnswerSelected(isCorrect, choice.name);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, double screenWidth) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final availableWidth = constraints.maxWidth;

        final titleHeight = 30.0;
        final spacing = 8.0;

        final contentHeight = availableHeight - titleHeight - (spacing * 2);

        final imageHeight = contentHeight * 0.35;
        final choicesHeight = contentHeight - imageHeight;

        final gridPadding = 8.0;
        final gridSpacing = 8.0;
        final cellWidth = (availableWidth - gridPadding * 2 - gridSpacing) / 2;
        final cellHeight = (choicesHeight - gridPadding * 2 - gridSpacing) / 2;
        final aspectRatio = cellWidth / cellHeight;

        return Column(
          children: [
            SizedBox(
              height: titleHeight,
              child: Center(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: spacing),

            SizedBox(
              height: imageHeight,
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: spacing),

            SizedBox(
              height: choicesHeight,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(gridPadding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: gridSpacing,
                  crossAxisSpacing: gridSpacing,
                  childAspectRatio: aspectRatio > 0 ? aspectRatio : 2.0,
                ),
                itemCount: widget.choices.length,
                itemBuilder: (context, index) {
                  final choice = widget.choices[index];
                  return QuestionChoice(
                    name: choice.name,
                    bgColor: choice.bgColor,
                    fgColor: choice.fgColor,
                    correct: choice.correct,
                    onAnswerSelected: (isCorrect) {
                      _onAnswerSelected(isCorrect, choice.name);
                    },
                  );
                },
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

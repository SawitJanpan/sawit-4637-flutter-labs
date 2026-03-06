// AI DOCUMENTATION
// - I use doccument hint from lab7 for create structure quiz app screen
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widget, state , GridView.builder, LayoutBuilder, and AlertDialog
// - Updated to use lifted state from parent with didUpdateWidget lifecycle hint from lab10 Quiz App with Navigation
// @author Sawit Janpan
// @version 2.0.0
// @date 2026-03-06

import 'package:flutter/material.dart';
import 'package:sawit_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

/// Helper class for responsive breakpoints
class Responsive {
  static bool isMobile(double width) => width < 600;
  static bool isTablet(double width) => width >= 600 && width < 1200;
  static bool isDesktop(double width) => width >= 1200;
}

/// Reusable QuizScreen widget that renders any question based on data it receives.
/// All state is lifted to parent - this widget receives data and callbacks via props.
class QuizScreen extends StatefulWidget {
  final Question question;
  final int? initialSelectedIndex; // Passed from parent's selected answers map
  final bool isInitiallyAnswered; // Passed from parent's answered flag map
  final ValueChanged<int>? onChoiceSelected; // Callback with choice index
  final bool showNextButton;
  final VoidCallback? onNext;
  final bool showPreviousButton;
  final VoidCallback? onPrevious;

  const QuizScreen({
    super.key,
    required this.question,
    this.initialSelectedIndex,
    this.isInitiallyAnswered = false,
    this.onChoiceSelected,
    required this.showNextButton,
    this.onNext,
    this.showPreviousButton = false,
    this.onPrevious,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    // Initialize from parent state
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(covariant QuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update state when navigating to a different question
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  void _handleChoiceSelected(int index) {
    // Always allow selection changes (canSelect: true always)
    setState(() {
      selectedIndex = index;
    });

    // Notify parent of the selection
    widget.onChoiceSelected?.call(index);
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
                canSelect: true, // Always allow selection changes
                onSelected: () => _handleChoiceSelected(index),
              );
            },
          ),
        ),

        if (widget.showPreviousButton || (selectedIndex != null && widget.showNextButton))
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.showPreviousButton)
                  ElevatedButton(
                    onPressed: widget.onPrevious,
                    child: const Text("Previous"),
                  ),
                if (widget.showPreviousButton && selectedIndex != null && widget.showNextButton)
                  const SizedBox(width: 16),
                if (selectedIndex != null && widget.showNextButton)
                  ElevatedButton(
                    onPressed: widget.onNext,
                    child: const Text("Next"),
                  ),
              ],
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
                    canSelect: true, // Always allow selection changes
                    onSelected: () => _handleChoiceSelected(index),
                  );
                },
              ),
            ),

            if (widget.showPreviousButton || (selectedIndex != null && widget.showNextButton))
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.showPreviousButton)
                      ElevatedButton(
                        onPressed: widget.onPrevious,
                        child: const Text("Previous"),
                      ),
                    if (widget.showPreviousButton && selectedIndex != null && widget.showNextButton)
                      const SizedBox(width: 16),
                    if (selectedIndex != null && widget.showNextButton)
                      ElevatedButton(
                        onPressed: widget.onNext,
                        child: const Text("Next"),
                      ),
                  ],
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

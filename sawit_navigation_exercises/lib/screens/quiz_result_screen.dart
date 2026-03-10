// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use
// - ResultsScreen widget for displaying quiz results
// - Stateless widget that receives data from parent via constructor
// - Shows score header, question summary cards, and restart button
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-03-10

import 'package:flutter/material.dart';
import 'package:sawit_interactivity_exercises/models/question.dart';

/// Stateless ResultsScreen widget that displays quiz results
/// Receives all data via constructor - no internal state
class QuizResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, int?> selectedAnswers;
  final int score;
  final VoidCallback? onRestart;

  const QuizResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
    this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Score header container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      "Your Score",
                      style: textTheme.headlineMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$score / ${questions.length}",
                      style: textTheme.displayLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Question summary list
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final selectedIndex = selectedAnswers[index];
                    
                    // Find the correct choice
                    final correctChoice = question.choices.firstWhere(
                      (choice) => choice.isCorrect,
                    );
                    
                    // Determine answer feedback text and color
                    String subtitleText;
                    Color subtitleColor;
                    
                    if (selectedIndex == null) {
                      // User did not answer
                      subtitleText = "Not answered - Correct: ${correctChoice.name}";
                      subtitleColor = Colors.orange;
                    } else {
                      final answerChoice = question.choices[selectedIndex];
                      if (answerChoice.isCorrect) {
                        // Correct answer
                        subtitleText = "${correctChoice.name} ✓";
                        subtitleColor = Colors.green;
                      } else {
                        // Wrong answer
                        subtitleText = "${answerChoice.name} x Should be ${correctChoice.name}";
                        subtitleColor = Colors.red;
                      }
                    }
                    
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: correctChoice.displayColor,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          question.title,
                          style: textTheme.titleLarge,
                        ),
                        subtitle: Text(
                          subtitleText,
                          style: textTheme.titleLarge?.copyWith(
                            color: subtitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Restart button
              ElevatedButton(
                onPressed: () {
                  onRestart?.call();
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("Restart"),
              ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

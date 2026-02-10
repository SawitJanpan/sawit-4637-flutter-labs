// AI DOCUMENTATION
// - I use doccument hint from lab7 for create list of choices quiz app
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';
import 'screens/question_with_choices.dart';

void main() {
  const String appTitle = 'Quiz App by 653040463-7';
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const QuizHomePage(appTitle: appTitle),
    ),
  );
}

class QuizHomePage extends StatelessWidget {
  final String appTitle;

  const QuizHomePage({super.key, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(appTitle),
        ),
      ),
      body: SafeArea(
        child: QuestionWithChoices(
          title: 'Where is this picture?',
          imagePath: 'assets/images/enkku.jpg',
          choices: [
            ChoiceData(
              name: "Chiang Mai University",
              bgColor: Colors.purpleAccent,
              fgColor: colorScheme.onSurface,
              correct: false,
            ),
            ChoiceData(
              name: "Khon Kaen University",
              bgColor: Colors.orangeAccent,
              fgColor: colorScheme.onSurface,
              correct: true,
            ),
            ChoiceData(
              name: "Chulalongkorn University",
              bgColor: Colors.pinkAccent,
              fgColor: colorScheme.onSurface,
              correct: false,
            ),
            ChoiceData(
              name: "Mahidol University",
              bgColor: Colors.blueAccent,
              fgColor: colorScheme.onSurface,
              correct: false,
            ),
          ],
        ),
      ),
    );
  }
}
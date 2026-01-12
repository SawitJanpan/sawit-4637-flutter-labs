// AI DOCUMENTATION
// - I don't use any AI tools
// - I use example code from excersie lab 5 exercise1: Question App from slide Stateful Widget
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-12

import 'package:flutter/material.dart';
import 'package:sawit_widgets_exercises/components/question_choice.dart';
import 'components/question_with_choices.dart';

void main() {
  const String appTitle = 'Quiz App by 653040463-7';
  runApp(
    MaterialApp(
      // Remove debug banner as required
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
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(appTitle), // Add AppBar with title
          ),
        ),
        body: const QuestionWithChoices(
          title: 'Where is this picture?',
          imagePath: 'assets/images/enkku.jpg',
          choices: [
            QuestionChoice(
              name: "Chiang Mai University",
              bgColor: Colors.purpleAccent,
            ),
            QuestionChoice(
              name: "Khonkaen University",
              bgColor: Colors.orangeAccent,
            ),
            QuestionChoice(
              name: "Chulaongkorn University",
              bgColor: Colors.pinkAccent,
            ),
            QuestionChoice(
              name: "Mahidol University",
              bgColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    ),
  );
}

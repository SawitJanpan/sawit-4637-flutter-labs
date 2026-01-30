// AI DOCUMENTATION
// - I use chatgpt go tools for research any widget for see example how use SafeArea
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-01-30

import 'package:flutter/material.dart';
import 'components/question_choices_responsive.dart';
import 'components/question_choice.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(appTitle),
          ),
        ),
        body: SafeArea(
          child: const QuestionWithChoices(
            title: 'Where is this picture?',
            imagePath: 'assets/images/enkku.jpg',
          choices: [
            QuestionChoice(
              name: "Chiang Mai University",
              bgColor: Colors.purpleAccent,
            ),
            QuestionChoice(
              name: "Khon Kaen University",
              bgColor: Colors.orangeAccent,
            ),
            QuestionChoice(
              name: "Chulalongkorn University",
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
    ),
  );
}
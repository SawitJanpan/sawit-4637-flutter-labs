// AI DOCUMENTATION
// - I use doccument hint from lab7 for strucuture quiz app with next button
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widget, state , AlertDialog
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';
import 'models/question.dart';
import 'models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
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
      home: const QuizApp(),
    ),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool questionAnswered = false;
  int resetCounter = 0;

  late final List<Question> questions = [
    Question(
      title: "Where is this place?",
      imagePath: "assets/images/enkku.jpg",
      choices: [
        Choice(name: "Chiang Mai University", isCorrect: false, displayColor: Colors.purple),
        Choice(name: "Khon Kaen University", isCorrect: true, displayColor: Colors.orange),
        Choice(name: "Chulalongkorn University", isCorrect: false, displayColor: Colors.pinkAccent),
        Choice(name: "Mahidol University", isCorrect: false, displayColor: Colors.blueAccent),
      ],
    ),
    Question(
      title: "บุคคลนี้คือใคร?",
      imagePath: "assets/images/ann.jpg",
      choices: [
        Choice(name: "แอนนา พูลลาภ", isCorrect: false, displayColor: Colors.purple),
        Choice(name: "แอน ทองประสม", isCorrect: true, displayColor: Colors.orange),
        Choice(name: "แอนนี่ ไททันหญิง", isCorrect: false, displayColor: Colors.pinkAccent),
        Choice(name: "แอนๆๆๆ แอ๊น แอ๋น แอ้น", isCorrect: false, displayColor: Colors.blueAccent),
      ],
    ),
  ];

  void _handleAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) score++;
      questionAnswered = true;
    });
  }

  void _handleNext() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questionAnswered = false;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed!"),
        content: Text("Your score: $score / ${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                questionAnswered = false;
                resetCounter++;
              });
            },
            child: const Text("Restart Quiz"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Quiz App by 653040463-7"), centerTitle: true),
        body: QuizScreen(
          key: ValueKey('${currentQuestionIndex}_$resetCounter'),
          question: questions[currentQuestionIndex],
          onAnswer: _handleAnswer,
          showNextButton: questionAnswered,
          onNext: _handleNext,
        ),
      );
  }
}

// AI DOCUMENTATION
// - I use claude Haiku 4.5 for research any widget for see example how use like stateful widget, state , AlertDialog, and Provider package for state management
// - Main entry point for the Preferences Quiz App
// - Wraps MaterialApp with ChangeNotifierProvider for state management
// - Theme mode is driven by QuizPreferencesState
// - Supports named routes for navigation
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-03-15

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawit_interactivity_exercises/models/question.dart';
import 'package:sawit_interactivity_exercises/models/choice.dart';
import 'states/quiz_preferences_state.dart';
import 'screens/quiz_screen_home.dart';
import 'screens/settings_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizPreferencesState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Preferences App',
      themeMode: prefs.themeMode,
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
      home: const QuizCoverScreen(),
      routes: {
        '/quiz': (context) => const QuizAppContainer(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

/// Quiz cover/home screen where user can start the quiz
class QuizCoverScreen extends StatelessWidget {
  const QuizCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.quiz_outlined,
                    size: 120,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Welcome to the Quiz App SJ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "By Sawit Janpan 653040463-7",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text("Start"),
            ),
          ),
        ],
      ),
    );
  }
}

/// Quiz app container that manages quiz state and navigation
class QuizAppContainer extends StatefulWidget {
  const QuizAppContainer({super.key});

  @override
  State<QuizAppContainer> createState() => _QuizAppContainerState();
}

class _QuizAppContainerState extends State<QuizAppContainer> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int?> selectedAnswers = {};
  Map<int, bool> answeredFlags = {};
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
        Choice(name: "แอนๆๆๆ แอ๊น แอ็น แอ้น", isCorrect: false, displayColor: Colors.blueAccent),
      ],
    ),
    Question(
      title: "Where is this place?",
      imagePath: "assets/images/angkaew.jpg",
      choices: [
        Choice(name: "อ่างแก้ว มช.", isCorrect: true, displayColor: Colors.purple),
        Choice(name: "บึงหนองแวง กังสดาล", isCorrect: false, displayColor: Colors.orange),
        Choice(name: "สระพลาสติก มข.", isCorrect: false, displayColor: Colors.pinkAccent),
        Choice(name: "บึงสีฐาน มข.", isCorrect: false, displayColor: Colors.blueAccent),
      ],
    ),
  ];

  void _handleChoiceSelected(int choiceIndex) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = choiceIndex;
      answeredFlags[currentQuestionIndex] = true;
      _recalculateScore();
    });
  }

  void _recalculateScore() {
    int newScore = 0;
    for (int i = 0; i < questions.length; i++) {
      final selectedIndex = selectedAnswers[i];
      if (selectedIndex != null) {
        if (questions[i].choices[selectedIndex].isCorrect) {
          newScore++;
        }
      }
    }
    score = newScore;
  }

  void _handleNext() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResultDialog();
    }
  }

  void _handlePrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _showResultDialog() {
    _recalculateScore();
    
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed!"),
        content: Text("Your score: $score / ${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _restartQuiz();
            },
            child: const Text("Restart Quiz"),
          )
        ],
      ),
    );
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      selectedAnswers = {};
      answeredFlags = {};
      resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final isAnswered = answeredFlags[currentQuestionIndex] ?? false;
    final selectedIndex = selectedAnswers[currentQuestionIndex];
    final isFirstQuestion = currentQuestionIndex == 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 653040463-7'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: QuizScreenHome(
        key: ValueKey(resetCounter),
        question: currentQuestion,
        initialSelectedIndex: selectedIndex,
        isInitiallyAnswered: isAnswered,
        onChoiceSelected: _handleChoiceSelected,
        showNextButton: isAnswered,
        onNext: _handleNext,
        showPreviousButton: !isFirstQuestion,
        onPrevious: _handlePrevious,
      ),
    );
  }
}

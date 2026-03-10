// AI DOCUMENTATION
// - I use doccument hint from lab10 for create structure quiz app screen
// - I use chatgpt 5.2 for research any widget for see example how use
// - Extended quiz app with cover page, named routes, and ResultsScreen
// - Uses Navigator.push() to navigate to ResultsScreen instead of AlertDialog
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-03-10

import 'package:flutter/material.dart';
import 'package:sawit_interactivity_exercises/models/question.dart';
import 'package:sawit_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen_home.dart';
import 'screens/quiz_result_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(),
        '/quiz': (context) => const QuizApp(),
      },
    ),
  );
}

/// Cover page widget displaying welcome message and Start button
class QuizCoverPage extends StatelessWidget {
  const QuizCoverPage({super.key});

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

/// Quiz manager widget that handles quiz state and navigation
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // Lifted state: all quiz state managed in parent
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int?> selectedAnswers = {}; // Track per-question selections
  Map<int, bool> answeredFlags = {}; // Track per-question answered status
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

  /// Handle choice selection with score recalculation on re-answer
  void _handleChoiceSelected(int choiceIndex) {
    setState(() {
      // Store the selection for this question
      selectedAnswers[currentQuestionIndex] = choiceIndex;
      answeredFlags[currentQuestionIndex] = true;
      
      // Recalculate score based on all current selections
      _recalculateScore();
    });
  }

  /// Recalculate score on every re-answer by checking all selections
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
      // Navigate to ResultsScreen instead of showing AlertDialog
      _recalculateScore();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            questions: questions,
            selectedAnswers: selectedAnswers,
            score: score,
            onRestart: _restartQuiz,
          ),
        ),
      );
    }
  }

  void _handlePrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  /// Reset all state and use ValueKey to force fresh State object
  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      selectedAnswers = {}; // Clear all selections
      answeredFlags = {}; // Clear all answered flags
      resetCounter++; // Increment to force new State via ValueKey
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
        title: const Text("Quiz App by 653040463-7"),
        centerTitle: true,
      ),
      body: QuizScreenHome(
        // ValueKey forces Flutter to create fresh State when quiz restarts
        key: ValueKey(resetCounter),
        question: currentQuestion,
        initialSelectedIndex: selectedIndex,
        isInitiallyAnswered: isAnswered,
        onChoiceSelected: _handleChoiceSelected,
        showNextButton: true,
        onNext: _handleNext,
        showPreviousButton: !isFirstQuestion,
        onPrevious: _handlePrevious,
      ),
    );
  }
}

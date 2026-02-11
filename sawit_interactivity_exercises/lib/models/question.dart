// AI DOCUMENTATION
// - I use doccument hint from lab7 for copy structure model question
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'choice.dart';

class Question {
  final String title;
  final String imagePath;
  final List<Choice> choices;
  
  const Question({
    required this.title,
    required this.imagePath,
    required this.choices,
  });
}

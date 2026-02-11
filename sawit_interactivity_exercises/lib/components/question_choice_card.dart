// AI DOCUMENTATION
// - I use doccument hint from lab7 for structure question choice card component
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widget, state , GestureDetector, and Container
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';
import '../models/choice.dart';

class QuestionChoiceCard extends StatefulWidget {
  final Choice choice;
  final bool isSelected;
  final bool canSelect;
  final VoidCallback onSelected;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.canSelect,
    required this.onSelected,
  });

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  @override
  Widget build(BuildContext context) {
    Color bgColor;

    if (widget.isSelected) {
      bgColor = widget.choice.isCorrect ? Colors.green : Colors.red;
    } else {
      bgColor = widget.choice.displayColor;
    }

    return GestureDetector(
      onTap: widget.canSelect ? widget.onSelected : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Center(
          child: Text(
            widget.choice.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widget, GestureDetector 
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';

class QuestionChoice extends StatefulWidget {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final bool correct;
  final void Function(bool isCorrect)? onAnswerSelected;

  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    required this.fgColor,
    this.correct = false,
    this.onAnswerSelected,
  });

  @override
  State<QuestionChoice> createState() => _QuestionChoiceState();
}

class _QuestionChoiceState extends State<QuestionChoice> {
  bool _isTapped = false;

  void _onTap() {
    if (_isTapped) return;
    
    setState(() {
      _isTapped = true;
    });
    
    widget.onAnswerSelected?.call(widget.correct);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    Color backgroundColor;
    Color textColor;
    
    if (_isTapped) {
      if (widget.correct) {
        backgroundColor = Colors.green;
        textColor = Colors.white;
      } else {
        backgroundColor = colorScheme.error;
        textColor = colorScheme.onError;
      }
    } else {
      backgroundColor = widget.bgColor;
      textColor = widget.fgColor;
    }

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.name,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
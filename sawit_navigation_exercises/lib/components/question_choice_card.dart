// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use 
// - Updated to use deferred feedback pattern with primaryContainer highlight
// - canSelect is always true to allow answer changes
// @author Sawit Janpan
// @version 2.0.0
// @date 2026-03-06

import 'package:flutter/material.dart';
import 'package:sawit_interactivity_exercises/models/choice.dart';

class QuestionChoiceCard extends StatefulWidget {
  final Choice choice;
  final bool isSelected;
  final bool canSelect;
  final VoidCallback onSelected;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    this.canSelect = true, // Always allow selection by default
    required this.onSelected,
  });

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    // Deferred feedback pattern: show primaryContainer highlight on selection
    // without revealing correct/incorrect answers immediately
    Color bgColor;
    Color textColor;

    if (widget.isSelected) {
      // Use primaryContainer for selected state (deferred feedback)
      bgColor = colorScheme.primaryContainer;
      textColor = colorScheme.onPrimaryContainer;
    } else {
      // Use the choice's display color for unselected state
      bgColor = widget.choice.displayColor;
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: widget.canSelect ? widget.onSelected : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,),
        child: Center(
            child: Text(
              widget.choice.name,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// AI DOCUMENTATION
// - I don't use any AI tools
// - I use slide Stateful Widget for fgcolor auto change base on bgcolor example code 
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-12

import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color? fgColor;

  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = fgColor ??
        (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? Colors.white
            : Colors.black);

    return Container(
      width: 150,
      height: 60,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
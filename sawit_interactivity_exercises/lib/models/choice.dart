// AI DOCUMENTATION
// - I use doccument hint from lab7 for copy structure model choice
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-11

import 'package:flutter/material.dart';

class Choice {
  final String name;
  final bool isCorrect;
  final Color displayColor;
  
  const Choice({
    required this.name,
    required this.isCorrect,
    required this.displayColor,
  });
}

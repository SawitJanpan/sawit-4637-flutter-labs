// AI DOCUMENTATION
// - I use chatgpt go tools for research any widget for see example how use MediaQuery
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-01-30

import 'package:flutter/material.dart';

class Responsive {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return const EdgeInsets.all(16.0);
    } else {
      return const EdgeInsets.all(8.0);
    }
  }

  static double getChildAspectRatio(BuildContext context) {
    if (isPortrait(context)) {
      return 2.5;
    } else {
      return 8;
    }
  }
}
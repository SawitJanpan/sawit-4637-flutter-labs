// AI DOCUMENTATION
// - I don't use any AI tools
// - I use example code from example code from slide Stateful Widget page 102
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-14

import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final Color defaultColor;
  final Color ratingColor;

  const Ratings({
    super.key,
    required this.defaultColor,
    required this.ratingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: defaultColor),
      ],
    );
  }
}
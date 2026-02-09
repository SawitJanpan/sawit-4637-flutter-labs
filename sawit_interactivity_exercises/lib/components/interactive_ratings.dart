// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use like stateful widgetq
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-09

import 'package:flutter/material.dart';

class InteractiveRatings extends StatefulWidget {

  final int totalStars;

  final double starSize;

  final double spacing;

  final Color activeColor;

  final Color inactiveColor;

  const InteractiveRatings({
    super.key,
    this.totalStars = 5,
    this.starSize = 24.0,
    this.spacing = 4.0,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {

  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.totalStars, (index) {
        final bool isActive = index < _rating;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_rating == index + 1) {
                  _rating = 0;
                } else {
                  _rating = index + 1;
                }
              });
            },
            child: Icon(
              isActive ? Icons.star : Icons.star_border,
              size: widget.starSize,
              color: isActive ? widget.activeColor : widget.inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}

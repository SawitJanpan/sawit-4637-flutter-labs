// AI DOCUMENTATION
// - I use sawit_widgets_exercises for same code interactive rating widget and make it save state to shared_preferences
// - I use chatgpt 5.2 for research any widget for see example how use
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-24

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InteractiveRatings extends StatefulWidget {
  final SharedPreferencesWithCache prefs;

  final int totalStars;

  final double starSize;

  final double spacing;

  final Color activeColor;

  final Color inactiveColor;

  const InteractiveRatings({
    super.key,
    required this.prefs,
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
  static const String _ratingKey = 'rating';

  int _rating = 0;

  @override
  void initState() {
    super.initState();
    // Synchronous read after SharedPreferencesWithCache initialization
    _rating = widget.prefs.getInt(_ratingKey) ?? 0;
  }

  void _updateRating(int newRating) {
    setState(() {
      _rating = newRating;
    });
    widget.prefs.setInt(_ratingKey, newRating);
  }

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
              if (_rating == index + 1) {
                _updateRating(0);
              } else {
                _updateRating(index + 1);
              }
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

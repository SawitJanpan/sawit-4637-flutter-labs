// AI DOCUMENTATION
// - I use claude Haiku 4.5 for research any widget for see example how use like stateful widget, state , AlertDialog, and Provider package for state management
// - ChangeNotifier class for managing user preferences across the app
// - Stores user profile, sound/vibration settings, and theme mode
// - Notifies all listeners when preferences change
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-03-15

import 'package:flutter/material.dart';

class QuizPreferencesState extends ChangeNotifier {
  String userName = 'Guest';
  String userBio = 'Quiz Lover';
  bool soundEnabled = true;
  bool vibrationEnabled = true;
  ThemeMode themeMode = ThemeMode.system;

  /// Update user name and notify listeners
  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  /// Update user bio and notify listeners
  void setUserBio(String bio) {
    userBio = bio;
    notifyListeners();
  }

  /// Update sound preference and notify listeners
  void setSoundEnabled(bool enabled) {
    soundEnabled = enabled;
    notifyListeners();
  }

  /// Update vibration preference and notify listeners
  void setVibrationEnabled(bool enabled) {
    vibrationEnabled = enabled;
    notifyListeners();
  }

  /// Update theme mode and notify listeners
  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}

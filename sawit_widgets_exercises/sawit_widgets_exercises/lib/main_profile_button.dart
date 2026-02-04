// AI DOCUMENTATION
// - I don't use any AI tools just use same code from other file main.dart
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-04

import 'package:flutter/material.dart';
import 'components/profile_with_button.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light, // Light theme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark, // Dark theme
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ProfileWithButton(studentId: '653040463-7', name: 'Sawit',imagePath: 'assets/images/profile_picture.jpg',),
      debugShowCheckedModeBanner: false,
    ),
  );
}

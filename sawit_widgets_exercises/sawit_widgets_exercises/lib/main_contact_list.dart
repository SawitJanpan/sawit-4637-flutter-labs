import 'package:flutter/material.dart';
import 'screens/contact_list_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // Remove debug banner as required
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ContactListScreen(),
    ),
  );
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use example from picture in slide " flutter-widgets-part4 Theme and Themedata " in google classroom
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-07
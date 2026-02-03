// AI DOCUMENTATION
// - I don't use any AI tools just use same code from other file main.dart
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-03

import 'package:flutter/material.dart';
import 'screens/news_feed_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'News Feed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const NewsFeedScreen(),
    ),
  );
}

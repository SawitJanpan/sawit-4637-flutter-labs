// AI DOCUMENTATION
// - I use same theme from main_profile_card_rating.dart
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-09

import 'package:flutter/material.dart';
import 'package:sawit_interactivity_exercises/screens/profile_card_rating_responsive.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: SafeArea(
          child: ProfileCardRatingResponsive(
            imagePath: 'assets/images/ann.jpg',
            name: 'แอน ทองประสม',
            addressName: "Ann's Place",
            addressInfo: "Bangkok, Thailand 10250",
            phone: "(081) 986 2164",
            email: "maryann_soyao@yahoo.com",
          ),
        ),
      ),
    ),
  );
}
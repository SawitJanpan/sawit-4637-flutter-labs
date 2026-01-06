import 'package:flutter/material.dart';
import 'screens/pets_screen.dart';

void main() {
  runApp(const PetsScreen());
}

class MainPetGallery extends StatelessWidget {
  const MainPetGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pet App',
      home: Scaffold(
        body: const PetsScreen(),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use example from picture " Lab 3 Exercise 1 Pet Gallery App " in google classroom
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
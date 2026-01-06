import 'package:flutter/material.dart';
import 'screens/pets_gallery_screen.dart';

void main() {
  runApp(const PetsGalleryScreen());
}

class MainPetModelGallery extends StatelessWidget {
  const MainPetModelGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Model Gallery',
      home: Scaffold(
        body: const PetsGalleryScreen(),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use example from picture " Lab 3 Exercise 3 Data Model " in google classroom
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
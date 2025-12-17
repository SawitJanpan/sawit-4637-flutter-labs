import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String name = "Sawit Janpan";
    const String id = "653040463-7";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Profile'),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
                name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                id,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use slide flutter-widgets-part1 for find widget to use like a Text, Column, SizedBox
// - I search google how to use child and children
// - I see example from main.dart defult flutter project for structure of flutter app
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-12-17





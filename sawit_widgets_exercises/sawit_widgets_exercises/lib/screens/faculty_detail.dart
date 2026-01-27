// AI DOCUMENTATION
// - I use chatgpt go tools for research any widget for see example how use 
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-01-27

import 'package:flutter/material.dart';
import '../models/faculty_model.dart';

class FacultyDetailScreen extends StatelessWidget {
  final FacultyModel faculty;

  const FacultyDetailScreen({super.key, required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(faculty.name), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),

         Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary, 
              borderRadius: BorderRadius.circular(16),       
            ),
            child: Text(
              faculty.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              faculty.thaiName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

        const SizedBox(height: 250),
          SizedBox(
            height: 250,
            child: Image.asset(
              faculty.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

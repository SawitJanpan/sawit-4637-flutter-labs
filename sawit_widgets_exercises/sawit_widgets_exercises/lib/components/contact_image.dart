// AI DOCUMENTATION
// - I don't use any AI tools
// - I use requirements from document "Lab 5 Exercise 2 Profile Card with Rating App" in google classroom
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-14

import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String imagePath;
  final String name;
  const ContactImage({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _buildNameOverlay(),
      ],
    );
  }

  Widget _buildNameOverlay() {
    return Positioned(
      bottom: 70,
      left: 100,
      right: 5,
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
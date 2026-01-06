import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String imgUrl;
  
  const PetCard({
    super.key,
    required this.name,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius:  BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.network(
            imgUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 120,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use slide flutter-widgets-part2 for see how to use clip react
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
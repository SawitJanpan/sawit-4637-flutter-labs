import 'package:flutter/material.dart';
import '../models/pet_model.dart';
class PetCardWithModel extends StatelessWidget {
  final Pet pet;
  
  const PetCardWithModel({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius:  BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.network(
            pet.imgUrl,
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
            color: pet.backgroundColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          child: Center(
            child: Text(
              pet.name,
              style: TextStyle(
                color: pet.textColor,
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
// - I use same code from pet_card.dart to create this component with modification to use data model
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
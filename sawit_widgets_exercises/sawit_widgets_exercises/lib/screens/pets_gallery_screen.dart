import 'package:flutter/material.dart';
import '../components/pet_card_with_model.dart';
import '../models/pet_model.dart';

class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});

  static final List<Pet> pets = [
    Pet(
      name: 'Bird',
      imgUrl:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg',
      backgroundColor: Colors.pinkAccent,
      textColor: Colors.white,
    ),
    Pet(
      name: 'Dog',
      imgUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg',
      backgroundColor: Colors.pinkAccent,
      textColor: Colors.white,
    ),
    Pet(
      name: 'Cat',
      imgUrl:
          'https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg',
      backgroundColor: Colors.pinkAccent,
      textColor: Colors.white,
    ),
    Pet(
      name: 'Rabbit',
      imgUrl:
          'https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg',
      backgroundColor: Colors.pinkAccent,
      textColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PetCardWithModel(pet: pets[0])
                ),
                Expanded(
                  child: PetCardWithModel(pet: pets[1])
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PetCardWithModel(pet: pets[2])
                ),
                Expanded(
                  child: PetCardWithModel(pet: pets[3])
                ),
              ],
            )
          ],
        ),
      ),
    );
      
  }
}

// ============================================
// AI DOCUMENTATION
// - I use chatgpt tools for prompt "How to Passing Data to Widget in flutter"
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
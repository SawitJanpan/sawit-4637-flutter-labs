import 'package:flutter/material.dart';
import '../components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pet App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PetCard(
                    name: 'Bird',
                    imgUrl:
                        'https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg',
                  ),
                ),
                Expanded(
                  child: PetCard(
                    name: 'Dog',
                    imgUrl:
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PetCard(
                    name: 'Cat',
                    imgUrl:
                        'https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg',
                  ),
                ),
                Expanded(
                  child: PetCard(
                    name: 'Rabbit',
                    imgUrl:
                        'https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg',
                  ),
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
// - I don't use any AI tools
// - I use slide flutter-widgets-part1 and part3 for see example widget to use expanded, Row, Column
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
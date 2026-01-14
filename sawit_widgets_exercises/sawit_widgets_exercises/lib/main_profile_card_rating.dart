// AI DOCUMENTATION
// - I don't use any AI tools
// - I use example code from excersie lab 5 exercise2: "Profile Card with Rating App" from slide Stateful Widget
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-14

import 'package:flutter/material.dart';
import 'components/contact_info.dart';
import 'components/contact_image.dart';
import 'components/ratings.dart';

void main() {
  runApp(
    MaterialApp(
      // Remove debug banner as required
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
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContactImage(
                imagePath: 'assets/images/ann.jpg',
                name: 'แอน ทองประสม',
              ),
              ContactInfo(
                addressName: "Ann's Place",
                addressInfo: "Bangkok, Thailand 10250",
                phone: "(081) 986 2164",
                email: "maryann_soyao@yahoo.com",
              ),
              Ratings(
                defaultColor: Colors.black,
                ratingColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

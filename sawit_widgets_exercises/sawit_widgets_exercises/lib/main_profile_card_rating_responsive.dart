// AI DOCUMENTATION
// - I use sample code condition Orientation portrait from excersie lab 6 exercise1 : "Responsive Profile Card with Rating" from google document
// - I use slide flutter responsive app from google classroom
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-16

import 'package:flutter/material.dart';
import 'components/contact_info.dart';
import 'components/contact_image.dart';
import 'components/ratings.dart';

void main() {
  runApp(
    MaterialApp(
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
        body: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return _buildPortraitLayout();
              } else {
                return _buildLandscapeLayout();
              }
            },
          ),
        ),
      ),
    ),
  );
}

Widget _buildPortraitLayout() {
  return Container(
    padding: EdgeInsets.all(16.0),
    color: Colors.orangeAccent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
  );
}

Widget _buildLandscapeLayout() {
  return Container(
    padding: EdgeInsets.all(16.0),
    color: Colors.orangeAccent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactImage(
                imagePath: 'assets/images/ann.jpg',
                name: 'แอน ทองประสม',
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
      ],
    ),
  );
}
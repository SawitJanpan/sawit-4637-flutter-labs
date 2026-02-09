// AI DOCUMENTATION
// - I use chatgpt 5.2 for research any widget for see example how use 
// - I use slide flutter-adding-interactivity for import package
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-09

import 'package:flutter/material.dart';
import 'package:sawit_widgets_exercises/components/contact_info.dart';
import 'package:sawit_widgets_exercises/components/contact_image.dart';
import 'package:sawit_interactivity_exercises/components/interactive_ratings.dart';
import 'package:sawit_widgets_exercises/utils/responsive_feed.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  final String imagePath;
  final String name;
  final String addressName;
  final String addressInfo;
  final String phone;
  final String email;

  const ProfileCardRatingResponsive({
    super.key,
    required this.imagePath,
    required this.name,
    required this.addressName,
    required this.addressInfo,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;

    if (orientation == Orientation.portrait || Responsive.isMobile(screenWidth)) {
      return _buildPortraitLayout(context, colorScheme);
    } else {
      return _buildLandscapeLayout(context, colorScheme);
    }
  }

  Widget _buildPortraitLayout(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: colorScheme.primaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactImage(
            imagePath: imagePath,
            name: name,
          ),
          ContactInfo(
            addressName: addressName,
            addressInfo: addressInfo,
            phone: phone,
            email: email,
          ),
          InteractiveRatings(
            activeColor: colorScheme.primary,
            inactiveColor: colorScheme.outlineVariant,
            starSize: 32.0,
            spacing: 8.0,
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: colorScheme.primaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactImage(
                  imagePath: imagePath,
                  name: name,
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
                  addressName: addressName,
                  addressInfo: addressInfo,
                  phone: phone,
                  email: email,
                ),
                InteractiveRatings(
                  activeColor: colorScheme.primary,
                  inactiveColor: colorScheme.outlineVariant,
                  starSize: 32.0,
                  spacing: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'components/custom_font.dart';

void main() {
  runApp(const MainCustomFont());
}

class MainCustomFont extends StatelessWidget {
  const MainCustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Font',
      home: Scaffold(
        body: Container(
          color: Colors.grey[100],
          child: Center(
            child: CustomFont(text: 'สวิตต์ จันทร์แป้น'),
          ),
        ),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use slide flutter-widgets-part1 for find widget to use 
// - I use slide flutter-widgets-part2 for import fonts
// - I use google to search for "how to use pass function to widget in flutter" this_link:https://stackoverflow.com/questions/69858731/flutter-pass-a-fuction-parameter-through-class-constructor
// - I use google to search for "how to create component in flutter" this_link:https://api.flutter.dev/flutter/material/Checkbox-class.html?_gl=1*oni6a5*_ga*MjA3NjA1NjE5Ni4xNzY0MTM3ODcx*_ga_04YGWK0175*czE3NjU5NTY3MDAkbzQkZzEkdDE3NjU5NTcwMzgkajQzJGwwJGgw
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-06
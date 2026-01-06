import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String text;
  const CustomFont({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Center( 
             child: Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 200, 200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'PlaypenSansThai',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
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
// @date 2025-06-06
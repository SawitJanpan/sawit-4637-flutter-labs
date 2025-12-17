import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    const String firstName = "Dali";
    const String lastName = "Lama";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Favorite Quote',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorite Quote'),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Expanded(
                child: Image.asset('assets/images/quote.jpg')
                ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      firstName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      lastName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I don't use any AI tools
// - I use slide flutter-widgets-part1 for find widget to use like a Expanded, Container and see how to import image for use in project
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-12-17
import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCardContainer());
}

class QuoteCardContainer extends StatelessWidget {
  const QuoteCardContainer({super.key});
  
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
                    Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 164, 234, 165),
                        border: Border.all(color: Colors.orangeAccent, width: 2),
                        borderRadius: BorderRadius.circular(12),
                    ),
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
// - I use slide flutter-widgets-part1 for find widget to use like a BoxDecoration, Container for use to create box and smooth corner with border radius
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-12-17
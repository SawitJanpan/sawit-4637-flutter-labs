import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String name = "Sawit Janpan";
    const String id = "653040463-7";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Profile'),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
                name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                id,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  
}





// AI DOCUMENTATION
// - I use chatgpt go tools for research any widget for see example how use 
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-01-27

import 'package:flutter/material.dart';
import '../models/faculty_model.dart';
import '../screens/faculty_detail.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MainFacultyList(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainFacultyList extends StatefulWidget {
  const MainFacultyList({super.key});

  @override
  State<MainFacultyList> createState() => _MainFacultyListState();
}

class _MainFacultyListState extends State<MainFacultyList> {
  final List<FacultyModel> faculties = [
    FacultyModel(
      name: 'Engineering',
      thaiName: 'วิศวกรรมศาสตร์',
      imageUrl: 'assets/images/enkku.jpg',
      description: 'https://www.en.kku.ac.th/web/',
    ),
    FacultyModel(
      name: 'Medicine',
      thaiName: 'แพทยศาสตร์',
      imageUrl: 'assets/images/mdkku.jpg',
      description: 'https://md.kku.ac.th/',
    ),
    FacultyModel(
      name: 'Architecture',
      thaiName: 'สถาปัตยกรรมศาสตร์',
      imageUrl: 'assets/images/arkku.jpg',
      description: 'https://arch.kku.ac.th/web/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KKU Faculties')),
      body: ListView.builder(
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          final faculty = faculties[index];
          return ListTile(
            leading: const Icon(Icons.arrow_forward),
            title: Text(faculty.name),
            subtitle: Text(faculty.thaiName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FacultyDetailScreen(faculty: faculty),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// AI DOCUMENTATION
// - I use doccument hint from lab8 
// - I use flutter-networking-json slide for example env add to project
// - I use chatgpt 5.2 for widget that i forgot it
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-17

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/album.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: AlbumsScreen(),
    );
  }
}

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  /// Fetch albums from REST API
  Future<List<Album>> fetchAlbums() async {
    try {
      final baseUrl = dotenv.env['Url'];

      if (baseUrl == null) {
        throw Exception("Url not found in .env");
      }

      final url = "$baseUrl/albums";

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json',
          'Connection': 'keep-alive',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList
            .map((json) => Album.fromJson(json))
            .toList();
      }

      else if (response.statusCode == 404) {
        throw Exception("404 Error: Endpoint not found");
      }

      else if (response.statusCode >= 500) {
        throw Exception("Server Error: ${response.statusCode}");
      }

      else {
        throw Exception("Unexpected Error: ${response.statusCode}");
      }
    }

    catch (e) {
      throw Exception("Failed to fetch albums: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Albums"),
        centerTitle: true,
        elevation: 0,
      ),

      body: FutureBuilder<List<Album>>(
        future: futureAlbums,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final albums = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: albums.length,
            itemBuilder: (context, index) {

              final album = albums[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  "${album.id}. ${album.title}",
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          );
        },
      ),
    );

  }
}

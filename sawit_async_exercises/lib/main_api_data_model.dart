// AI DOCUMENTATION
// - I use doccument hint from lab8 
// - I use flutter-networking-json slide for example code initialization, Future, RichText, TextSpan, snapshot
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-13

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/user.dart';

  Future<User> fetchUser() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Connection': 'keep-alive',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception('Failed to load user');
    }
  }

void main() => runApp(MaterialApp(
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
      home: const MyApp(),
    ),);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Call API by Sawit 4637"),centerTitle: true,),
      body: Center(
        child: FutureBuilder<User>(
          future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;

                return Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: user.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const TextSpan(text: " works at "),
                        TextSpan(
                          text: user.company,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                );

              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      );  
  }
}

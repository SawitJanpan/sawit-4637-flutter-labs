// AI DOCUMENTATION
// - I use flutter-shared-preferences slide for see how use SharedPreferencesWithCache
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-24

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/profile_card_rating_responsive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesWithCache prefs =
      await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          child: ProfileCardRatingResponsive(
            prefs: prefs,
            imagePath: 'assets/images/ann.jpg',
            name: 'แอน ทองประสม',
            addressName: "Ann's Place",
            addressInfo: "Bangkok, Thailand 10250",
            phone: "(081) 986 2164",
            email: "maryann_soyao@yahoo.com",
          ),
        ),
      ),
    );
  }
}
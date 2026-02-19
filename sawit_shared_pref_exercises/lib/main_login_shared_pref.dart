// AI DOCUMENTATION
// - I use doccument hint from lab9 
// - I use flutter-shared-preferences slide for install shared_preferences package, how to use controller, how to save data to shared_preferences, input decoration
// - I use chatgpt 5.2 for widget that i forgot it
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-19

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'savedUsername', 'savedPassword'},
    ),
  );

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {

  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Using Preferences with Cache',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        useMaterial3: true,                             
        colorScheme: ColorScheme.fromSeed( seedColor: Colors.purpleAccent, 
        brightness: Brightness.light, ), ), 
      darkTheme: ThemeData( 
        useMaterial3: true, 
        colorScheme: ColorScheme.fromSeed( seedColor: Colors.purpleAccent, 
        brightness: Brightness.dark, ), ),
      home: LoginPage(prefs: prefs),
    );
  }
}

class LoginPage extends StatefulWidget {

  final SharedPreferencesWithCache prefs;

  const LoginPage({super.key, required this.prefs});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  void loadSavedData() {

    String username = widget.prefs.getString('savedUsername') ?? '';
    String password = widget.prefs.getString('savedPassword') ?? '';

    usernameController.text = username;
    passwordController.text = password;
  }

  Future<void> saveData(String username, String password) async {

    await widget.prefs.setString('savedUsername', username);
    await widget.prefs.setString('savedPassword', password);
  }

  void login() async {

    String username = usernameController.text;
    String password = passwordController.text;

    await saveData(username, password);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Saved -> username: $username',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Using Preferences with Cache"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: login,
                child: const Text("Login"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

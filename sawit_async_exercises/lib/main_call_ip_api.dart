// AI DOCUMENTATION
// - I use doccument hint from lab8 
// - I use flutter-networking-json slide for run and for structure code, Future
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-12

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchIPAddress() async {
  try {
    final url = Uri.parse('https://api.ipify.org?format=json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['ip'];
    } else {
      throw Exception("Failed with status: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error: $e");
  }
}
Future<void> main() async {
  print("Your public IP address is: ${await fetchIPAddress()}");
}


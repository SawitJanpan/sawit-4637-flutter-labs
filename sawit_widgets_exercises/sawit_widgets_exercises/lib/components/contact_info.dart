// AI DOCUMENTATION
// - I don't use any AI tools
// - I use requirements from document "Lab 5 Exercise 2 Profile Card with Rating App" in google classroom
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-14

import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String addressName;
  final String addressInfo;
  final String email;
  final String phone;

  const ContactInfo({
    super.key,
    required this.addressName,
    required this.addressInfo,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.deepOrange),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    addressInfo,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ), 
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.phone, color: Colors.deepOrange),
              const SizedBox(width: 8),
              Text(phone, style: const TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.email, color: Colors.deepOrange),
              const SizedBox(width: 8),
              Text(email, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
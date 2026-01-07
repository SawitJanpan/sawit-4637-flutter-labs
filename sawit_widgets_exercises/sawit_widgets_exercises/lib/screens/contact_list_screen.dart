import 'package:flutter/material.dart';
import '../models/contact_models.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
   _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  // Persistent list of contacts
  final List<Contact> _contacts = [
    Contact(name: "John Doe", phoneNumber: "123-456-7890"),
    Contact(name: "Jane Smith", phoneNumber: "987-654-3210"),
    Contact(name: "Alice Johnson", phoneNumber: "555-555-5555"),
  ];

  // Counter for generating unique contact names
  int _counter = 1;

  // Method to add a new contact
  void _addContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: "New Contact $_counter",
          phoneNumber: "000-000-${_counter.toString().padLeft(4, '0')}",
        ),
      );
      _counter++; // Increment the counter for the next contact
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _contacts.length, // Number of items in the contact list
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(8), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                contact.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, // Bold styling
                      color: Theme.of(context).colorScheme.primary, // Black color
                    ),
              ),
              trailing: Text(
                contact.phoneNumber,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary, // Secondary styling
                    ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12.0,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ============================================
// AI DOCUMENTATION
// - I use git hub repository https://github.com/krunapon/manee-flutter-codes/tree/main/manee_basic_widgets/lib/models for reference
// - I use slide flutter-widgets-part4 for see example widget to use StaefulWidget, ListView.separated, separatorBuilder, FloatingActionButton
// - I use chatgpt 5.2 prompt " example code how to make box have shadow in BoxDecoration in flutter "
// @author Sawit Janpan
// @version 1.0.0
// @date 2025-01-07
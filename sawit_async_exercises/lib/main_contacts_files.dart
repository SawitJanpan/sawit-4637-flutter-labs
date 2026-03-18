import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'models/contact.dart';

void main() {
  runApp(const ContactsFileApp());
}

class ContactsFileApp extends StatelessWidget {
  const ContactsFileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final List<Contact> _contacts = [];
  static const String _contactsFileName = 'contacts.json';

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<File> _getContactsFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_contactsFileName');
  }

  Future<void> _loadContacts() async {
    try {
      final file = await _getContactsFile();
      if (!await file.exists()) {
        return;
      }

      final content = await file.readAsString();
      if (content.trim().isEmpty) {
        return;
      }

      final decoded = jsonDecode(content);
      if (decoded is! List) {
        return;
      }

      final loadedContacts = <Contact>[];
      for (final contactJson in decoded.whereType<Map>()) {
        try {
          loadedContacts.add(
            Contact.fromJson(Map<String, dynamic>.from(contactJson)),
          );
        } catch (_) {}
      }

      if (!mounted) {
        return;
      }

      setState(() {
        _contacts
          ..clear()
          ..addAll(loadedContacts);
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load contacts: $error')),
      );
    }
  }

  Future<void> _saveContacts() async {
    try {
      final file = await _getContactsFile();
      await file.parent.create(recursive: true);

      final encodedContacts = jsonEncode(
        _contacts.map((contact) => contact.toJson()).toList(),
      );

      final tempFile = File('${file.path}.tmp');
      await tempFile.writeAsString(encodedContacts, flush: true);

      if (await file.exists()) {
        await file.delete();
      }
      await tempFile.rename(file.path);
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save contacts: $error')),
      );
      rethrow;
    }
  }

  Future<void> _handleSaveContact() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final newContact = Contact(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
    );

    setState(() {
      _contacts.add(newContact);
    });

    try {
      await _saveContacts();
    } catch (_) {
      if (mounted) {
        setState(() {
          _contacts.removeLast();
        });
      }
      return;
    }

    if (!mounted) {
      return;
    }

    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Contact saved')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Contact name',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleSaveContact,
                      child: const Text('Save Contact'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _contacts.isEmpty
                  ? const Center(child: Text('No contacts saved yet'))
                  : ListView.builder(
                      itemCount: _contacts.length,
                      itemBuilder: (context, index) {
                        final contact = _contacts[index];
                        return Card(
                          child: ListTile(
                            title: Text(contact.name),
                            subtitle: Text(
                              'Phone: ${contact.phone}\nEmail: ${contact.email}',
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

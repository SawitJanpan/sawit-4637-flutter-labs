// AI DOCUMENTATION
// - I use chatgpt 5.2 for help me to show example each widget i don't remember
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-04

import 'package:flutter/material.dart';

class ProfileWithButton extends StatefulWidget {
  final String contact;
  final String name;
  final String imagePath;
  const ProfileWithButton({
    super.key,
    required this.contact,
    required this.name,
    required this.imagePath,
  });

  @override
  State<ProfileWithButton> createState() => _ProfileWithButtonState();
}

class _ProfileWithButtonState extends State<ProfileWithButton> {
  bool _isSubmitted = false;

  void _handleSubmit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to submit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isSubmitted = true;
                });
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(widget.contact, style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                widget.imagePath,
                width: 300,
                height: 300,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Photo Credit : KKU Library',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: _isSubmitted ? 4 : 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isSubmitted)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Submitted successfully!',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    child: Text(_isSubmitted ? 'Submit Again' : 'Submit',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary,
                    ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

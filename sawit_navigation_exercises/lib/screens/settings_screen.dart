// AI DOCUMENTATION
// - I use claude Haiku 4.5 for research any widget for see example how use like stateful widget, state , AlertDialog, and Provider package for state management
// - Settings screen for managing user preferences
// - Allows editing user name and bio via dialogs
// - Provides toggles for sound and vibration
// - Provides theme mode selection via radio buttons
// - FAB navigates to Profile screen
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-03-15

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// Show dialog to edit name or bio
  void _showNameDialog(BuildContext context, String field, String current) {
    final controller = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit $field'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $field',
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (field == 'Name') {
                context.read<QuizPreferencesState>().setUserName(controller.text.trim());
              } else {
                context.read<QuizPreferencesState>().setUserBio(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Consumer<QuizPreferencesState>(
        builder: (context, prefs, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Profile Section
              Text(
                'Profile',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                subtitle: Text(prefs.userName),
                trailing: const Icon(Icons.edit),
                onTap: () => _showNameDialog(context, 'Name', prefs.userName),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Bio'),
                subtitle: Text(prefs.userBio),
                trailing: const Icon(Icons.edit),
                onTap: () => _showNameDialog(context, 'Bio', prefs.userBio),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              const SizedBox(height: 24),

              // Sound & Feedback Section
              Text(
                'Sound & Feedback',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                secondary: const Icon(Icons.volume_up),
                title: const Text('Sound Enabled'),
                value: prefs.soundEnabled,
                onChanged: (value) {
                  prefs.setSoundEnabled(value);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                secondary: const Icon(Icons.vibration),
                title: const Text('Vibration Enabled'),
                value: prefs.vibrationEnabled,
                onChanged: (value) {
                  prefs.setVibrationEnabled(value);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              const SizedBox(height: 24),

              // Theme Section
              Text(
                'Theme',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              RadioListTile<ThemeMode>(
                title: const Text('System Default'),
                value: ThemeMode.system,
                groupValue: prefs.themeMode,
                onChanged: (value) {
                  if (value != null) prefs.setThemeMode(value);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              const SizedBox(height: 12),
              RadioListTile<ThemeMode>(
                title: const Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: prefs.themeMode,
                onChanged: (value) {
                  if (value != null) prefs.setThemeMode(value);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              const SizedBox(height: 12),
              RadioListTile<ThemeMode>(
                title: const Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: prefs.themeMode,
                onChanged: (value) {
                  if (value != null) prefs.setThemeMode(value);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        icon: const Icon(Icons.person),
        label: const Text('View Profile'),
        tooltip: 'View Profile',
      ),
    );
  }
}

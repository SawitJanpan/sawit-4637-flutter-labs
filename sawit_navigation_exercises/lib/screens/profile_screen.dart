// AI DOCUMENTATION
// - I use claude Haiku 4.5 for research any widget for see example how use like stateful widget, state , AlertDialog, and Provider package for state management
// - Profile screen displaying user preferences in read-only view
// - Shows user name, bio, sound/vibration status, and theme mode
// - Provides button to navigate back to Settings screen
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-03-15

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  /// Get theme mode display name
  String _getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light Mode';
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.system:
        return 'System Default';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Consumer<QuizPreferencesState>(
        builder: (context, prefs, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Avatar
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      prefs.userName.isNotEmpty ? prefs.userName[0].toUpperCase() : 'U',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // User Name - Headline
                Center(
                  child: Text(
                    prefs.userName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // User Bio - Subtitle
                Center(
                  child: Text(
                    prefs.userBio,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Sound & Feedback Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sound & Feedback',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              prefs.soundEnabled ? Icons.volume_up : Icons.volume_off,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Sound: ${prefs.soundEnabled ? 'Enabled' : 'Disabled'}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              prefs.vibrationEnabled ? Icons.vibration : Icons.volume_off,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Vibration: ${prefs.vibrationEnabled ? 'Enabled' : 'Disabled'}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Theme Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Theme Mode',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              prefs.themeMode == ThemeMode.dark
                                  ? Icons.dark_mode
                                  : prefs.themeMode == ThemeMode.light
                                      ? Icons.light_mode
                                      : Icons.settings_brightness,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              _getThemeModeName(prefs.themeMode),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Edit Settings Button
                Center(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.settings),
                      label: const Text('Edit Settings'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

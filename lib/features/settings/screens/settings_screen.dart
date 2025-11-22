import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/models/event_model.dart';
import '../../../common/models/user_model.dart';
import '../../auth/providers/auth_provider.dart';
import '../../auth/providers/auth_actions_provider.dart';
import '../../map/providers/map_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserAsync = ref.watch(currentUserProvider);
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final authActions = ref.watch(authActionsProvider);
    final eventsRepo = ref.watch(eventsRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: currentUserAsync.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('Not signed in'));
          }

          return ListView(
            children: [
              // Account Information
              _buildSectionHeader('Account Information'),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Username'),
                subtitle: Text(user.username),
                trailing: const Icon(Icons.edit),
                onTap: () => _showEditUsernameDialog(context, ref, user),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(user.email),
              ),
              const Divider(),

              // History
              _buildSectionHeader('History'),
              FutureBuilder<List<EventModel>>(
                future: eventsRepo.getPastEvents(user.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ListTile(
                      leading: CircularProgressIndicator(),
                      title: Text('Loading history...'),
                    );
                  }

                  final pastEvents = snapshot.data ?? [];
                  if (pastEvents.isEmpty) {
                    return const ListTile(
                      title: Text('No past events'),
                    );
                  }

                  return ExpansionTile(
                    leading: const Icon(Icons.history),
                    title: Text('Past Events (${pastEvents.length})'),
                    children: pastEvents.map((event) {
                      return ListTile(
                        title: Text(event.title),
                        subtitle: Text('${event.sportType} • ${event.datetime.toString().substring(0, 16)}'),
                        onTap: () {
                          // Show event details
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(event.title),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sport: ${event.sportType}'),
                                  Text('Date: ${event.datetime.toString().substring(0, 16)}'),
                                  Text('Description: ${event.description}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              const Divider(),

              // Dark Mode
              _buildSectionHeader('Appearance'),
              SwitchListTile(
                secondary: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.setThemeMode(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
              const Divider(),

              // Privacy
              _buildSectionHeader('Privacy'),
              const ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Privacy Settings'),
                subtitle: Text('Allow others to see my profile image'),
                trailing: Switch(value: true, onChanged: null),
              ),
              const Divider(),

              // Logout
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true && context.mounted) {
                    await authActions.signOut();
                    if (context.mounted) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  }
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  void _showEditUsernameDialog(BuildContext context, WidgetRef ref, UserModel user) {
    final usernameController = TextEditingController(text: user.username);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Username'),
        content: TextField(
          controller: usernameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final newUsername = usernameController.text.trim();
              if (newUsername.isEmpty || newUsername.length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Username must be at least 3 characters')),
                );
                return;
              }

              try {
                final authRepo = ref.read(authRepositoryProvider);
                await authRepo.updateUserData(
                  user.copyWith(username: newUsername),
                );

                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Username updated')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}


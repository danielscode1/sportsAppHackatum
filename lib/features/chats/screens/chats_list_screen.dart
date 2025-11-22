import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/repositories/events_repository.dart';
import '../../../common/repositories/chat_repository.dart';
import '../../../common/models/event_model.dart';
import '../../map/providers/map_provider.dart';
import 'chat_screen.dart';
import '../../auth/providers/auth_provider.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository();
});

class ChatsListScreen extends ConsumerWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final eventsRepo = ref.watch(eventsRepositoryProvider);
    final chatRepo = ref.watch(chatRepositoryProvider);
    final eventsAsync = ref.watch(eventsStreamProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Add extra top padding to avoid overlap with floating search button
            const SizedBox(height: 72),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Chats',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('Please sign in'));
          }

          return eventsAsync.when(
            data: (allEvents) {
              // Filter events where user is attending
              return FutureBuilder<List<EventModel>>(
                future: _getUserJoinedEvents(user.uid, allEvents, eventsRepo),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final joinedEvents = snapshot.data ?? [];

                  if (joinedEvents.isEmpty) {
                    return const Center(
                      child: Text('No chats yet. Join an event to start chatting!'),
                    );
                  }

                  return ListView.builder(
                    itemCount: joinedEvents.length,
                    itemBuilder: (context, index) {
                      final event = joinedEvents[index];
                      return FutureBuilder<String?>(
                        future: chatRepo.getLastMessage(event.id).then((msg) => msg?.content),
                        builder: (context, snapshot) {
                          final lastMessage = snapshot.data ?? 'No messages yet';
                          return ListTile(
                            leading: const Icon(Icons.sports_soccer),
                            title: Text(event.title),
                            subtitle: Text('${event.sportType} • $lastMessage'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(eventId: event.id),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<EventModel>> _getUserJoinedEvents(
    String userId,
    List<EventModel> allEvents,
    EventsRepository eventsRepo,
  ) async {
    final joinedEventIds = <String>{};
    for (final event in allEvents) {
      final isAttending = await eventsRepo.isUserAttending(event.id, userId);
      if (isAttending) {
        joinedEventIds.add(event.id);
      }
    }
    return allEvents.where((e) => joinedEventIds.contains(e.id)).toList();
  }
}



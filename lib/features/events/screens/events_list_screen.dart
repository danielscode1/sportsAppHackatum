import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../map/providers/map_provider.dart';

class EventsListScreen extends HookConsumerWidget {
  final VoidCallback goToMapPage;
  const EventsListScreen({super.key, required this.goToMapPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSportType = useState<String?>('all');
    final eventsAsync = ref.watch(eventsStreamProvider);

    final sportTypes = [
      'all',
      'basketball',
      'football',
      'volleyball',
      'tennis',
      'badminton',
      'running',
      'cycling',
      'other',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<String>(
              value: selectedSportType.value,
              decoration: const InputDecoration(
                labelText: 'Filter by Sport',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              items: sportTypes.map((sport) {
                return DropdownMenuItem(
                  value: sport,
                  child: Text(sport == 'all' ? 'All Sports' : sport),
                );
              }).toList(),
              onChanged: (value) {
                selectedSportType.value = value;
              },
            ),
          ),
          Expanded(
            child: eventsAsync.when(
              data: (events) {
                final filteredEvents = selectedSportType.value == 'all'
                    ? events
                    : events.where((e) => e.sportType == selectedSportType.value).toList();

                if (filteredEvents.isEmpty) {
                  return const Center(
                    child: Text('No events found'),
                  );
                }

                return ListView.builder(
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = filteredEvents[index];
                    return FutureBuilder<int>(
                      future: ref.read(eventsRepositoryProvider).getAttendeeCount(event.id).first,
                      builder: (context, snapshot) {
                        final attendeeCount = snapshot.data ?? 0;
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.sports_soccer),
                            title: Text(event.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${event.sportType} • ${event.description}'),
                                const SizedBox(height: 4),
                                Text('Attendees: $attendeeCount / ${event.capacity}'),
                              ],
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              ref.read(mapSelectedEventProvider.notifier).state = event;
                              // Navigate back to map and center on event
                              goToMapPage();
                              // TODO: Center map on event location
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}


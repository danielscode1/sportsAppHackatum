import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';
import '../providers/map_provider.dart';
import '../../events/screens/event_creation_screen.dart';
import '../../chats/screens/chats_list_screen.dart';
import '../../chats/screens/chat_screen.dart';
import '../../events/screens/events_list_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../../common/models/event_model.dart';
import '../../auth/providers/auth_provider.dart';

class MapScreen extends HookConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useMemoized(() => MapController());
    final currentPage = useState(1); // 0: Chats, 1: Map, 2: List
    final pageController = useMemoized(() => PageController(initialPage: 1));
    final selectedEvent = useState<EventModel?>(null);
    final isPlacingEvent = useState(false);

    final locationAsync = ref.watch(locationProvider);
    final eventsAsync = ref.watch(eventsStreamProvider);

    useEffect(() {
      locationAsync.whenData((position) {
        if (position != null) {
          mapController.move(
            LatLng(position.latitude, position.longitude),
            13.0,
          );
        }
      });
      return null;
    }, [locationAsync.value]);

    void showEventPopup(EventModel event) {
      selectedEvent.value = event;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => EventPopup(event: event),
      ).then((_) => selectedEvent.value = null);
    }

    void handleMapTap(TapPosition tapPosition, LatLng point) {
      if (isPlacingEvent.value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventCreationScreen(
              initialLocation: point,
              onEventCreated: () {
                isPlacingEvent.value = false;
              },
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Munich'),
        leading: IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          onPressed: () {
            pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings),
            label: const Text('Settings'),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => currentPage.value = index,
        children: [
          const ChatsListScreen(),
          _buildMapView(context, ref, mapController, eventsAsync, showEventPopup, handleMapTap, isPlacingEvent),
          const EventsListScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {
                pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                isPlacingEvent.value = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tap on the map to place your event'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapView(
    BuildContext context,
    WidgetRef ref,
    MapController mapController,
    AsyncValue<List<EventModel>> eventsAsync,
    void Function(EventModel) showEventPopup,
    void Function(TapPosition, LatLng) handleMapTap,
    ValueNotifier<bool> isPlacingEvent,
  ) {
    final locationAsync = ref.watch(locationProvider);

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: const LatLng(48.1351, 11.5820), // Munich
            initialZoom: 13.0,
            onTap: handleMapTap,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.sports_app',
            ),
            MarkerLayer(
              markers: [
                // User location marker
                if (locationAsync.value != null)
                  Marker(
                    point: LatLng(
                      locationAsync.value!.latitude,
                      locationAsync.value!.longitude,
                    ),
                    width: 20,
                    height: 20,
                    child: const Icon(Icons.location_on, color: Colors.blue, size: 20),
                  ),
                // Event markers
                ...eventsAsync.when(
                  data: (events) => events.map((event) {
                    return Marker(
                      point: LatLng(event.lat, event.lng),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => showEventPopup(event),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.sports_soccer, color: Colors.white, size: 24),
                        ),
                      ),
                    );
                  }).toList(),
                  loading: () => [],
                  error: (_, __) => [],
                ),
              ],
            ),
          ],
        ),
        if (isPlacingEvent.value)
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Tap on the map to place your event',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

class EventPopup extends ConsumerWidget {
  final EventModel event;

  const EventPopup({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendeeCountAsync = ref.watch(attendeeCountProvider(event.id));
    final isAttendingAsync = ref.watch(isUserAttendingProvider(event.id));
    final eventsRepo = ref.watch(eventsRepositoryProvider);
    final authState = ref.watch(authStateProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sport: ${event.sportType}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hosted by ${event.hostId}', // TODO: Get username
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    if (event.note.isNotEmpty) ...[
                      Text(
                        'Note: ${event.note}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                    ],
                    attendeeCountAsync.when(
                      data: (count) => Text(
                        'Attendees: $count / ${event.capacity}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      loading: () => const Text('Loading...'),
                      error: (_, __) => const Text('Error loading attendees'),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Estimated Busyness: ${event.estimatedBusyness > 0 ? "High" : "Low"}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    isAttendingAsync.when(
                      data: (isAttending) => Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                final user = authState.value;
                                if (user == null) return;

                                if (isAttending) {
                                  await eventsRepo.leaveEvent(event.id, user.uid);
                                } else {
                                  await eventsRepo.joinEvent(event.id, user.uid);
                                }
                              },
                              child: Text(isAttending ? 'Leave' : 'Join'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(eventId: event.id),
                                  ),
                                );
                              },
                              child: const Text('Open Chat'),
                            ),
                          ),
                        ],
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (_, __) => const Text('Error'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


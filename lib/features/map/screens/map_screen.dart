import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../providers/map_provider.dart';
import '../../events/screens/event_creation_screen.dart';
import '../../chats/screens/chats_list_screen.dart';
import '../../chats/screens/chat_screen.dart';
import '../../events/screens/events_list_screen.dart';
import '../../events/screens/event_edit_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../../common/models/event_model.dart';
import '../../../common/repositories/auth_repository.dart';
import '../../../common/repositories/events_repository.dart';
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

    final currentUserAsync = ref.watch(currentUserProvider);
    final searchQuery = useState('');
    final showSearch = useState(false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: showSearch.value
            ? TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search events...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                ),
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                onChanged: (value) => searchQuery.value = value,
              )
            : null,
        leading: IconButton(
          icon: Icon(showSearch.value ? Icons.close : Icons.search),
          onPressed: () {
            showSearch.value = !showSearch.value;
            if (!showSearch.value) searchQuery.value = '';
          },
        ),
        actions: [
          currentUserAsync.when(
            data: (user) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  image: user?.profileImageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(user!.profileImageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: user?.profileImageUrl == null
                    ? Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
              ),
            ),
            loading: () => Container(
              margin: const EdgeInsets.only(right: 16),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
            error: (_, __) => IconButton(
              icon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => currentPage.value = index,
        children: [
          const ChatsListScreen(),
          _buildMapView(context, ref, mapController, eventsAsync, showEventPopup, handleMapTap, isPlacingEvent, searchQuery),
          const EventsListScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
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
              icon: Icon(currentPage.value == 1 ? Icons.add : Icons.map),
              onPressed: () {
                if (currentPage.value == 1) {
                  isPlacingEvent.value = true;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tap on the map to place your event'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
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
    ValueNotifier<String> searchQuery,
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
                  data: (events) {
                    // Filter by search query if active
                    final filteredEvents = searchQuery.value.isEmpty
                        ? events
                        : events.where((event) {
                            final query = searchQuery.value.toLowerCase();
                            return event.title.toLowerCase().contains(query) ||
                                event.sportType.toLowerCase().contains(query) ||
                                event.description.toLowerCase().contains(query);
                          }).toList();
                    
                    return filteredEvents.map((event) {
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
                    }).toList();
                  },
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
    final attendeesAsync = ref.watch(eventAttendeesProvider(event.id));
    final hasRequestedAsync = ref.watch(hasRequestedProvider(event.id));
    final requestsAsync = ref.watch(eventRequestsProvider(event.id));
    
    final user = authState.value;
    final isHost = user?.uid == event.hostId;

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
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
              // Image gallery section (top white area)
              if (event.imageUrls.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: event.imageUrls.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(event.imageUrls[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            event.title,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (!isHost) return const SizedBox.shrink();
                            return IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EventEditScreen(event: event),
                                  ),
                                );
                              },
                              tooltip: 'Edit Event',
                            );
                          },
                        ),
                        if (event.isInviteOnly)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Invite Only',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.sports_soccer,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          event.sportType.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    FutureBuilder(
                      future: ref.read(authRepositoryProvider).getUserData(event.hostId),
                      builder: (context, snapshot) {
                        final hostUser = snapshot.data;
                        return Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Hosted by ${hostUser?.username ?? 'Unknown'}',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            if (hostUser?.isVerified == true) ...[
                              const SizedBox(width: 4),
                              Icon(
                                Icons.verified,
                                size: 16,
                                color: Colors.blue,
                              ),
                            ],
                          ],
                        );
                      },
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
                    // Participants Preview
                    attendeesAsync.when(
                      data: (attendeeIds) {
                        if (attendeeIds.isEmpty) return const SizedBox.shrink();
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Participants (${attendeeIds.length})',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: attendeeIds.take(10).map((userId) {
                                  return Consumer(
                                    builder: (context, ref, child) {
                                      final userAsync = ref.watch(userDataProvider(userId));
                                      return userAsync.when(
                                        data: (user) => Tooltip(
                                          message: user?.username ?? 'Unknown',
                                          child: GestureDetector(
                                            onLongPress: () {
                                              // Show username in a snackbar on long press
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(user?.username ?? 'Unknown'),
                                                  duration: const Duration(seconds: 2),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(color: Colors.white, width: 2),
                                                image: user?.profileImageUrl != null
                                                    ? DecorationImage(
                                                        image: NetworkImage(user!.profileImageUrl!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                              ),
                                              child: user?.profileImageUrl == null
                                                  ? const Icon(Icons.person, size: 20)
                                                  : null,
                                            ),
                                          ),
                                        ),
                                        loading: () => const SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        ),
                                        error: (_, __) => Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: const Icon(Icons.person, size: 20),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    // Show requests for hosts of invite-only events
                    if (event.isInviteOnly)
                      requestsAsync.when(
                        data: (requestIds) {
                          if (requestIds.isEmpty) return const SizedBox.shrink();
                          final user = authState.value;
                          final isHost = user?.uid == event.hostId;
                          if (!isHost) return const SizedBox.shrink();
                          
                          return Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.orange),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pending Requests (${requestIds.length})',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ...requestIds.map((userId) {
                                  return Consumer(
                                    builder: (context, ref, child) {
                                      final userAsync = ref.watch(userDataProvider(userId));
                                      return userAsync.when(
                                        data: (requestUser) => ListTile(
                                          dense: true,
                                          leading: CircleAvatar(
                                            radius: 20,
                                            backgroundImage: requestUser?.profileImageUrl != null
                                                ? NetworkImage(requestUser!.profileImageUrl!)
                                                : null,
                                            child: requestUser?.profileImageUrl == null
                                                ? const Icon(Icons.person, size: 20)
                                                : null,
                                          ),
                                          title: Text(requestUser?.username ?? 'Unknown'),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.check, color: Colors.green),
                                                onPressed: () async {
                                                  await eventsRepo.approveRequest(event.id, userId);
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.close, color: Colors.red),
                                                onPressed: () async {
                                                  await eventsRepo.rejectRequest(event.id, userId);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        loading: () => const ListTile(
                                          title: Text('Loading...'),
                                        ),
                                        error: (_, __) => const ListTile(
                                          title: Text('Error loading user'),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                    const SizedBox(height: 24),
                    // Join/Request buttons
                    isAttendingAsync.when(
                      data: (isAttending) {
                        return hasRequestedAsync.when(
                          data: (hasRequested) {
                            final user = authState.value;
                            final isHost = user?.uid == event.hostId;

                            if (event.isInviteOnly && !isAttending && !isHost) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (user == null) return;
                                        if (hasRequested) {
                                          await eventsRepo.rejectRequest(event.id, user.uid);
                                        } else {
                                          await eventsRepo.requestToJoin(event.id, user.uid);
                                        }
                                      },
                                      child: Text(hasRequested ? 'Request Sent' : 'Request to Join'),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Column(
                              children: [
                                if (isHost)
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: OutlinedButton.icon(
                                      onPressed: () async {
                                        final confirmed = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Delete Event'),
                                            content: const Text('Are you sure you want to delete this event? This cannot be undone.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, true),
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.red,
                                                ),
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (confirmed == true && context.mounted) {
                                          await eventsRepo.deleteEvent(event.id);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Event deleted')),
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      label: const Text('Delete Event', style: TextStyle(color: Colors.red)),
                                    ),
                                  ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
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
                              ],
                            );
                          },
                          loading: () => const CircularProgressIndicator(),
                          error: (_, __) => const Text('Error'),
                        );
                      },
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


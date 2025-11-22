import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../providers/map_provider.dart';
import '../providers/map_filters_provider.dart';
import '../../events/screens/event_creation_screen.dart';
import '../../chats/screens/chats_list_screen.dart';
import '../../chats/screens/chat_screen.dart';
import '../../events/screens/events_list_screen.dart';
import '../../events/screens/event_edit_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../../common/models/event_model.dart';
import '../../../common/models/amenity_model.dart';
import '../../../common/repositories/auth_repository.dart';
import '../../../common/repositories/events_repository.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/map_provider.dart';
import '../data/amenities_data.dart';

class MapScreen extends HookConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useMemoized(() => MapController());
    final currentPage = useState(1); // 0: Chats, 1: Map, 2: List
    final pageController = usePageController(initialPage: 1);
    
    final isPlacingEvent = useState(false);

    final locationAsync = ref.watch(locationProvider);
    final eventsAsync = ref.watch(eventsStreamProvider);

    void showEventPopup(EventModel event) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: EventPopup(event: event),
        ),
    ).then((_) { 
        ref.read(mapSelectedEventProvider.notifier).state = null;
      });
    }
    void goToMapPage() {
      pageController.animateToPage(
        1, // Index 1 is the MapView
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
    }, []);
    ref.listen<EventModel?>(mapSelectedEventProvider, (previous, next) {
      if (next != null) {
      showEventPopup(next);
      }
    }
    );

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
    final selectedDate = useState<DateTime>(DateTime.now());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) => currentPage.value = index,
            children: [
              const ChatsListScreen(),
              _buildMapView(context, ref, mapController, eventsAsync, showEventPopup, handleMapTap, isPlacingEvent, searchQuery, selectedDate),
              EventsListScreen(goToMapPage: goToMapPage),
            ],
          ),
          // Top floating buttons (search, date picker, and settings)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCircularFloatingButton(
                    context: context,
                    icon: showSearch.value ? Icons.close : Icons.search,
                    onPressed: () {
                      if (showSearch.value) {
                        showSearch.value = false;
                        searchQuery.value = '';
                      } else {
                        _showSearchDialog(context, ref, searchQuery, showSearch);
                      }
                    },
                  ),
                  // Day navigation control in center
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white.withOpacity(0.95)
                          : Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            selectedDate.value = selectedDate.value.subtract(const Duration(days: 1));
                          },
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate.value,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            if (picked != null) {
                              selectedDate.value = picked;
                            }
                          },
                          child: Text(
                            _formatDate(selectedDate.value),
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFF1976D2)
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            selectedDate.value = selectedDate.value.add(const Duration(days: 1));
                          },
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        if (!_isToday(selectedDate.value)) ...[
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              selectedDate.value = DateTime.now();
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xFF1976D2)
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  currentUserAsync.when(
                    data: (user) {
                      final isLightMode = Theme.of(context).brightness == Brightness.light;
                      return Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isLightMode 
                              ? Colors.white.withOpacity(0.95)
                              : Theme.of(context).colorScheme.surfaceContainerHighest,
                          image: user?.profileImageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(user!.profileImageUrl!),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    // Will fall back to icon
                                  },
                                )
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: isLightMode 
                                  ? Colors.black.withOpacity(0.08)
                                  : Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const SettingsScreen()),
                              );
                            },
                            child: user?.profileImageUrl == null
                                ? Center(
                                    child: Icon(
                                      Icons.person,
                                      color: isLightMode 
                                          ? const Color(0xFF1976D2) // Brighter, more vibrant blue
                                          : Theme.of(context).colorScheme.onSurface,
                                      size: 24,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                    loading: () => _buildCircularFloatingButton(
                      context: context,
                      icon: Icons.person,
                      onPressed: () {},
                      child: const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    error: (_, __) => _buildCircularFloatingButton(
                      context: context,
                      icon: Icons.person,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SettingsScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom floating navigation buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCircularNavButton(
                      context: context,
                      icon: Icons.chat_bubble_outline,
                      isSelected: currentPage.value == 0,
                      onPressed: () {
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: _buildCircularNavButton(
                          context: context,
                          icon: currentPage.value == 1 ? Icons.add : Icons.map,
                          isSelected: currentPage.value == 1,
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
                      ),
                    ),
                    _buildCircularNavButton(
                      context: context,
                      icon: Icons.list,
                      isSelected: currentPage.value == 2,
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
          ),
        ],
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
    ValueNotifier<DateTime> selectedDate,
  ) {
    final locationAsync = ref.watch(locationProvider);
    final mapFilters = ref.watch(mapFiltersProvider);
    final showFilters = useState(false);

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
                if (mapFilters.showEvents)
                  ...eventsAsync.when(
                    data: (events) {
                      // Filter by search query if active
                      var filteredEvents = searchQuery.value.isEmpty
                          ? events
                          : events.where((event) {
                              final query = searchQuery.value.toLowerCase();
                              return event.title.toLowerCase().contains(query) ||
                                  event.sportType.toLowerCase().contains(query) ||
                                  event.description.toLowerCase().contains(query);
                            }).toList();
                      
                      // Filter events by selected date (show events on or after selected date)
                      final selectedDateOnly = DateTime(selectedDate.value.year, selectedDate.value.month, selectedDate.value.day);
                      filteredEvents = filteredEvents.where((event) {
                        final eventDateOnly = DateTime(event.startTime.year, event.startTime.month, event.startTime.day);
                        return eventDateOnly.isAtSameMomentAs(selectedDateOnly) || eventDateOnly.isAfter(selectedDateOnly);
                      }).toList();
                      
                      return filteredEvents.map((event) {
                        final eventDateOnly = DateTime(event.startTime.year, event.startTime.month, event.startTime.day);
                        final selectedDateOnly = DateTime(selectedDate.value.year, selectedDate.value.month, selectedDate.value.day);
                        final daysDifference = eventDateOnly.difference(selectedDateOnly).inDays;
                        
                        // Calculate scale: 100% (today/0 days), 66% (1 day), 33% (2 days), 0% (3+ days)
                        double scale = 1.0;
                        if (daysDifference == 0) {
                          scale = 1.0; // 100%
                        } else if (daysDifference == 1) {
                          scale = 0.66; // 66%
                        } else if (daysDifference == 2) {
                          scale = 0.33; // 33%
                        } else {
                          scale = 0.0; // 0% - hide
                        }
                        
                        // Skip if scale is 0
                        if (scale == 0.0) {
                          return null;
                        }
                        
                        final baseSize = 40.0;
                        final scaledSize = baseSize * scale;
                        final iconSize = 24.0 * scale;
                        
                        return Marker(
                          point: LatLng(event.lat, event.lng),
                          width: scaledSize,
                          height: scaledSize,
                          child: GestureDetector(
                            onTap: () => showEventPopup(event),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2 * scale),
                              ),
                              child: Icon(Icons.sports_soccer, color: Colors.white, size: iconSize),
                            ),
                          ),
                        );
                      }).whereType<Marker>().toList();
                    },
                    loading: () => [],
                    error: (_, __) => [],
                  ),
                // Amenity markers (toilets and water supply)
                ...AmenitiesData.allAmenities.where((amenity) {
                  switch (amenity.type) {
                    case AmenityType.toilet:
                      return mapFilters.showToilets;
                    case AmenityType.waterSupply:
                      return mapFilters.showWaterSupply;
                    case AmenityType.sportArea:
                      return false; // Sport areas not used
                  }
                }).map((amenity) {
                  return Marker(
                    point: amenity.location,
                    width: 32,
                    height: 32,
                    child: GestureDetector(
                      onTap: () {
                        // Show info about the amenity
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              amenity.type == AmenityType.toilet 
                                  ? 'Public Toilet'
                                  : 'Drinking Water',
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (amenity.name != null) ...[
                                  Text(
                                    amenity.name!,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                if (amenity.description != null) ...[
                                  Text(amenity.description!),
                                  const SizedBox(height: 8),
                                ],
                                Text(
                                  'Location: ${amenity.location.latitude.toStringAsFixed(6)}, ${amenity.location.longitude.toStringAsFixed(6)}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: amenity.type == AmenityType.toilet 
                                ? Colors.orange 
                                : Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            amenity.type == AmenityType.toilet 
                                ? Icons.wc 
                                : Icons.water_drop,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                    ),
                  );
                }),
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    
    if (dateOnly == today) {
      return 'Today';
    } else if (dateOnly == today.add(const Duration(days: 1))) {
      return 'Tomorrow';
    } else if (dateOnly == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    return dateOnly != today;
  }

  Widget _buildFilterPanel(BuildContext context, WidgetRef ref, MapFilters filters) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Map Filters',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildFilterOption(
            context,
            ref,
            'Events',
            filters.showEvents,
            Icons.sports_soccer,
            Colors.red,
            () => ref.read(mapFiltersProvider.notifier).toggleEvents(),
          ),
          const SizedBox(height: 12),
          _buildFilterOption(
            context,
            ref,
            'Restrooms',
            filters.showToilets,
            Icons.wc,
            Colors.orange,
            () => ref.read(mapFiltersProvider.notifier).toggleToilets(),
          ),
          const SizedBox(height: 12),
          _buildFilterOption(
            context,
            ref,
            'Drinking Water',
            filters.showWaterSupply,
            Icons.water_drop,
            Colors.blue,
            () => ref.read(mapFiltersProvider.notifier).toggleWaterSupply(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(
    BuildContext context,
    WidgetRef ref,
    String label,
    bool isEnabled,
    IconData icon,
    Color color,
    VoidCallback onToggle,
  ) {
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: isEnabled ? color : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isEnabled 
                      ? Theme.of(context).colorScheme.onSurface 
                      : Colors.grey,
                ),
              ),
            ),
            Icon(
              isEnabled ? Icons.check_circle : Icons.circle_outlined,
              color: isEnabled ? color : Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularNavButton({
    required BuildContext context,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : (isLightMode 
                ? Colors.white.withOpacity(0.95)
                : Theme.of(context).colorScheme.surfaceContainerHighest),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
                : (isLightMode 
                    ? Colors.black.withOpacity(0.08)
                    : Colors.black.withOpacity(0.2)),
            blurRadius: isSelected ? 16 : 12,
            offset: const Offset(0, 4),
            spreadRadius: isSelected ? 2 : 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onPressed,
          child: Icon(
            icon,
            color: isSelected
                ? Colors.white
                : (isLightMode 
                    ? const Color(0xFF1976D2) // Brighter, more vibrant blue
                    : Theme.of(context).colorScheme.onSurface),
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildCircularFloatingButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onPressed,
    Widget? child,
  }) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLightMode 
            ? Colors.white.withOpacity(0.95)
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        boxShadow: [
          BoxShadow(
            color: isLightMode 
                ? Colors.black.withOpacity(0.08)
                : Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onPressed,
          child: child != null
              ? child
              : Center(
                  child: Icon(
                    icon,
                    color: isLightMode 
                        ? const Color(0xFF1976D2) // Brighter, more vibrant blue
                        : Theme.of(context).colorScheme.onSurface,
                    size: 24,
                  ),
                ),
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context, WidgetRef ref, ValueNotifier<String> searchQuery, ValueNotifier<bool> showSearch) {
    final textController = TextEditingController(text: searchQuery.value);
    showSearch.value = true;
    
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Search Events'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search events...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.search),
          ),
          onChanged: (value) {
            searchQuery.value = value;
          },
          onSubmitted: (_) {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              textController.clear();
              searchQuery.value = '';
              Navigator.pop(context);
              showSearch.value = false;
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    ).then((_) {
      showSearch.value = false;
    });
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
              initialChildSize: 0.65,
              minChildSize: 0.3,
              maxChildSize: 0.85,
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
              // Image gallery section (show placeholder if no images, or images if they exist)
              SizedBox(
                height: 200,
                child: event.imageUrls.isNotEmpty
                    ? PageView.builder(
                        itemCount: event.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(event.imageUrls[index]),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {
                                  // Fallback to default if image fails to load
                                },
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sports_soccer,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                event.sportType.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                                  final isHostUser = userId == event.hostId;
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
                                            child: Stack(
                                              children: [
                                                Container(
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
                                                if (isHost && !isHostUser)
                                                  Positioned(
                                                    right: -2,
                                                    top: -2,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        final confirmed = await showDialog<bool>(
                                                          context: context,
                                                          builder: (context) => AlertDialog(
                                                            title: const Text('Remove Participant'),
                                                            content: Text('Are you sure you want to remove ${user?.username ?? 'this user'} from the event?'),
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
                                                                child: const Text('Remove'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                        if (confirmed == true && context.mounted) {
                                          await eventsRepo.removeAttendee(event.id, userId);
                                          // Invalidate providers to update UI
                                          ref.invalidate(attendeeCountProvider(event.id));
                                          ref.invalidate(eventAttendeesProvider(event.id));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(content: Text('${user?.username ?? 'User'} removed from event')),
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.red,
                                                        ),
                                                        child: const Icon(
                                                          Icons.close,
                                                          size: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
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
                                                  // Invalidate providers to update UI
                                                  ref.invalidate(eventRequestsProvider(event.id));
                                                  ref.invalidate(attendeeCountProvider(event.id));
                                                  ref.invalidate(eventAttendeesProvider(event.id));
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.close, color: Colors.red),
                                                onPressed: () async {
                                                  await eventsRepo.rejectRequest(event.id, userId);
                                                  // Invalidate providers to update UI
                                                  ref.invalidate(eventRequestsProvider(event.id));
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

                            final bool canChat = isHost || isAttending;
                    
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
                                        // Invalidate providers to update UI
                                        ref.invalidate(hasRequestedProvider(event.id));
                                        ref.invalidate(eventRequestsProvider(event.id));
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
                                          if(isAttending) {
                                            await eventsRepo.leaveEvent(event.id, user.uid);
                                          } else {
                                            await eventsRepo.joinEvent(event.id, user.uid);
                                          }
                                          // Invalidate providers to update UI
                                          ref.invalidate(isUserAttendingProvider(event.id));
                                          ref.invalidate(attendeeCountProvider(event.id));
                                          ref.invalidate(eventAttendeesProvider(event.id));
                                        },
                                        child: Text(isAttending ? 'Leave' : 'Join'),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: canChat ? () {
                                            Navigator.pop(context);
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => ChatScreen(eventId: event.id),
                                              ),
                                            );
                                          } : null,
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


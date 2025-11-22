import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../common/repositories/events_repository.dart';
import '../../../common/repositories/auth_repository.dart';
import '../../../common/models/event_model.dart';
import '../../../common/models/user_model.dart';
import '../../auth/providers/auth_provider.dart';

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  return EventsRepository();
});
final mapSelectedEventProvider = StateProvider<EventModel?>((ref) => null);
final eventsStreamProvider = StreamProvider<List<EventModel>>((ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return repository.getEventsStream();
});

final locationProvider = FutureProvider<Position?>((ref) async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  } catch (e) {
    return null;
  }
});

final attendeeCountProvider = StreamProvider.family<int, String>((ref, eventId) {
  final repository = ref.watch(eventsRepositoryProvider);
  return repository.getAttendeeCount(eventId);
});

final isUserAttendingProvider = FutureProvider.family<bool, String>((ref, eventId) async {
  final authState = ref.watch(authStateProvider);
  final repository = ref.watch(eventsRepositoryProvider);
  
  return authState.when(
    data: (user) async {
      if (user == null) return false;
      return await repository.isUserAttending(eventId, user.uid);
    },
    loading: () => Future.value(false),
    error: (_, __) => Future.value(false),
  );
});

final eventAttendeesProvider = StreamProvider.family<List<String>, String>((ref, eventId) {
  final repository = ref.watch(eventsRepositoryProvider);
  return repository.getEventAttendees(eventId);
});

final hasRequestedProvider = FutureProvider.family<bool, String>((ref, eventId) async {
  final authState = ref.watch(authStateProvider);
  final repository = ref.watch(eventsRepositoryProvider);
  
  return authState.when(
    data: (user) async {
      if (user == null) return false;
      return await repository.hasRequested(eventId, user.uid);
    },
    loading: () => Future.value(false),
    error: (_, __) => Future.value(false),
  );
});

final userDataProvider = FutureProvider.family<UserModel?, String>((ref, userId) async {
  final authRepo = ref.watch(authRepositoryProvider);
  return await authRepo.getUserData(userId);
});

final eventRequestsProvider = StreamProvider.family<List<String>, String>((ref, eventId) {
  final repository = ref.watch(eventsRepositoryProvider);
  return repository.getEventRequests(eventId);
});


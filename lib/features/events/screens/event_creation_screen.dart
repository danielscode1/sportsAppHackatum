import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../common/models/event_model.dart';
import '../../auth/providers/auth_provider.dart';
import '../../map/providers/map_provider.dart';

class EventCreationScreen extends HookConsumerWidget {
  final LatLng initialLocation;

  final VoidCallback? onEventCreated;

  const EventCreationScreen({
    super.key,
    required this.initialLocation,
    this.onEventCreated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final noteController = useTextEditingController();
    final capacityController = useTextEditingController(text: '20');
    final selectedSportType = useState('basketball');
    final selectedDateTime = useState<DateTime>(DateTime.now().add(const Duration(hours: 1)));
    final startTime = useState<DateTime>(DateTime.now());
    final endTime = useState<DateTime>(DateTime.now().add(const Duration(hours: 1)));
    final isLoading = useState(false);
    final isInviteOnly = useState(false);
    final imageUrls = useState<List<String>>([]);

    final authState = ref.watch(authStateProvider);
    final eventsRepo = ref.watch(eventsRepositoryProvider);

    final sportTypes = [
      'basketball',
      'football',
      'volleyball',
      'tennis',
      'badminton',
      'running',
      'cycling',
      'other',
    ];

    Future<void> handleSubmit() async {
      if (!formKey.currentState!.validate()) return;

      final user = authState.value;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please sign in')),
        );
        return;
      }

      isLoading.value = true;
      try {
        final capacity = int.tryParse(capacityController.text) ?? 20;

        final event = EventModel(
          id: '', // Will be set by Firestore
          hostId: user.uid,
          title: titleController.text.trim(),
          sportType: selectedSportType.value,
          description: descriptionController.text.trim(),
          note: noteController.text.trim(),
          datetime: startTime.value, // Keep for backward compatibility
          startTime: startTime.value,
          endTime: endTime.value,
          capacity: capacity,
          lat: initialLocation.latitude,
          lng: initialLocation.longitude,
          createdAt: DateTime.now(),
          estimatedBusyness: 0,
          isInviteOnly: isInviteOnly.value,
          imageUrls: imageUrls.value,
        );

        await eventsRepo.createEvent(event);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Event created successfully!')),
          );
          Navigator.of(context).pop();
          onEventCreated?.call();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.toString()}')),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> selectStartTime() async {
      final date = await showDatePicker(
        context: context,
        initialDate: startTime.value,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );

      if (date == null) return;

      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(startTime.value),
      );

      if (time == null) return;

      final newStartTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      startTime.value = newStartTime;
      
      // Auto-adjust end time if it's before start time
      if (endTime.value.isBefore(newStartTime) || endTime.value.isAtSameMomentAs(newStartTime)) {
        endTime.value = newStartTime.add(const Duration(hours: 1));
      }
    }

    Future<void> selectEndTime() async {
      final date = await showDatePicker(
        context: context,
        initialDate: endTime.value,
        firstDate: startTime.value,
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );

      if (date == null) return;

      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(endTime.value),
      );

      if (time == null) return;

      final newEndTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      
      // Ensure end time is after start time
      if (newEndTime.isAfter(startTime.value)) {
        endTime.value = newEndTime;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('End time must be after start time')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedSportType.value,
                decoration: const InputDecoration(
                  labelText: 'Sport Type',
                  border: OutlineInputBorder(),
                ),
                items: sportTypes.map((sport) {
                  return DropdownMenuItem(
                    value: sport,
                    child: Text(sport),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedSportType.value = value;
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: 'Note (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: capacityController,
                decoration: const InputDecoration(
                  labelText: 'Capacity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a capacity';
                  }
                  final capacity = int.tryParse(value);
                  if (capacity == null || capacity < 1) {
                    return 'Please enter a valid capacity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Start Time'),
                subtitle: Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(startTime.value),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: selectStartTime,
              ),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('End Time'),
                subtitle: Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(endTime.value),
                ),
                trailing: const Icon(Icons.access_time),
                onTap: selectEndTime,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Invite Only'),
                subtitle: const Text('Users must request to join'),
                value: isInviteOnly.value,
                onChanged: (value) => isInviteOnly.value = value,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isLoading.value ? null : handleSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Create Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


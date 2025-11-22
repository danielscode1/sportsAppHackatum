import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/models/event_model.dart';
import '../../../common/repositories/events_repository.dart';
import '../../../common/repositories/auth_repository.dart';
import '../../auth/providers/auth_provider.dart';
import '../../map/providers/map_provider.dart';

class EventEditScreen extends HookConsumerWidget {
  final EventModel event;

  const EventEditScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: event.title);
    final descriptionController = useTextEditingController(text: event.description);
    final noteController = useTextEditingController(text: event.note);
    final capacityController = useTextEditingController(text: event.capacity.toString());
    final selectedSportType = useState(event.sportType);
    final startTime = useState<DateTime>(event.startTime);
    final endTime = useState<DateTime>(event.endTime);
    final isLoading = useState(false);
    final isInviteOnly = useState(event.isInviteOnly);
    final imageUrls = useState<List<String>>(List.from(event.imageUrls));
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final authState = ref.watch(authStateProvider);
    final eventsRepo = ref.watch(eventsRepositoryProvider);
    final authRepo = ref.watch(authRepositoryProvider);

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
      if (user == null || user.uid != event.hostId) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You can only edit your own events')),
        );
        return;
      }

      isLoading.value = true;
      try {
        final capacity = int.tryParse(capacityController.text) ?? 20;

        final updatedEvent = event.copyWith(
          title: titleController.text.trim(),
          sportType: selectedSportType.value,
          description: descriptionController.text.trim(),
          note: noteController.text.trim(),
          startTime: startTime.value,
          endTime: endTime.value,
          capacity: capacity,
          isInviteOnly: isInviteOnly.value,
          imageUrls: imageUrls.value,
        );

        await eventsRepo.updateEvent(updatedEvent);

        if (context.mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Event updated successfully')),
          );
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
      
      if (newEndTime.isAfter(startTime.value)) {
        endTime.value = newEndTime;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('End time must be after start time')),
        );
      }
    }

    Future<void> pickImage() async {
      // Check authentication
      final user = authState.value;
      if (user == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You must be logged in to upload images'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      // Limit to 6 images
      if (imageUrls.value.length >= 6) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Maximum 6 images allowed')),
          );
        }
        return;
      }

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85, // Compress image to reduce upload time
      );
      if (pickedFile != null) {
        try {
          isLoading.value = true;
          
          // Show progress indicator
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Uploading image...'),
                duration: Duration(seconds: 1),
              ),
            );
          }
          
          final imageUrl = await eventsRepo.uploadEventImage(
            event.id,
            pickedFile,
            imageUrls.value.length,
          );
          
          imageUrls.value = [...imageUrls.value, imageUrl];
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Image uploaded successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error uploading image: ${e.toString()}'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 5),
              ),
            );
          }
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Event'),
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
                    child: Text(sport.toUpperCase()),
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
                title: const Text('Invite Only Event'),
                value: isInviteOnly.value,
                onChanged: (value) => isInviteOnly.value = value,
              ),
              const SizedBox(height: 16),
              const Text(
                'Event Images',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (imageUrls.value.isNotEmpty)
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.value.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(imageUrls.value[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 12,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                imageUrls.value = imageUrls.value
                                    .where((url) => url != imageUrls.value[index])
                                    .toList();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: imageUrls.value.length >= 6 ? null : pickImage,
                icon: const Icon(Icons.add_photo_alternate),
                label: Text('Add Image (${imageUrls.value.length}/6)'),
              ),
              if (imageUrls.value.length >= 6)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Maximum 6 images reached',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12,
                    ),
                  ),
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
                    : const Text('Update Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


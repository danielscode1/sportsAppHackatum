import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapFilters {
  final bool showEvents;
  final bool showToilets;
  final bool showWaterSupply;

  const MapFilters({
    this.showEvents = true,
    this.showToilets = false,
    this.showWaterSupply = false,
  });

  MapFilters copyWith({
    bool? showEvents,
    bool? showToilets,
    bool? showWaterSupply,
  }) {
    return MapFilters(
      showEvents: showEvents ?? this.showEvents,
      showToilets: showToilets ?? this.showToilets,
      showWaterSupply: showWaterSupply ?? this.showWaterSupply,
    );
  }
}

final mapFiltersProvider = StateNotifierProvider<MapFiltersNotifier, MapFilters>((ref) {
  return MapFiltersNotifier();
});

class MapFiltersNotifier extends StateNotifier<MapFilters> {
  MapFiltersNotifier() : super(const MapFilters());

  void toggleEvents() {
    state = state.copyWith(showEvents: !state.showEvents);
  }

  void toggleToilets() {
    state = state.copyWith(showToilets: !state.showToilets);
  }

  void toggleWaterSupply() {
    state = state.copyWith(showWaterSupply: !state.showWaterSupply);
  }
}


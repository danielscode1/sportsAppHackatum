import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapFilters {
  final bool showEvents;
  final bool showToilets;
  final bool showWaterSupply;
  final bool showSportAreas;

  const MapFilters({
    this.showEvents = true,
    this.showToilets = true,
    this.showWaterSupply = true,
    this.showSportAreas = true,
  });

  MapFilters copyWith({
    bool? showEvents,
    bool? showToilets,
    bool? showWaterSupply,
    bool? showSportAreas,
  }) {
    return MapFilters(
      showEvents: showEvents ?? this.showEvents,
      showToilets: showToilets ?? this.showToilets,
      showWaterSupply: showWaterSupply ?? this.showWaterSupply,
      showSportAreas: showSportAreas ?? this.showSportAreas,
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

  void toggleSportAreas() {
    state = state.copyWith(showSportAreas: !state.showSportAreas);
  }
}


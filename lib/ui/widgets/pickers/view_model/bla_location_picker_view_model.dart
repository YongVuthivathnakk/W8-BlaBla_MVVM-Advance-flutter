import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:flutter/material.dart';

class BlaLocationPickerViewModel extends ChangeNotifier {
  final LocationRepository locationRepository;

  List<Location> locations = [];
  bool isLoading = true;
  String currentSearchText = "";

  BlaLocationPickerViewModel({required this.locationRepository}) {
    _init();
  }

  void _init() async {
    loadLocation();
  }

  void loadLocation() async {
    final loadedLocations = await locationRepository.fetchLocations();
    locations = loadedLocations;

    isLoading = false;
    notifyListeners();
  }

  void onSearchChanged(String search) {
    currentSearchText = search;
    notifyListeners();
  }

  List<Location> get filteredLocation {
    if (currentSearchText.length < 2) {
      return [];
    }
    // Add a list of location for the repo

    return locations
        .where(
          (location) => location.name.toUpperCase().contains(
            currentSearchText.toUpperCase(),
          ),
        )
        .toList();
  }
}

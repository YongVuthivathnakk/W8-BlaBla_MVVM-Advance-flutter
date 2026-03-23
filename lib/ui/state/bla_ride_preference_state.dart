import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class BlaRidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository ridePreferenceRepository;

  RidePreference? _selectedRidePreference;
  List<RidePreference> _ridePreferenceHistory = [];
  int maxAllowedSeats = 8;
  bool isLoading = true;

  BlaRidePreferenceState(this.ridePreferenceRepository) {
    _init();
  }

  void _init() async {
    loadHistory();
  }

  List<RidePreference> get ridePreferenceHistory => _ridePreferenceHistory;
  RidePreference? get selectedRidePreference => _selectedRidePreference;

  void loadHistory() async {
    final history = await ridePreferenceRepository.fetchRidePreferences();
    _ridePreferenceHistory = history;
    isLoading = false;
    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    if (preference != _selectedRidePreference) {
      // Set the selected preference
      _selectedRidePreference = preference;

      // Push to history
      _addPreferenceToHistory(preference);

      notifyListeners();
    }
  }

  void _addPreferenceToHistory(RidePreference preference) {
    _ridePreferenceHistory.add(preference);
  }
}

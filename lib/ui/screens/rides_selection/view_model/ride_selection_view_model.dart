import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/state/bla_ride_preference_state.dart';
import 'package:flutter/material.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final BlaRidePreferenceState _ridePreferenceState;
  final RideRepository _rideRepository;
  List<Ride> _rides = [];
  bool isLoading = true;

  RideSelectionViewModel(this._ridePreferenceState, this._rideRepository) {
    _ridePreferenceState.addListener(notifyListeners);
    _init();
  }

  // Getter
  RidePreference? get selectedPreference =>
      _ridePreferenceState.selectedRidePreference;

  List<Ride> get rides => _rides;

  // Init functions
  void _init() async {
    loadRides();
  }

  void loadRides() async {
    _rides = await _rideRepository.fetchRides();
    isLoading = false;
    notifyListeners();
  }

  // Functions

  List<Ride> get matchedRides {
    return _rides
        .where(
          (ride) =>
              ride.departureDate == selectedPreference!.departureDate &&
              ride.arrivalLocation == selectedPreference!.arrival &&
              ride.availableSeats >= selectedPreference!.requestedSeats,
        )
        .toList();
  }

  void selectPreference(RidePreference preference) {
    _ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}

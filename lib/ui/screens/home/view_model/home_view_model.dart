import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/state/bla_ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final BlaRidePreferenceState _ridePreferenceState;
  HomeViewModel(this._ridePreferenceState) {
    _ridePreferenceState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get selectedPreference =>
      _ridePreferenceState.selectedRidePreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.ridePreferenceHistory.reversed.toList();

  void selectRidePreference(RidePreference preference) {
    _ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}

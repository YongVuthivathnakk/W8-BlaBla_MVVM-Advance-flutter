import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/state/bla_ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RideSelectionViewModel>(
      create: (ctx) => RideSelectionViewModel(
        ctx.read<BlaRidePreferenceState>(),
        ctx.read<RideRepository>(),
      ),
    );
  }
}

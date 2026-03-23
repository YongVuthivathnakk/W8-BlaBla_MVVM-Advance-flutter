import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/ride_preference/ride_preference_modal.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<RideSelectionViewModel>();

    void onBackTap() {
      Navigator.pop(context);
    }

    void onFilterPressed() {
      // TODO
    }

    void onRideSelected(Ride ride) {
      // Later
    }

    void onPreferencePressed() async {
      // 1 - Navigate to the rides preference picker

      RidePreference? newPreference = await Navigator.of(context)
          .push<RidePreference>(
            AnimationUtils.createRightToLeftRoute(
              RidePreferenceModal(initialPreference: mv.selectedPreference),
            ),
          );

      if (newPreference != null) {
        // 2 - Ask the service to update the current preference
        mv.selectPreference(newPreference);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: mv.selectedPreference!,
              onBackPressed: onBackTap,
              onFilterPressed: onFilterPressed,
              onPreferencePressed: onPreferencePressed,
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: mv.matchedRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: mv.matchedRides[index],
                  onPressed: () => onRideSelected(mv.matchedRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

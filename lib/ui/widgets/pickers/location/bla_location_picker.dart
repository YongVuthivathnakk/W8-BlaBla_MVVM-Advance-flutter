import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:blabla/ui/widgets/pickers/view_model/bla_location_picker_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/ride/locations.dart';
import '../../../theme/theme.dart';

///
/// A  Location Picker is a view to pick a Location:
///

class BlaLocationPicker extends StatelessWidget {
  final Location? initLocation;
  const BlaLocationPicker({super.key, this.initLocation});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BlaLocationPickerViewModel(
        locationRepository: context.read<LocationRepository>(),
      ),
      child: BlaLocationPickerContent(),
    );
  }
}

class BlaLocationPickerContent extends StatelessWidget {
  final Location? initLocation;
  const BlaLocationPickerContent({super.key, this.initLocation});

  @override
  Widget build(BuildContext context) {
    BlaLocationPickerViewModel mv = context.watch<BlaLocationPickerViewModel>();

    void onBackTap() {
      Navigator.pop(context);
    }

    void onTap(Location location) {
      Navigator.pop<Location>(context, location);
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
            LocationSearchBar(
              initSearch: initLocation?.name ?? "", // if empty show ""
              onBackTap: () => onBackTap(),
              onSearchChanged: mv.onSearchChanged,
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: mv.filteredLocation.length,
                itemBuilder: (context, index) => LocationTile(
                  location: mv.filteredLocation[index],
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({
    super.key,
    required this.onBackTap,
    required this.onSearchChanged,
    required this.initSearch,
  });

  final String initSearch;
  final VoidCallback onBackTap;
  final ValueChanged<String> onSearchChanged;

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void onClearTap() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initSearch;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get searchIsNotEmpty => _searchController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BlaColors.greyLight,
      ),
      child: Row(
        children: [
          // BACK ICON
          IconButton(
            onPressed: widget.onBackTap,
            icon: Icon(
              Icons.arrow_back_ios,
              color: BlaColors.iconLight,
              size: 16,
            ),
          ),

          // TEXT FILED
          Expanded(
            child: TextField(
              focusNode: _focusNode, // Keep focus
              controller: _searchController,
              onChanged: widget.onSearchChanged,
              style: TextStyle(color: BlaColors.textLight),
              decoration: InputDecoration(
                hintText: "Any city, street...",
                border: InputBorder.none, // No border
                filled: false, // No background fill
              ),
            ),
          ),

          // CLOSE ICON
          searchIsNotEmpty
              ? IconButton(
                  onPressed: onClearTap,
                  icon: Icon(Icons.close, color: BlaColors.iconLight, size: 16),
                )
              : SizedBox.shrink(), // Hides the icon if text field is empty
        ],
      ),
    );
  }
}

class LocationTile extends StatelessWidget {
  const LocationTile({super.key, required this.location, required this.onTap});

  final Location location;

  final ValueChanged<Location> onTap;

  String get title => location.name;

  String get subTitle => location.country.name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTap(location),
          leading: Icon(Icons.history, color: BlaColors.iconLight),

          title: Text(title, style: BlaTextStyles.body),
          subtitle: Text(
            subTitle,
            style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            color: BlaColors.iconLight,
            size: 16,
          ),
        ),
        BlaDivider(),
      ],
    );
  }
}

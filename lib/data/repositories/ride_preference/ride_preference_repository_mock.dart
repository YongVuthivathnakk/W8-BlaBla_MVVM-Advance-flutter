import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  @override
  Future<List<RidePreference>> fetchRidePreferences() async {
    return Future.delayed(Duration(seconds: 3), () => fakeRidePrefs);
  }
}

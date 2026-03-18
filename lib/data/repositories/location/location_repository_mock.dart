import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';

class LocationRepositoryMock implements LocationRepository {
  // Fake Cities
  final List<Location> _fakeLocations = [
    // UK Cities
    Location(name: "London", country: Country.uk),
    Location(name: "Manchester", country: Country.uk),
    Location(name: "Birmingham", country: Country.uk),
    Location(name: "Liverpool", country: Country.uk),
    Location(name: "Leeds", country: Country.uk),
    Location(name: "Glasgow", country: Country.uk),
    Location(name: "Sheffield", country: Country.uk),
    Location(name: "Bristol", country: Country.uk),
    Location(name: "Edinburgh", country: Country.uk),
    Location(name: "Leicester", country: Country.uk),
    Location(name: "Coventry", country: Country.uk),
    Location(name: "Nottingham", country: Country.uk),
    Location(name: "Newcastle", country: Country.uk),
    Location(name: "Southampton", country: Country.uk),
    Location(name: "Portsmouth", country: Country.uk),
    Location(name: "Aberdeen", country: Country.uk),
    Location(name: "Swansea", country: Country.uk),
    Location(name: "Oxford", country: Country.uk),
    Location(name: "Cambridge", country: Country.uk),

    // France Cities
    Location(name: "Paris", country: Country.france),
    Location(name: "Lyon", country: Country.france),
    Location(name: "Marseille", country: Country.france),
    Location(name: "Toulouse", country: Country.france),
    Location(name: "Nice", country: Country.france),
    Location(name: "Nantes", country: Country.france),
    Location(name: "Strasbourg", country: Country.france),
    Location(name: "Montpellier", country: Country.france),
    Location(name: "Bordeaux", country: Country.france),
    Location(name: "Lille", country: Country.france),
    Location(name: "Rennes", country: Country.france),
    Location(name: "Reims", country: Country.france),
    Location(name: "Saint-Étienne", country: Country.france),
    Location(name: "Toulon", country: Country.france),
    Location(name: "Angers", country: Country.france),
    Location(name: "Grenoble", country: Country.france),
    Location(name: "Dijon", country: Country.france),
    Location(name: "Le Havre", country: Country.france),
    Location(name: "Brest", country: Country.france),
  ];

  @override
  Future<List<Location>> fetchLocations() async {
    return Future.delayed(Duration(seconds: 3), () {
      return _fakeLocations;
    });
  }
}

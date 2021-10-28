import 'dart:math';
import 'planet.dart';

class PlanetarySystem {
  final Random _random = Random();
  final String name;
  final List<Planet> planets;

  PlanetarySystem({this.name = "Unnamed System", this.planets = const []});

  static PlanetarySystem fromMap(Map<String, dynamic> jsonMap) {
    return PlanetarySystem(
        name: jsonMap['name'], 
        planets: Planet.fromMaps(jsonMap['planets'])
    );
  }

  int get numberOfPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

  Planet randomPlanet() {
    if (!hasPlanets) return Planet.nullPlanet(); // guard clause
    return planets[_random.nextInt(planets.length)];
  }

  Planet planetWithName(String name) {
    return planets.firstWhere((planet) => planet.name == name,
        orElse: () => Planet.nullPlanet());
  }
}

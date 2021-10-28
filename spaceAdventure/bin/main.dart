import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

const systemName = 'Solar System';
const planetData = {
  'Mercury': 'A very hot planet, closest to the sun.',
  'Venus': 'It\'s very cloudy here!',
  'Earth': 'There is something very familiar about this planet.',
  'Mars': 'Known as the red planet.',
  'Jupiter': 'A gas giant, with a noticeable red spot.',
  'Saturn': 'This planet has beautiful rings around it.',
  'Uranus': 'Strangely, this planet rotates around on its side.',
  'Neptune': 'A very cold planet, furthest from the sun.',
  'Pluto': 'I don\'t care what they say - it\'s a planet.'
};

//void main(List<String> args) {
//  SpaceAdventure(
//          planetarySystem:
//              PlanetarySystem(name: systemName, planets: mockPlanets()))
//      .start();
//}

void main(List<String> args) {
  String filename = args[0];
  String contents = File(filename).readAsStringSync();
  SpaceAdventure(planetarySystem: PlanetarySystem.fromMap(jsonDecode(contents)))
      .start();
} 

/*
List<Planet> mockPlanets() {
  return planetData.entries
      .map((e) => Planet(name: e.key, description: e.value))
      .toList();
} */

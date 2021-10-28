class Planet {
  final String name;
  final String description;

  Planet({required this.name, required this.description});

  Planet.nullPlanet() : name = 'Null', description = 'Null Planet';

  static List<Planet> fromMaps(Iterable planetMaps) {
    return List<Planet>.from(
      planetMaps.map(
        (item) => Planet(name: item['name'], description: item['description'])
      )
    );
  }
}

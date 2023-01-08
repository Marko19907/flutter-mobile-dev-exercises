class Animal {
  final String name;
  final int legCount;
  final bool hasWings;

  Animal({required this.name, required this.legCount, this.hasWings = false});

  bool canFly() {
    return hasWings;
  }
}

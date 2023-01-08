import 'package:exercise_e2/animal.dart';

class FlyingAnimal extends Animal {
  final double flyingSpeed;

  FlyingAnimal(name, [this.flyingSpeed = 3.14])
      : super(name: name, legCount: 2, hasWings: true);

  void fly() {
    print("$name is flying at ${flyingSpeed}m/s");
  }
}
